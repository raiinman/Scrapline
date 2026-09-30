using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Fortnite.com/UI }
using { /Verse.org/Simulation }
using { /Verse.org/Simulation/Tags }
using { /Verse.org/Colors }
using { /UnrealEngine.com/Temporary/UI }
using { /UnrealEngine.com/Temporary/SpatialMath }

ArmoryText<localizes>(Text:string):message = "{Text}"

armory_granter_tag := class(tag){}
armory_economy_tag := class(tag){}
armory_input_tag := class(tag){}

armory_catalog_item := class<concrete>:
    @editable
    StableId:string = ""

    @editable
    DisplayName:string = ""

    # 0 = Primary, 1 = Secondary, 2 = Sidearm
    @editable
    Category:int = 0

    @editable
    Price:int = 0

    @editable
    ItemIndex:int = 0

    @editable
    Enabled:logic = true

    @editable
    Featured:logic = false

    @editable
    SeasonalTag:string = ""

    @editable
    SortOrder:int = 0

armory_player_state := class:
    var Bank:int = 3000
    var DeathStreak:int = 0

    var PendingPrimary:int = -1
    var PendingSecondary:int = -1
    var PendingSidearm:int = -1

    var PreviousPrimary:int = -1
    var PreviousSecondary:int = -1
    var PreviousSidearm:int = -1

    var QueuedPrimary:int = -1
    var QueuedSecondary:int = -1
    var QueuedSidearm:int = -1
    var HasQueued:logic = false

    var NeedsGrant:logic = false
    var HoldForShop:logic = true
    var MinimumOpeningReady:logic = true
    var ShopReason:int = 0
    var ShopDeadline:float = 0.0

armory_ui_state := class:
    Root:canvas
    BankText:text_block
    PrimaryText:text_block
    SecondaryText:text_block
    SidearmText:text_block
    TotalText:text_block
    CountdownText:text_block
    StatusText:text_block
    ReadyButton:button_loud
    RebuyButton:button_loud
    ClosedEvent:event() = event(){}

scrapline_armory_device := class(creative_device):

    # Runtime-discovered through Verse Tag Markup. No brittle device @editable wiring.
    var ArmoryGranter:?item_granter_device = false
    var EconomyEliminations:?elimination_manager_device = false
    var ArmoryInput:?input_trigger_device = false

    @editable
    Catalog:[]armory_catalog_item = array{
        armory_catalog_item{StableId := "pistol", DisplayName := "Pistol", Category := 2, Price := 0, ItemIndex := 0, SortOrder := 0},
        armory_catalog_item{StableId := "suppressed_pistol", DisplayName := "Suppressed Pistol", Category := 2, Price := 500, ItemIndex := 1, SortOrder := 1},
        armory_catalog_item{StableId := "stinger_smg", DisplayName := "Stinger SMG", Category := 1, Price := 1000, ItemIndex := 2, SortOrder := 2},
        armory_catalog_item{StableId := "thunder_shotgun", DisplayName := "Thunder Shotgun", Category := 0, Price := 1400, ItemIndex := 3, SortOrder := 3},
        armory_catalog_item{StableId := "assault_rifle", DisplayName := "Assault Rifle", Category := 0, Price := 1700, ItemIndex := 4, SortOrder := 4},
        armory_catalog_item{StableId := "infantry_rifle", DisplayName := "Infantry Rifle", Category := 0, Price := 2100, ItemIndex := 5, SortOrder := 5},
        armory_catalog_item{StableId := "bolt_sniper", DisplayName := "Bolt-Action Sniper Rifle", Category := 0, Price := 3800, ItemIndex := 6, Featured := true, SeasonalTag := "PREMIUM", SortOrder := 6}
    }

    @editable
    StarterPrimaryCatalogIndex:int = 4

    @editable
    StarterSecondaryCatalogIndex:int = 2

    @editable
    StarterSidearmCatalogIndex:int = 0

    @editable
    FallbackSidearmCatalogIndex:int = 0

    StartingBank:int = 3000
    BankCap:int = 5000
    EliminationReward:int = 150
    OpeningPhaseSeconds:float = 45.0
    JipBuySeconds:float = 12.0
    DeathShopSeconds:float = 8.0

    var OpeningPhaseActive:logic = true
    var OpeningPhaseEndsAt:float = 0.0
    var PlayerStates:[player]armory_player_state = map{}
    var PlayerUIs:[player]armory_ui_state = map{}

    OnBegin<override>()<suspends>:void=
        DevicesReady := DiscoverTaggedDevices()
        if (not DevicesReady?):
            Print("SCRAPLINE ARMORY: expected exactly one tagged granter, economy manager, and input trigger")
            return

        set OpeningPhaseEndsAt = GetSimulationElapsedTime() + OpeningPhaseSeconds

        if (Input := ArmoryInput?):
            Input.Enable()
            Input.PressedEvent.Subscribe(OnArmoryPressed)

        for (Player : GetPlayspace().GetPlayers()):
            InitializePlayer(Player, true)

        GetPlayspace().PlayerAddedEvent().Subscribe(OnPlayerAdded)
        GetPlayspace().PlayerRemovedEvent().Subscribe(OnPlayerRemoved)

        if (Economy := EconomyEliminations?):
            Economy.EliminationEvent.Subscribe(OnElimination)
            Economy.EliminatedEvent.Subscribe(OnEliminated)

        spawn{OpeningPhaseTimer()}

    DiscoverTaggedDevices():logic=
        var GranterCount:int = 0
        var EconomyCount:int = 0
        var InputCount:int = 0

        for (Obj : FindCreativeObjectsWithTag(armory_granter_tag), Granter := item_granter_device[Obj]):
            set ArmoryGranter = option{Granter}
            set GranterCount += 1

        for (Obj : FindCreativeObjectsWithTag(armory_economy_tag), Economy := elimination_manager_device[Obj]):
            set EconomyEliminations = option{Economy}
            set EconomyCount += 1

        for (Obj : FindCreativeObjectsWithTag(armory_input_tag), Input := input_trigger_device[Obj]):
            set ArmoryInput = option{Input}
            set InputCount += 1

        if:
            GranterCount = 1
            EconomyCount = 1
            InputCount = 1
        then:
            return true

        return false

    InitializePlayer(Player:player, PresentAtStart:logic):void=
        if (Existing := PlayerStates[Player]):
            return

        State := armory_player_state{}
        set State.Bank = StartingBank
        set State.PendingPrimary = StarterPrimaryCatalogIndex
        set State.PendingSecondary = StarterSecondaryCatalogIndex
        set State.PendingSidearm = StarterSidearmCatalogIndex
        set State.ShopReason = 1

        if (PresentAtStart?):
            set State.MinimumOpeningReady = true
            set State.ShopDeadline = OpeningPhaseEndsAt
        else:
            set State.MinimumOpeningReady = false
            if (OpeningPhaseActive?):
                PersonalMinimum := GetSimulationElapsedTime() + JipBuySeconds
                if (PersonalMinimum > OpeningPhaseEndsAt):
                    set State.ShopDeadline = PersonalMinimum
                else:
                    set State.ShopDeadline = OpeningPhaseEndsAt
            else:
                set State.ShopReason = 3
                set State.ShopDeadline = GetSimulationElapsedTime() + JipBuySeconds

        if (set PlayerStates[Player] = State):
            if (Input := ArmoryInput?):
                Input.Register(Player)
            HoldPlayer(Player)
            spawn{HoldCharacterWhenReady(Player)}
            spawn{OpenArmorySoon(Player)}

            if (not PresentAtStart?):
                if (OpeningPhaseActive?):
                    spawn{OpeningJipMinimum(Player)}
                else:
                    spawn{ActiveJipTimeout(Player)}

    OnPlayerAdded(Player:player):void=
        InitializePlayer(Player, false)

    OnPlayerRemoved(Player:player):void=
        if (Input := ArmoryInput?):
            Input.Unregister(Player)
        RemoveArmoryUI(Player)

        var NewStates:[player]armory_player_state = map{}
        for (Key -> Value : PlayerStates, Key <> Player):
            set NewStates = ConcatenateMaps(NewStates, map{Key => Value})
        set PlayerStates = NewStates

    OnElimination(MaybeAgent:?agent):void=
        if (Agent := MaybeAgent?, Player := player[Agent], State := PlayerStates[Player]):
            AddScrap(State, EliminationReward)
            set State.DeathStreak = 0
            RefreshArmoryUI(Player)

    OnEliminated(Agent:agent):void=
        if (Player := player[Agent], State := PlayerStates[Player]):
            AddDeathRecovery(State)

            HadQueued := State.HasQueued
            PrepareDeathCart(State)

            if (HadQueued?):
                QueuedCommit := CommitPending(Player, State)
                if (QueuedCommit?):
                    return

            set State.HoldForShop = true
            set State.ShopReason = 2
            set State.ShopDeadline = GetSimulationElapsedTime() + DeathShopSeconds
            spawn{HoldCharacterWhenReady(Player)}
            spawn{OpenArmorySoon(Player)}
            spawn{DeathShopTimeout(Player)}

    OnArmoryPressed(Agent:agent):void=
        if (Player := player[Agent], State := PlayerStates[Player]):
            if (OpeningPhaseActive?):
                set State.ShopReason = 1
            else:
                # During combat this edits NEXT LOADOUT only.
                PrepareNextCart(State)
                set State.ShopReason = 4
                set State.ShopDeadline = 0.0
            OpenArmory(Player)

    OpeningPhaseTimer()<suspends>:void=
        Sleep(OpeningPhaseSeconds)
        set OpeningPhaseActive = false

        for (Player -> State : PlayerStates):
            if (State.MinimumOpeningReady?):
                CommitOrFallback(Player, State)

    OpeningJipMinimum(Player:player)<suspends>:void=
        Sleep(JipBuySeconds)

        if (State := PlayerStates[Player]):
            set State.MinimumOpeningReady = true
            if (not OpeningPhaseActive?):
                CommitOrFallback(Player, State)

    ActiveJipTimeout(Player:player)<suspends>:void=
        Sleep(JipBuySeconds)

        if (State := PlayerStates[Player], State.ShopReason = 3):
            CommitOrFallback(Player, State)

    DeathShopTimeout(Player:player)<suspends>:void=
        Sleep(DeathShopSeconds)

        if (State := PlayerStates[Player], State.ShopReason = 2):
            CommitOrFallback(Player, State)

    AddDeathRecovery(State:armory_player_state):void=
        var Recovery:int = 1500

        if (State.DeathStreak = 1):
            set Recovery = 1750
        else if (State.DeathStreak >= 2):
            set Recovery = 2000

        AddScrap(State, Recovery)

        if (State.DeathStreak < 2):
            set State.DeathStreak += 1

    AddScrap(State:armory_player_state, Amount:int):void=
        var NewBank:int = State.Bank + Amount
        if (NewBank > BankCap):
            set NewBank = BankCap
        if (NewBank < 0):
            set NewBank = 0
        set State.Bank = NewBank

    PrepareDeathCart(State:armory_player_state):void=
        if (State.HasQueued?):
            set State.PendingPrimary = State.QueuedPrimary
            set State.PendingSecondary = State.QueuedSecondary
            set State.PendingSidearm = State.QueuedSidearm
        else:
            set State.PendingPrimary = State.PreviousPrimary
            set State.PendingSecondary = State.PreviousSecondary
            set State.PendingSidearm = State.PreviousSidearm

    PrepareNextCart(State:armory_player_state):void=
        if (State.HasQueued?):
            set State.PendingPrimary = State.QueuedPrimary
            set State.PendingSecondary = State.QueuedSecondary
            set State.PendingSidearm = State.QueuedSidearm
        else:
            set State.PendingPrimary = State.PreviousPrimary
            set State.PendingSecondary = State.PreviousSecondary
            set State.PendingSidearm = State.PreviousSidearm

    CommitOrFallback(Player:player, State:armory_player_state):void=
        FirstCommit := CommitPending(Player, State)
        if (FirstCommit?):
            return

        set State.PendingPrimary = -1
        set State.PendingSecondary = -1
        set State.PendingSidearm = FallbackSidearmCatalogIndex

        FallbackCommit := CommitPending(Player, State)
        if (FallbackCommit?):
            return

        # Final fail-safe: never grant the wrong item when catalog configuration is invalid.
        set State.HoldForShop = false
        set State.ShopReason = 0
        set State.ShopDeadline = 0.0
        RemoveArmoryUI(Player)
        ReleasePlayer(Player)

    CommitPending(Player:player, State:armory_player_state):logic=
        CartValid := IsValidCart(State)
        if (not CartValid?):
            return false

        Total := GetPendingTotal(State)
        if (Total > State.Bank):
            return false

        set State.Bank -= Total
        set State.PreviousPrimary = State.PendingPrimary
        set State.PreviousSecondary = State.PendingSecondary
        set State.PreviousSidearm = State.PendingSidearm
        set State.QueuedPrimary = -1
        set State.QueuedSecondary = -1
        set State.QueuedSidearm = -1
        set State.HasQueued = false
        set State.NeedsGrant = true
        set State.HoldForShop = false
        set State.ShopReason = 0
        set State.ShopDeadline = 0.0

        RemoveArmoryUI(Player)
        spawn{GrantWhenCharacterReady(Player)}

        return true

    IsValidCart(State:armory_player_state):logic=
        if (State.PendingPrimary >= 0):
            PrimaryValid := IsValidCatalogSelection(State.PendingPrimary, 0)
            if (not PrimaryValid?):
                return false

        if (State.PendingSecondary >= 0):
            SecondaryValid := IsValidCatalogSelection(State.PendingSecondary, 1)
            if (not SecondaryValid?):
                return false

        if (State.PendingSidearm >= 0):
            SidearmValid := IsValidCatalogSelection(State.PendingSidearm, 2)
            if (not SidearmValid?):
                return false

        if (State.PendingPrimary < 0, State.PendingSecondary < 0, State.PendingSidearm < 0):
            return false

        return true

    IsValidCatalogSelection(CatalogIndex:int, RequiredCategory:int):logic=
        if (Entry := Catalog[CatalogIndex]):
            if (Entry.Enabled?, Entry.Category = RequiredCategory, Entry.Price >= 0, Entry.ItemIndex >= 0):
                return true
        return false

    GetPendingTotal(State:armory_player_state):int=
        return GetCatalogPrice(State.PendingPrimary) + GetCatalogPrice(State.PendingSecondary) + GetCatalogPrice(State.PendingSidearm)

    GetCatalogPrice(CatalogIndex:int):int=
        if (CatalogIndex >= 0, Entry := Catalog[CatalogIndex], Entry.Enabled?, Entry.Price >= 0):
            return Entry.Price
        return 0

    GetCatalogName(CatalogIndex:int):string=
        if (CatalogIndex >= 0, Entry := Catalog[CatalogIndex], Entry.Enabled?):
            return Entry.DisplayName
        return "—"

    GrantCommittedLoadout(Player:player, State:armory_player_state):void=
        GrantCatalogSelection(Player, State.PreviousPrimary)
        GrantCatalogSelection(Player, State.PreviousSecondary)
        GrantCatalogSelection(Player, State.PreviousSidearm)
        set State.NeedsGrant = false

    GrantCatalogSelection(Player:player, CatalogIndex:int):void=
        if:
            Granter := ArmoryGranter?
            CatalogIndex >= 0
            Entry := Catalog[CatalogIndex]
            Entry.Enabled?
            Entry.ItemIndex >= 0
        then:
            Granter.GrantItemIndex(Player, Entry.ItemIndex)

    HoldCharacterWhenReady(Player:player)<suspends>:void=
        loop:
            if (State := PlayerStates[Player]):
                if (not State.HoldForShop?):
                    return

                if (FortChar := Player.GetFortCharacter[], FortChar.IsActive[]):
                    HoldPlayer(Player)
                    return
            else:
                return

            Sleep(0.1)

    GrantWhenCharacterReady(Player:player)<suspends>:void=
        loop:
            if (State := PlayerStates[Player]):
                if (not State.NeedsGrant?):
                    return

                if (FortChar := Player.GetFortCharacter[], FortChar.IsActive[]):
                    GrantCommittedLoadout(Player, State)
                    ReleasePlayer(Player)
                    return
            else:
                return

            Sleep(0.1)

    HoldPlayer(Player:player):void=
        if (FortChar := Player.GetFortCharacter[]):
            FortChar.SetVulnerability(false)
            FortChar.PutInStasis(stasis_args{
                AllowTurning := true,
                AllowFalling := false,
                AllowEmotes := false
            })

    ReleasePlayer(Player:player):void=
        if (FortChar := Player.GetFortCharacter[]):
            FortChar.ReleaseFromStasis()
            FortChar.SetVulnerability(true)

    OpenArmorySoon(Player:player)<suspends>:void=
        Sleep(0.0)
        OpenArmory(Player)

    OpenArmory(Player:player):void=
        if (State := PlayerStates[Player], PlayerUI := GetPlayerUI[Player]):
            RemoveArmoryUI(Player)

            UI := CreateArmoryUI(Player, State)
            PlayerUI.AddWidget(UI.Root, player_ui_slot{InputMode := ui_input_mode.All})

            if (set PlayerUIs[Player] = UI):
                RefreshArmoryUI(Player)
                spawn{AwaitReady(Player, UI)}
                spawn{AwaitRebuy(Player, UI)}
                spawn{RunCountdown(Player, UI)}

    RemoveArmoryUI(Player:player):void=
        if (UI := PlayerUIs[Player]):
            UI.ClosedEvent.Signal()

            if (PlayerUI := GetPlayerUI[Player]):
                PlayerUI.RemoveWidget(UI.Root)

            var NewUIs:[player]armory_ui_state = map{}
            for (Key -> Value : PlayerUIs, Key <> Player):
                set NewUIs = ConcatenateMaps(NewUIs, map{Key => Value})
            set PlayerUIs = NewUIs

    CreateArmoryUI(Player:player, State:armory_player_state):armory_ui_state=
        BankText := text_block{DefaultText := ArmoryText("SCRAP")}
        PrimaryText := text_block{DefaultText := ArmoryText("PRIMARY")}
        SecondaryText := text_block{DefaultText := ArmoryText("SECONDARY")}
        SidearmText := text_block{DefaultText := ArmoryText("SIDEARM")}
        TotalText := text_block{DefaultText := ArmoryText("CART")}
        CountdownText := text_block{DefaultText := ArmoryText("")}
        StatusText := text_block{DefaultText := ArmoryText(GetReasonText(State.ShopReason))}

        ReadyLabel := if (State.ShopReason = 4) then "QUEUE NEXT LOADOUT" else if (State.ShopReason = 1) then "READY" else "DEPLOY"
        ReadyButton := button_loud{DefaultText := ArmoryText(ReadyLabel)}
        RebuyButton := button_loud{DefaultText := ArmoryText("REBUY LAST LOADOUT")}

        PrimaryList := stack_box{Orientation := orientation.Vertical}
        SecondaryList := stack_box{Orientation := orientation.Vertical}
        SidearmList := stack_box{Orientation := orientation.Vertical}

        PrimaryList.AddWidget(stack_box_slot{Widget := text_block{DefaultText := ArmoryText("PRIMARY")}})
        SecondaryList.AddWidget(stack_box_slot{Widget := text_block{DefaultText := ArmoryText("SECONDARY")}})
        SidearmList.AddWidget(stack_box_slot{Widget := text_block{DefaultText := ArmoryText("SIDEARM")}})

        Categories := stack_box:
            Orientation := orientation.Horizontal
            Slots := array:
                stack_box_slot:
                    Widget := PrimaryList
                    Padding := margin{Right := 24.0}
                stack_box_slot:
                    Widget := SecondaryList
                    Padding := margin{Left := 24.0, Right := 24.0}
                stack_box_slot:
                    Widget := SidearmList
                    Padding := margin{Left := 24.0}

        Summary := stack_box:
            Orientation := orientation.Vertical
            Slots := array:
                stack_box_slot{Widget := BankText}
                stack_box_slot{Widget := PrimaryText}
                stack_box_slot{Widget := SecondaryText}
                stack_box_slot{Widget := SidearmText}
                stack_box_slot{Widget := TotalText}
                stack_box_slot{Widget := CountdownText}
                stack_box_slot{Widget := StatusText}

        Actions := stack_box:
            Orientation := orientation.Horizontal
            Slots := array:
                stack_box_slot:
                    Widget := ReadyButton
                    Padding := margin{Right := 10.0}
                stack_box_slot:
                    Widget := RebuyButton
                    Padding := margin{Left := 10.0}

        MainStack := stack_box:
            Orientation := orientation.Vertical
            Slots := array:
                stack_box_slot:
                    Widget := text_block{DefaultText := ArmoryText("SCRAPLINE // ARMORY")}
                    HorizontalAlignment := horizontal_alignment.Center
                    Padding := margin{Bottom := 14.0}
                stack_box_slot:
                    Widget := Summary
                    Padding := margin{Bottom := 16.0}
                stack_box_slot:
                    Widget := Categories
                    Padding := margin{Bottom := 18.0}
                stack_box_slot:
                    Widget := Actions
                    HorizontalAlignment := horizontal_alignment.Center

        Backdrop := color_block:
            DefaultColor := NamedColors.Black
            DefaultOpacity := 0.88
            DefaultDesiredSize := vector2{X := 1220.0, Y := 760.0}

        Panel := overlay:
            Slots := array:
                overlay_slot:
                    Widget := Backdrop
                overlay_slot:
                    Widget := MainStack
                    Padding := margin{Left := 36.0, Top := 28.0, Right := 36.0, Bottom := 28.0}

        Root := canvas:
            Slots := array:
                canvas_slot:
                    Widget := Panel
                    Anchors := anchors{
                        Minimum := vector2{X := 0.5, Y := 0.5},
                        Maximum := vector2{X := 0.5, Y := 0.5}
                    }
                    Alignment := vector2{X := 0.5, Y := 0.5}
                    SizeToContent := true

        UI := armory_ui_state:
            Root := Root
            BankText := BankText
            PrimaryText := PrimaryText
            SecondaryText := SecondaryText
            SidearmText := SidearmText
            TotalText := TotalText
            CountdownText := CountdownText
            StatusText := StatusText
            ReadyButton := ReadyButton
            RebuyButton := RebuyButton

        for (CatalogIndex -> Entry : Catalog, Entry.Enabled?):
            ButtonPrefix := if (Entry.Featured?) then "FEATURED // " else ""
            ItemButton := button_loud{DefaultText := ArmoryText("{ButtonPrefix}{Entry.DisplayName} — {Entry.Price} SCRAP")}

            if (Entry.Category = 0):
                PrimaryList.AddWidget(stack_box_slot{Widget := ItemButton, Padding := margin{Top := 4.0, Bottom := 4.0}})
                spawn{AwaitCatalogSelection(Player, UI, ItemButton, CatalogIndex)}
            else if (Entry.Category = 1):
                SecondaryList.AddWidget(stack_box_slot{Widget := ItemButton, Padding := margin{Top := 4.0, Bottom := 4.0}})
                spawn{AwaitCatalogSelection(Player, UI, ItemButton, CatalogIndex)}
            else if (Entry.Category = 2):
                SidearmList.AddWidget(stack_box_slot{Widget := ItemButton, Padding := margin{Top := 4.0, Bottom := 4.0}})
                spawn{AwaitCatalogSelection(Player, UI, ItemButton, CatalogIndex)}

        return UI

    AwaitCatalogSelection(Player:player, UI:armory_ui_state, Button:button_loud, CatalogIndex:int)<suspends>:void=
        race:
            UI.ClosedEvent.Await()
            loop:
                Message := Button.OnClick().Await()
                if (Message.Player = Player):
                    ToggleCatalogSelection(Player, CatalogIndex)

    AwaitReady(Player:player, UI:armory_ui_state)<suspends>:void=
        race:
            UI.ClosedEvent.Await()
            loop:
                Message := UI.ReadyButton.OnClick().Await()
                if (Message.Player = Player):
                    HandleReady(Player)
                    return

    AwaitRebuy(Player:player, UI:armory_ui_state)<suspends>:void=
        race:
            UI.ClosedEvent.Await()
            loop:
                Message := UI.RebuyButton.OnClick().Await()
                if (Message.Player = Player):
                    HandleRebuy(Player)
                    return

    RunCountdown(Player:player, UI:armory_ui_state)<suspends>:void=
        race:
            UI.ClosedEvent.Await()
            loop:
                if (State := PlayerStates[Player]):
                    if (State.ShopDeadline > 0.0):
                        Remaining := State.ShopDeadline - GetSimulationElapsedTime()
                        if (Remaining <= 0.0):
                            UI.CountdownText.SetText(ArmoryText("TIME: 0"))
                        else:
                            Seconds := Ceil[Remaining] or 0
                            UI.CountdownText.SetText(ArmoryText("TIME: {Seconds}s"))
                    else:
                        UI.CountdownText.SetText(ArmoryText(""))
                Sleep(1.0)

    ToggleCatalogSelection(Player:player, CatalogIndex:int):void=
        if (State := PlayerStates[Player], Entry := Catalog[CatalogIndex], Entry.Enabled?):
            var Removed:logic = false

            if (Entry.Category = 0):
                if (State.PendingPrimary = CatalogIndex):
                    set State.PendingPrimary = -1
                    set Removed = true
                else:
                    set State.PendingPrimary = CatalogIndex
            else if (Entry.Category = 1):
                if (State.PendingSecondary = CatalogIndex):
                    set State.PendingSecondary = -1
                    set Removed = true
                else:
                    set State.PendingSecondary = CatalogIndex
            else if (Entry.Category = 2):
                if (State.PendingSidearm = CatalogIndex):
                    set State.PendingSidearm = -1
                    set Removed = true
                else:
                    set State.PendingSidearm = CatalogIndex

            if (Removed?):
                SetArmoryStatus(Player, "SOLD / REMOVED {Entry.DisplayName} — uncommitted purchases refund 100%")
            else:
                SetArmoryStatus(Player, "SELECTED {Entry.DisplayName}")

            RefreshArmoryUI(Player)

    HandleReady(Player:player):void=
        if (State := PlayerStates[Player]):
            CartValid := IsValidCart(State)
            if (not CartValid?):
                SetArmoryStatus(Player, "Select at least one valid weapon.")
                return

            if (State.ShopReason = 1):
                Total := GetPendingTotal(State)
                if (Total > State.Bank):
                    SetArmoryStatus(Player, "OVER BUDGET — adjust your cart before the buy phase ends.")
                    return

                SetArmoryStatus(Player, "READY — loadout will lock when the opening phase ends.")
                RemoveArmoryUI(Player)
                return

            if (State.ShopReason = 4):
                set State.QueuedPrimary = State.PendingPrimary
                set State.QueuedSecondary = State.PendingSecondary
                set State.QueuedSidearm = State.PendingSidearm
                set State.HasQueued = true
                RemoveArmoryUI(Player)
                return

            Committed := CommitPending(Player, State)
            if (not Committed?):
                SetArmoryStatus(Player, "Cannot deploy: loadout is invalid or costs more Scrap than you have.")

    HandleRebuy(Player:player):void=
        if (State := PlayerStates[Player]):
            if (State.PreviousPrimary < 0, State.PreviousSecondary < 0, State.PreviousSidearm < 0):
                SetArmoryStatus(Player, "No previous loadout to rebuy.")
                return

            set State.PendingPrimary = State.PreviousPrimary
            set State.PendingSecondary = State.PreviousSecondary
            set State.PendingSidearm = State.PreviousSidearm

            if (State.ShopReason = 4):
                set State.QueuedPrimary = State.PreviousPrimary
                set State.QueuedSecondary = State.PreviousSecondary
                set State.QueuedSidearm = State.PreviousSidearm
                set State.HasQueued = true
                RemoveArmoryUI(Player)
                return

            if (State.ShopReason = 1):
                SetArmoryStatus(Player, "No previous-life purchase exists during the opening phase.")
                RefreshArmoryUI(Player)
                return

            Committed := CommitPending(Player, State)
            if (not Committed?):
                SetArmoryStatus(Player, "You cannot afford your previous loadout. Change the cart.")

    RefreshArmoryUI(Player:player):void=
        if (State := PlayerStates[Player], UI := PlayerUIs[Player]):
            Total := GetPendingTotal(State)
            Projected := State.Bank - Total

            UI.BankText.SetText(ArmoryText("SCRAP: {State.Bank}"))
            UI.PrimaryText.SetText(ArmoryText("PRIMARY: {GetCatalogName(State.PendingPrimary)}"))
            UI.SecondaryText.SetText(ArmoryText("SECONDARY: {GetCatalogName(State.PendingSecondary)}"))
            UI.SidearmText.SetText(ArmoryText("SIDEARM: {GetCatalogName(State.PendingSidearm)}"))
            UI.TotalText.SetText(ArmoryText("CART: {Total} // AFTER PURCHASE: {Projected}"))

    SetArmoryStatus(Player:player, Text:string):void=
        if (UI := PlayerUIs[Player]):
            UI.StatusText.SetText(ArmoryText(Text))

    GetReasonText(Reason:int):string=
        if (Reason = 1):
            return "OPENING BUY PHASE — click a selected weapon again to sell/remove it."
        if (Reason = 2):
            return "NEXT LIFE — adapt, rebuy, or deploy a cheaper save."
        if (Reason = 3):
            return "JOIN IN PROGRESS — build your first loadout."
        if (Reason = 4):
            return "NEXT LOADOUT — current-life weapons do not change and no Scrap is charged yet."
        return "ARMORY"
