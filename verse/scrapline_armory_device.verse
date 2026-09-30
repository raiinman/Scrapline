using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Fortnite.com/Game }
using { /Fortnite.com/UI }
using { /Verse.org/Simulation }
using { /Verse.org/Simulation/Tags }
using { /Verse.org/Colors }
using { /Verse.org/Assets }
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

    # Inventory slot: 0 = Primary, 1 = Secondary, 2 = Sidearm
    @editable
    Category:int = 0

    # Browser category: 1 Pistols, 2 SMGs, 3 Shotguns, 4 ARs,
    # 5 Marksman, 6 Snipers, 7 Special. Featured is a separate flag.
    @editable
    ShopCategory:int = 7

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

    # Optional catalog art. Existing alpha entries use the widget's native icons.
    @editable
    Thumbnail:?texture = false

armory_player_state := class:
    LeftEvent:event() = event(){}
    var PlayerNumber:int = 0
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
    var ObservedCharacter:?fort_character = false
    var NativeImmunityUntil:float = 0.0
    var PendingEliminations:int = 0
    var PendingDeaths:int = 0
    var EconomyFlushQueued:logic = false

armory_ui_state := class:
    Shell:UI.WBP_ScraplineArmory
    Root:canvas
    HeaderText:text_block
    BankText:text_block
    ContextText:text_block
    PrimaryText:text_block
    SecondaryText:text_block
    SidearmText:text_block
    TotalText:text_block
    CountdownText:text_block
    StatusText:text_block
    PageText:text_block
    CategoryTexts:[]text_block
    CardNameTexts:[]text_block
    CardPriceTexts:[]text_block
    ReadyText:text_block
    RebuyText:text_block
    ClearText:text_block
    PrevText:text_block
    NextText:text_block
    ClosedEvent:event() = event(){}
    var ActiveCategory:int = 0
    var Page:int = 0
    var CardCatalogIndices:[]int = array{-1,-1,-1,-1,-1,-1,-1,-1}

scrapline_armory_device := class(creative_device):

    # Runtime-discovered through Verse Tag Markup. No brittle device @editable wiring.
    var ArmoryGranter:?item_granter_device = false
    var EconomyEliminations:?elimination_manager_device = false
    var ArmoryInput:?input_trigger_device = false

    @editable
    Catalog:[]armory_catalog_item = array{
        armory_catalog_item{StableId := "core_pistol", DisplayName := "Core Pistol", Category := 2, ShopCategory := 1, Price := 0, ItemIndex := 0, SortOrder := 0},
        armory_catalog_item{StableId := "premium_pistol", DisplayName := "Premium Pistol", Category := 2, ShopCategory := 1, Price := 500, ItemIndex := 1, SortOrder := 1},
        armory_catalog_item{StableId := "core_smg", DisplayName := "Core SMG", Category := 1, ShopCategory := 2, Price := 1000, ItemIndex := 2, Featured := true, SortOrder := 2},
        armory_catalog_item{StableId := "pump_shotgun", DisplayName := "Pump Shotgun", Category := 0, ShopCategory := 3, Price := 1400, ItemIndex := 3, Featured := true, SortOrder := 3},
        armory_catalog_item{StableId := "core_ar", DisplayName := "Core AR", Category := 0, ShopCategory := 4, Price := 1700, ItemIndex := 4, Featured := true, SortOrder := 4},
        armory_catalog_item{StableId := "red_dot_ar", DisplayName := "Red-Dot AR", Category := 0, ShopCategory := 4, Price := 2100, ItemIndex := 5, Featured := true, SortOrder := 5},
        armory_catalog_item{StableId := "core_sniper", DisplayName := "Core Sniper", Category := 0, ShopCategory := 6, Price := 3800, ItemIndex := 6, Featured := true, SeasonalTag := "PREMIUM", SortOrder := 6}
    }


    @editable
    StarterPrimaryCatalogIndex:int = 4

    @editable
    StarterSecondaryCatalogIndex:int = 2

    @editable
    StarterSidearmCatalogIndex:int = 0

    @editable
    FallbackSidearmCatalogIndex:int = 0

    # IG_Armory currently registers exactly seven weapon entries (indices 0..6).
    # Keep this synchronized with the device item list; never let GrantItemIndex
    # clamp/wrap an invalid catalog mapping into a different weapon.
    RegisteredItemCount:int = 7

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
    var NextPlayerNumber:int = 1

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
            # EM_Economy owns eliminator rewards only. Victim/death lifecycle is
            # observed from each active fort_character so self/environment deaths
            # still receive recovery without ever creating self-elimination income.
            Economy.EliminationEvent.Subscribe(OnElimination)

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
        set State.PlayerNumber = NextPlayerNumber
        set NextPlayerNumber += 1
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
            spawn{WatchPlayerDeaths(Player)}
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
        if (State := PlayerStates[Player]):
            State.LeftEvent.Signal()
            Print("SCRAPLINE ARMORY: player {State.PlayerNumber} leave cleanup")
        if (Input := ArmoryInput?):
            Input.Unregister(Player)
        RemoveArmoryUI(Player)

        var NewStates:[player]armory_player_state = map{}
        for (Key -> Value : PlayerStates, Key <> Player):
            set NewStates = ConcatenateMaps(NewStates, map{Key => Value})
        set PlayerStates = NewStates

    OnElimination(MaybeAgent:?agent):void=
        if (Agent := MaybeAgent?, Player := player[Agent], State := PlayerStates[Player]):
            set State.PendingEliminations += 1
            QueueEconomyFlush(Player, State)

    QueueEconomyFlush(Player:player, State:armory_player_state):void=
        if (not State.EconomyFlushQueued?):
            set State.EconomyFlushQueued = true
            spawn{FlushEconomyEvents(Player)}

    FlushEconomyEvents(Player:player)<suspends>:void=
        # Collect same-update elimination/death notifications before applying
        # recovery then income. A trade pays the prior recovery tier and finishes
        # with tier zero regardless of the two native callback orders.
        Sleep(0.0)
        if (State := PlayerStates[Player]):
            Deaths := State.PendingDeaths
            Eliminations := State.PendingEliminations
            set State.PendingDeaths = 0
            set State.PendingEliminations = 0
            set State.EconomyFlushQueued = false
            for (Unused := 1..Deaths):
                AddDeathRecovery(State)
            if (Eliminations > 0):
                AddScrap(State, EliminationReward * Eliminations)
                set State.DeathStreak = 0
            Print("SCRAPLINE ARMORY: player {State.PlayerNumber} economy deaths={Deaths} kills={Eliminations} bank={State.Bank} tier={State.DeathStreak}")
            if (Deaths > 0):
                HandlePlayerDeath(Player)
            RefreshArmoryUI(Player)

    WatchPlayerDeaths(Player:player)<suspends>:void=
        if (InitialState := PlayerStates[Player]):
            Print("SCRAPLINE ARMORY: player {InitialState.PlayerNumber} watcher started")
            race:
                InitialState.LeftEvent.Await()
                loop:
                    if (PlayerStates[Player]):
                        if (FortChar := Player.GetFortCharacter[], FortChar.IsActive[]):
                            ObserveCharacter(Player, FortChar)
                            FortChar.EliminatedEvent().Await()
                            if (State := PlayerStates[Player]):
                                set State.PendingDeaths += 1
                                QueueEconomyFlush(Player, State)
                        else:
                            Sleep(0.1)
                    else:
                        return

    HandlePlayerDeath(Player:player):void=
        if (State := PlayerStates[Player]):
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
            # A protected opening/JIP/death shop already owns this life gate.
            # Reopen that shop without changing its reason or deadline; otherwise
            # the combat hotkey could convert it to Next Loadout and defeat the
            # hard timeout while the player remains held in stasis.
            if (State.HoldForShop?):
                OpenArmory(Player)
                return

            # A committed loadout is waiting for the next active FortCharacter.
            # Do not let an input press mutate cart state during that handoff.
            if (State.NeedsGrant?):
                return

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
        Print("SCRAPLINE ARMORY: player {State.PlayerNumber} commit cost={Total} bank={State.Bank}")
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
            if (Entry.Enabled?, Entry.Category = RequiredCategory, Entry.Price >= 0, Entry.ItemIndex >= 0, Entry.ItemIndex < RegisteredItemCount):
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
        # Grant primary last because IG_Armory equips each successful grant.
        # This leaves the player holding the primary when the life begins.
        GrantCatalogSelection(Player, State.PreviousSidearm)
        GrantCatalogSelection(Player, State.PreviousSecondary)
        GrantCatalogSelection(Player, State.PreviousPrimary)
        set State.NeedsGrant = false

    GrantCatalogSelection(Player:player, CatalogIndex:int):void=
        if:
            Granter := ArmoryGranter?
            CatalogIndex >= 0
            Entry := Catalog[CatalogIndex]
            Entry.Enabled?
            Entry.ItemIndex >= 0
            Entry.ItemIndex < RegisteredItemCount
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
            ObserveCharacter(Player, FortChar)
            FortChar.SetVulnerability(false)
            FortChar.PutInStasis(stasis_args{
                AllowTurning := true,
                AllowFalling := false,
                AllowEmotes := false
            })

    ReleasePlayer(Player:player):void=
        if (FortChar := Player.GetFortCharacter[]):
            ObserveCharacter(Player, FortChar)
            FortChar.ReleaseFromStasis()
            spawn{ReleaseVulnerabilityWhenSafe(Player, FortChar)}

    ObserveCharacter(Player:player, FortChar:fort_character):void=
        if (State := PlayerStates[Player]):
            if (Previous := State.ObservedCharacter?, Previous = FortChar):
                return
            set State.ObservedCharacter = option{FortChar}
            set State.NativeImmunityUntil = GetSimulationElapsedTime() + 2.0

    ReleaseVulnerabilityWhenSafe(Player:player, FortChar:fort_character)<suspends>:void=
        if (State := PlayerStates[Player]):
            Remaining := State.NativeImmunityUntil - GetSimulationElapsedTime()
            if (Remaining > 0.0):
                Sleep(Remaining)
            if (CurrentState := PlayerStates[Player], not CurrentState.HoldForShop?, Current := CurrentState.ObservedCharacter?, Current = FortChar, FortChar.IsActive[]):
                FortChar.SetVulnerability(true)

    OpenArmorySoon(Player:player)<suspends>:void=
        Sleep(0.0)
        OpenArmory(Player)

    OpenArmory(Player:player):void=
        if (State := PlayerStates[Player], PlayerUI := GetPlayerUI[Player]):
            RemoveArmoryUI(Player)

            ArmoryView := CreateArmoryUI(Player, State)
            GetPlayspace().GetHUDController().HideElementsForPlayer(Player, array{creative_hud_identifier_all{}})
            PlayerUI.AddWidget(ArmoryView.Shell, player_ui_slot{InputMode := ui_input_mode.All, ZOrder := 0})
            PlayerUI.AddWidget(ArmoryView.Root, player_ui_slot{ZOrder := 1})
            PlayerUI.SetFocus(ArmoryView.Shell)

            if (set PlayerUIs[Player] = ArmoryView):
                RefreshArmoryUI(Player)
                spawn{AwaitUMGAction(Player, ArmoryView, 0, ArmoryView.Shell.ReadyEvent)}
                spawn{AwaitUMGAction(Player, ArmoryView, 1, ArmoryView.Shell.RebuyEvent)}
                spawn{AwaitUMGAction(Player, ArmoryView, 2, ArmoryView.Shell.ClearEvent)}
                spawn{AwaitUMGAction(Player, ArmoryView, 3, ArmoryView.Shell.PrevPageEvent)}
                spawn{AwaitUMGAction(Player, ArmoryView, 4, ArmoryView.Shell.NextPageEvent)}
                spawn{AwaitUMGCategory(Player, ArmoryView, 0, ArmoryView.Shell.CategoryFeaturedEvent)}
                spawn{AwaitUMGCategory(Player, ArmoryView, 1, ArmoryView.Shell.CategoryPistolsEvent)}
                spawn{AwaitUMGCategory(Player, ArmoryView, 2, ArmoryView.Shell.CategorySMGEvent)}
                spawn{AwaitUMGCategory(Player, ArmoryView, 3, ArmoryView.Shell.CategoryShotgunsEvent)}
                spawn{AwaitUMGCategory(Player, ArmoryView, 4, ArmoryView.Shell.CategoryAREvent)}
                spawn{AwaitUMGCategory(Player, ArmoryView, 5, ArmoryView.Shell.CategoryMarksmanEvent)}
                spawn{AwaitUMGCategory(Player, ArmoryView, 6, ArmoryView.Shell.CategorySnipersEvent)}
                spawn{AwaitUMGCategory(Player, ArmoryView, 7, ArmoryView.Shell.CategorySpecialEvent)}
                spawn{AwaitUMGCard(Player, ArmoryView, 0, ArmoryView.Shell.Card1Event)}
                spawn{AwaitUMGCard(Player, ArmoryView, 1, ArmoryView.Shell.Card2Event)}
                spawn{AwaitUMGCard(Player, ArmoryView, 2, ArmoryView.Shell.Card3Event)}
                spawn{AwaitUMGCard(Player, ArmoryView, 3, ArmoryView.Shell.Card4Event)}
                spawn{AwaitUMGCard(Player, ArmoryView, 4, ArmoryView.Shell.Card5Event)}
                spawn{AwaitUMGCard(Player, ArmoryView, 5, ArmoryView.Shell.Card6Event)}
                spawn{AwaitUMGCard(Player, ArmoryView, 6, ArmoryView.Shell.Card7Event)}
                spawn{AwaitUMGCard(Player, ArmoryView, 7, ArmoryView.Shell.Card8Event)}
                spawn{RunCountdown(Player, ArmoryView)}

    RemoveArmoryUI(Player:player):void=
        if (ArmoryView := PlayerUIs[Player]):
            ArmoryView.ClosedEvent.Signal()

            if (PlayerUI := GetPlayerUI[Player]):
                PlayerUI.RemoveWidget(ArmoryView.Root)
                PlayerUI.RemoveWidget(ArmoryView.Shell)

            GetPlayspace().GetHUDController().ResetElementsForPlayer(Player, array{creative_hud_identifier_all{}})

            var NewUIs:[player]armory_ui_state = map{}
            for (Key -> Value : PlayerUIs, Key <> Player):
                set NewUIs = ConcatenateMaps(NewUIs, map{Key => Value})
            set PlayerUIs = NewUIs

    MakeOverlaySlot(Widget:widget, X:float, Y:float):canvas_slot=
        return canvas_slot:
            Widget := Widget
            Anchors := anchors{Minimum := vector2{X := 0.0, Y := 0.0}, Maximum := vector2{X := 0.0, Y := 0.0}}
            Offsets := margin{Left := X, Top := Y}
            Alignment := vector2{X := 0.0, Y := 0.0}
            SizeToContent := true

    MakeLabel(Text:string, Size:float, Color:color):text_block=
        return text_block{
            DefaultText := ArmoryText(Text),
            DefaultTextColor := Color,
            DefaultTextSize := Size,
            DefaultShadowColor := MakeColorFromHex("000000"),
            DefaultShadowOpacity := 0.55,
            DefaultShadowOffset := option{vector2{X := 1.0, Y := 1.0}}
        }

    CategoryLabelX(Index:int):float=
        if (Index = 0):
            return 224.0
        if (Index = 1):
            return 330.0
        if (Index = 2):
            return 436.0
        if (Index = 3):
            return 542.0
        if (Index = 4):
            return 648.0
        if (Index = 5):
            return 754.0
        if (Index = 6):
            return 860.0
        return 966.0

    CardLabelX(Index:int):float=
        if (Index = 0):
            return 220.0
        if (Index = 4):
            return 220.0
        if (Index = 1):
            return 375.0
        if (Index = 5):
            return 375.0
        if (Index = 2):
            return 530.0
        if (Index = 6):
            return 530.0
        return 685.0

    CardNameY(Index:int):float=
        if (Index < 4):
            return 302.0
        return 482.0

    CardPriceY(Index:int):float=
        if (Index < 4):
            return 326.0
        return 506.0

    CreateArmoryUI(Player:player, State:armory_player_state):armory_ui_state=
        Shell := UI.WBP_ScraplineArmory{}
        White := MakeColorFromHex("E8EDF0")
        Muted := MakeColorFromHex("89949D")
        Accent := MakeColorFromHex("9DBB69")
        Money := MakeColorFromHex("C2D987")
        Weapon := MakeColorFromHex("B9D4E8")

        HeaderText := MakeLabel("SCRAPLINE // ARMORY", 21.0, White)
        BankText := MakeLabel("SCRAP 0", 18.0, Money)
        ContextText := MakeLabel(GetReasonText(State.ShopReason), 12.0, Muted)
        CountdownText := MakeLabel("", 17.0, White)
        PrimaryText := MakeLabel("PRIMARY -", 14.0, Weapon)
        SecondaryText := MakeLabel("SECONDARY -", 14.0, Weapon)
        SidearmText := MakeLabel("SIDEARM -", 14.0, Weapon)
        TotalText := MakeLabel("LOADOUT 0", 14.0, Money)
        StatusText := MakeLabel("", 11.0, Muted)
        PageText := MakeLabel("PAGE 1", 11.0, Muted)
        ReadyText := MakeLabel("READY", 14.0, White)
        RebuyText := MakeLabel("RE-BUY", 11.0, White)
        ClearText := MakeLabel("CLEAR", 11.0, White)
        PrevText := MakeLabel("< PREV", 10.0, White)
        NextText := MakeLabel("NEXT >", 10.0, White)

        CategoryTexts := array:
            MakeLabel("FEATURED", 10.0, White)
            MakeLabel("PISTOLS", 10.0, White)
            MakeLabel("SMGs", 10.0, White)
            MakeLabel("SHOTGUNS", 10.0, White)
            MakeLabel("ARs", 10.0, White)
            MakeLabel("MARKSMAN", 10.0, White)
            MakeLabel("SNIPERS", 10.0, White)
            MakeLabel("SPECIAL", 10.0, White)

        CardNameTexts := array:
            MakeLabel("", 12.0, White), MakeLabel("", 12.0, White), MakeLabel("", 12.0, White), MakeLabel("", 12.0, White),
            MakeLabel("", 12.0, White), MakeLabel("", 12.0, White), MakeLabel("", 12.0, White), MakeLabel("", 12.0, White)
        CardPriceTexts := array:
            MakeLabel("", 11.0, Money), MakeLabel("", 11.0, Money), MakeLabel("", 11.0, Money), MakeLabel("", 11.0, Money),
            MakeLabel("", 11.0, Money), MakeLabel("", 11.0, Money), MakeLabel("", 11.0, Money), MakeLabel("", 11.0, Money)

        var Slots:[]canvas_slot = array:
            MakeOverlaySlot(HeaderText, 210.0, 80.0),
            MakeOverlaySlot(BankText, 870.0, 82.0),
            MakeOverlaySlot(CountdownText, 980.0, 82.0),
            MakeOverlaySlot(ContextText, 210.0, 102.0),
            MakeOverlaySlot(PrimaryText, 855.0, 225.0),
            MakeOverlaySlot(SecondaryText, 855.0, 285.0),
            MakeOverlaySlot(SidearmText, 855.0, 345.0),
            MakeOverlaySlot(TotalText, 855.0, 425.0),
            MakeOverlaySlot(StatusText, 855.0, 455.0),
            MakeOverlaySlot(PageText, 610.0, 543.0),
            MakeOverlaySlot(ReadyText, 920.0, 558.0),
            MakeOverlaySlot(RebuyText, 875.0, 607.0),
            MakeOverlaySlot(ClearText, 980.0, 607.0),
            MakeOverlaySlot(PrevText, 545.0, 543.0),
            MakeOverlaySlot(NextText, 650.0, 543.0)

        for (Index -> Label : CategoryTexts):
            set Slots += array{MakeOverlaySlot(Label, CategoryLabelX(Index), 136.0)}

        for (Index -> Label : CardNameTexts):
            set Slots += array{MakeOverlaySlot(Label, CardLabelX(Index), CardNameY(Index))}

        for (Index -> Label : CardPriceTexts):
            set Slots += array{MakeOverlaySlot(Label, CardLabelX(Index), CardPriceY(Index))}

        Root := canvas{Slots := Slots}

        return armory_ui_state:
            Shell := Shell
            Root := Root
            HeaderText := HeaderText
            BankText := BankText
            ContextText := ContextText
            PrimaryText := PrimaryText
            SecondaryText := SecondaryText
            SidearmText := SidearmText
            TotalText := TotalText
            CountdownText := CountdownText
            StatusText := StatusText
            PageText := PageText
            CategoryTexts := CategoryTexts
            CardNameTexts := CardNameTexts
            CardPriceTexts := CardPriceTexts
            ReadyText := ReadyText
            RebuyText := RebuyText
            ClearText := ClearText
            PrevText := PrevText
            NextText := NextText

    AwaitUMGAction(Player:player, ArmoryView:armory_ui_state, Action:int, Source:event(tuple()))<suspends>:void=
        race:
            ArmoryView.ClosedEvent.Await()
            loop:
                Source.Await()
                if (Action = 0):
                    HandleReady(Player)
                else if (Action = 1):
                    HandleRebuy(Player)
                else if (Action = 2):
                    ClearPendingCart(Player)
                else if (Action = 3):
                    ChangePage(Player, -1)
                else if (Action = 4):
                    ChangePage(Player, 1)

    AwaitUMGCategory(Player:player, ArmoryView:armory_ui_state, Category:int, Source:event(tuple()))<suspends>:void=
        race:
            ArmoryView.ClosedEvent.Await()
            loop:
                Source.Await()
                set ArmoryView.ActiveCategory = Category
                set ArmoryView.Page = 0
                RefreshArmoryUI(Player)

    AwaitUMGCard(Player:player, ArmoryView:armory_ui_state, SlotIndex:int, Source:event(tuple()))<suspends>:void=
        race:
            ArmoryView.ClosedEvent.Await()
            loop:
                Source.Await()
                if (CatalogIndex := ArmoryView.CardCatalogIndices[SlotIndex]):
                    if (CatalogIndex >= 0):
                        ToggleCatalogSelection(Player, CatalogIndex)

    RunCountdown(Player:player, ArmoryView:armory_ui_state)<suspends>:void=
        race:
            ArmoryView.ClosedEvent.Await()
            loop:
                if (State := PlayerStates[Player]):
                    if (State.ShopDeadline > 0.0):
                        Remaining := State.ShopDeadline - GetSimulationElapsedTime()
                        if (Remaining <= 0.0):
                            ArmoryView.CountdownText.SetText(ArmoryText("TIME 0"))
                        else:
                            Seconds := Ceil[Remaining] or 0
                            ArmoryView.CountdownText.SetText(ArmoryText("TIME {Seconds}s"))
                    else:
                        ArmoryView.CountdownText.SetText(ArmoryText(""))
                Sleep(1.0)

    GetFilteredCatalogIndices(Category:int):[]int=
        var Results:[]int = array{}
        for (Index -> Entry : Catalog, Entry.Enabled?):
            if (Category = 0):
                if (Entry.Featured?):
                    set Results += array{Index}
            else if (Entry.ShopCategory = Category):
                set Results += array{Index}
        return Results

    ChangePage(Player:player, Delta:int):void=
        if (ArmoryView := PlayerUIs[Player]):
            Filtered := GetFilteredCatalogIndices(ArmoryView.ActiveCategory)
            if (Delta < 0):
                if (ArmoryView.Page > 0):
                    set ArmoryView.Page -= 1
                    RefreshArmoryUI(Player)
            else:
                NextStart := (ArmoryView.Page + 1) * 8
                if (Unused := Filtered[NextStart]):
                    set ArmoryView.Page += 1
                    RefreshArmoryUI(Player)

    ClearPendingCart(Player:player):void=
        if (State := PlayerStates[Player]):
            set State.PendingPrimary = -1
            set State.PendingSecondary = -1
            set State.PendingSidearm = -1
            SetArmoryStatus(Player, "CART CLEARED")
            RefreshArmoryUI(Player)

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

    RefreshCardPage(Player:player, State:armory_player_state, ArmoryView:armory_ui_state):void=
        Filtered := GetFilteredCatalogIndices(ArmoryView.ActiveCategory)
        Start := ArmoryView.Page * 8
        var NewIndices:[]int = array{}

        for (Slot := 0..7):
            var CatalogIndex:int = -1
            if (FoundIndex := Filtered[Start + Slot]):
                set CatalogIndex = FoundIndex

            set NewIndices += array{CatalogIndex}
            RefreshWeaponImage(ArmoryView.Shell, Slot, CatalogIndex)

            if (NameText := ArmoryView.CardNameTexts[Slot], PriceText := ArmoryView.CardPriceTexts[Slot]):
                if (CatalogIndex >= 0, Entry := Catalog[CatalogIndex]):
                    Prefix := if (Entry.Featured?) then "★ " else ""
                    NameText.SetText(ArmoryText("{Prefix}{Entry.DisplayName}"))
                    PriceLabel := if (Entry.Price = 0) then "FREE" else "{Entry.Price} SCRAP"
                    PriceText.SetText(ArmoryText(PriceLabel))

                    if (CatalogIndex = State.PendingPrimary or CatalogIndex = State.PendingSecondary or CatalogIndex = State.PendingSidearm):
                        NameText.SetTextColor(MakeColorFromHex("A9D778"))
                        PriceText.SetTextColor(MakeColorFromHex("A9D778"))
                    else if (Entry.Price > State.Bank):
                        NameText.SetTextColor(MakeColorFromHex("68727A"))
                        PriceText.SetTextColor(MakeColorFromHex("68727A"))
                    else:
                        NameText.SetTextColor(MakeColorFromHex("E8EDF0"))
                        PriceText.SetTextColor(MakeColorFromHex("C2D987"))
                else:
                    NameText.SetText(ArmoryText(""))
                    PriceText.SetText(ArmoryText(""))

        set ArmoryView.CardCatalogIndices = NewIndices
        ArmoryView.PageText.SetText(ArmoryText("PAGE {ArmoryView.Page + 1}"))

        for (Index -> CategoryText : ArmoryView.CategoryTexts):
            if (Index = ArmoryView.ActiveCategory):
                CategoryText.SetTextColor(MakeColorFromHex("A9D778"))
            else:
                CategoryText.SetTextColor(MakeColorFromHex("E8EDF0"))

    RefreshWeaponImage(Shell:UI.WBP_ScraplineArmory, Slot:int, CatalogIndex:int):void=
        var Icon:texture = Shell.IconPistol
        var Opacity:float = 0.0
        if (CatalogIndex >= 0, Entry := Catalog[CatalogIndex]):
            set Opacity = 1.0
            if (Custom := Entry.Thumbnail?):
                set Icon = Custom
            else if (Entry.ItemIndex = 2):
                set Icon = Shell.IconSMG
            else if (Entry.ItemIndex = 3):
                set Icon = Shell.IconShotgun
            else if (Entry.ItemIndex = 4):
                set Icon = Shell.IconAR
            else if (Entry.ItemIndex = 5):
                set Icon = Shell.IconRedDot
            else if (Entry.ItemIndex = 6):
                set Icon = Shell.IconSniper
        if (Slot = 0):
            set Shell.WeaponImage1 = Icon
            set Shell.WeaponOpacity1 = Opacity
        else if (Slot = 1):
            set Shell.WeaponImage2 = Icon
            set Shell.WeaponOpacity2 = Opacity
        else if (Slot = 2):
            set Shell.WeaponImage3 = Icon
            set Shell.WeaponOpacity3 = Opacity
        else if (Slot = 3):
            set Shell.WeaponImage4 = Icon
            set Shell.WeaponOpacity4 = Opacity
        else if (Slot = 4):
            set Shell.WeaponImage5 = Icon
            set Shell.WeaponOpacity5 = Opacity
        else if (Slot = 5):
            set Shell.WeaponImage6 = Icon
            set Shell.WeaponOpacity6 = Opacity
        else if (Slot = 6):
            set Shell.WeaponImage7 = Icon
            set Shell.WeaponOpacity7 = Opacity
        else:
            set Shell.WeaponImage8 = Icon
            set Shell.WeaponOpacity8 = Opacity

    RefreshArmoryUI(Player:player):void=
        if (State := PlayerStates[Player], ArmoryView := PlayerUIs[Player]):
            Total := GetPendingTotal(State)
            Projected := State.Bank - Total

            ArmoryView.BankText.SetText(ArmoryText("SCRAP {State.Bank}"))
            ArmoryView.ContextText.SetText(ArmoryText(GetReasonText(State.ShopReason)))
            ArmoryView.PrimaryText.SetText(ArmoryText("PRIMARY  {GetCatalogName(State.PendingPrimary)}"))
            ArmoryView.SecondaryText.SetText(ArmoryText("SECONDARY  {GetCatalogName(State.PendingSecondary)}"))
            ArmoryView.SidearmText.SetText(ArmoryText("SIDEARM  {GetCatalogName(State.PendingSidearm)}"))

            if (State.ShopReason = 4):
                ArmoryView.TotalText.SetText(ArmoryText("NEXT LOADOUT  {Total} SCRAP"))
                ArmoryView.StatusText.SetText(ArmoryText("CHARGED ON NEXT SPAWN // BANK NOW {State.Bank}"))
            else:
                ArmoryView.TotalText.SetText(ArmoryText("LOADOUT  {Total} // REMAINING {Projected}"))

            RefreshCardPage(Player, State, ArmoryView)

    SetArmoryStatus(Player:player, Text:string):void=
        if (ArmoryView := PlayerUIs[Player]):
            ArmoryView.StatusText.SetText(ArmoryText(Text))

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
