using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Fortnite.com/UI }
using { /Verse.org/Simulation }
using { /Verse.org/Colors }
using { /UnrealEngine.com/Temporary/Diagnostics }
using { /UnrealEngine.com/Temporary/UI }
using { /UnrealEngine.com/Temporary/SpatialMath }

ArmoryText<localizes>(Value:string):message = "{Value}"

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

armory_ui_state := class:
    Root:canvas
    BankText:text_block
    CartText:text_block
    StatusText:text_block
    ClosedEvent:event() = event(){}

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
    var ReadyAtOpening:logic = false
    var UI:?armory_ui_state = false

scrapline_armory_device := class(creative_device):

    @editable
    ArmoryGranter:item_granter_device = item_granter_device{}

    @editable
    EconomyEliminations:elimination_manager_device = elimination_manager_device{}

    @editable
    ArmoryInput:input_trigger_device = input_trigger_device{}

    @editable
    SpawnPads:[]player_spawner_device = array{}

    @editable
    Catalog:[]armory_catalog_item = array{}

    @editable
    StarterPrimaryCatalogIndex:int = -1

    @editable
    StarterSecondaryCatalogIndex:int = -1

    @editable
    StarterSidearmCatalogIndex:int = -1

    @editable
    FallbackSidearmCatalogIndex:int = 0

    StartingBank:int = 3000
    BankCap:int = 5000
    EliminationReward:int = 150
    OpeningPhaseSeconds:float = 45.0
    JipBuySeconds:float = 12.0
    DeathShopSeconds:float = 8.0

    var OpeningPhaseActive:logic = true
    var PlayerStates:[player]armory_player_state = map{}

    OnBegin<override>()<suspends>:void=
        ArmoryInput.Enable()

        for (Player : GetPlayspace().GetPlayers()):
            InitializePlayer(Player, true)

        GetPlayspace().PlayerAddedEvent().Subscribe(OnPlayerAdded)
        GetPlayspace().PlayerRemovedEvent().Subscribe(OnPlayerRemoved)

        for (Spawner : SpawnPads):
            Spawner.SpawnedEvent.Subscribe(OnPlayerSpawned)

        EconomyEliminations.EliminationEvent.Subscribe(OnElimination)
        EconomyEliminations.EliminatedEvent.Subscribe(OnEliminated)
        ArmoryInput.PressedEvent.Subscribe(OnArmoryPressed)

        spawn{OpeningPhaseTimer()}

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
        else:
            set State.MinimumOpeningReady = false

        if (set PlayerStates[Player] = State):
            ArmoryInput.Register(Player)
            HoldPlayer(Player)

            if (PresentAtStart?):
                ShowArmory(Player, 1)
            else:
                if (OpeningPhaseActive?):
                    ShowArmory(Player, 1)
                    spawn{OpeningJipMinimum(Player)}
                else:
                    set State.ShopReason = 3
                    ShowArmory(Player, 3)
                    spawn{ActiveJipTimeout(Player)}

    OnPlayerAdded(Player:player):void=
        InitializePlayer(Player, false)

    OnPlayerRemoved(Player:player):void=
        ArmoryInput.Unregister(Player)
        RemoveArmoryUI(Player)

        var NewStates:[player]armory_player_state = map{}
        for (Key -> Value : PlayerStates, Key <> Player):
            set NewStates = ConcatenateMaps(NewStates, map{Key => Value})
        set PlayerStates = NewStates

    OnPlayerSpawned(Agent:agent):void=
        if (Player := player[Agent], State := PlayerStates[Player]):
            if (State.HoldForShop?):
                HoldPlayer(Player)
                if (ExistingUI := State.UI?):
                    RefreshArmoryUI(Player)
                else if (State.ShopReason > 0):
                    ShowArmory(Player, State.ShopReason)
            else if (State.NeedsGrant?):
                GrantCommittedLoadout(Player, State)

    OnElimination(MaybeAgent:?agent):void=
        if (Agent := MaybeAgent?, Player := player[Agent], State := PlayerStates[Player]):
            AddScrap(State, EliminationReward)
            set State.DeathStreak = 0
            RefreshArmoryUI(Player)

    OnEliminated(Agent:agent):void=
        if (Player := player[Agent], State := PlayerStates[Player]):
            AddDeathRecovery(State)
            PrepareDeathCart(State)
            set State.HoldForShop = true
            set State.ShopReason = 2
            ShowArmory(Player, 2)
            spawn{DeathShopTimeout(Player)}

    OnArmoryPressed(Agent:agent):void=
        if (Player := player[Agent], State := PlayerStates[Player]):
            if (OpeningPhaseActive?):
                set State.ReadyAtOpening = false
                set State.ShopReason = 1
                ShowArmory(Player, 1)
            else if (State.ShopReason = 2):
                ShowArmory(Player, 2)
            else if (State.ShopReason = 3):
                ShowArmory(Player, 3)
            else:
                # During combat this edits NEXT LOADOUT only.
                PrepareNextCart(State)
                set State.ShopReason = 4
                ShowArmory(Player, 4)

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
        RemoveArmoryUI(Player)
        FirstCommit := CommitPending(Player, State)
        if (FirstCommit?):
            return

        set State.PendingPrimary = -1
        set State.PendingSecondary = -1
        set State.PendingSidearm = FallbackSidearmCatalogIndex

        FallbackCommit := CommitPending(Player, State)
        if (FallbackCommit?):
            return

        # Final fail-safe: enter empty rather than grant a wrong catalog item.
        set State.HoldForShop = false
        set State.ShopReason = 0
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

        if (Player.GetFortCharacter[]):
            GrantCommittedLoadout(Player, State)
            ReleasePlayer(Player)

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

        # At least one weapon is required.
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

    GrantCommittedLoadout(Player:player, State:armory_player_state):void=
        GrantCatalogSelection(Player, State.PreviousPrimary)
        GrantCatalogSelection(Player, State.PreviousSecondary)
        GrantCatalogSelection(Player, State.PreviousSidearm)
        set State.NeedsGrant = false

    GrantCatalogSelection(Player:player, CatalogIndex:int):void=
        if (CatalogIndex >= 0, Entry := Catalog[CatalogIndex], Entry.Enabled?, Entry.ItemIndex >= 0):
            ArmoryGranter.GrantItemIndex(Player, Entry.ItemIndex)

    ShowArmory(Player:player, Reason:int):void=
        if (State := PlayerStates[Player], PlayerUI := GetPlayerUI[Player]):
            RemoveArmoryUI(Player)
            set State.ShopReason = Reason

            UI := CreateArmoryUI(Player, State, Reason)
            PlayerUI.AddWidget(UI.Root, player_ui_slot{InputMode := ui_input_mode.All, ZOrder := 50})
            set State.UI = option{UI}
            RefreshArmoryUI(Player)

    RemoveArmoryUI(Player:player):void=
        if (State := PlayerStates[Player]):
            if (UI := State.UI?):
                UI.ClosedEvent.Signal()
                if (PlayerUI := GetPlayerUI[Player]):
                    PlayerUI.RemoveWidget(UI.Root)
                set State.UI = false

    CreateArmoryUI(Player:player, State:armory_player_state, Reason:int):armory_ui_state=
        TitleText := text_block:
            DefaultText := ArmoryText(GetArmoryTitle(Reason))
            DefaultTextColor := NamedColors.White

        BankText := text_block:
            DefaultText := ArmoryText("SCRAP")
            DefaultTextColor := NamedColors.White

        CartText := text_block:
            DefaultText := ArmoryText("LOADOUT")
            DefaultTextColor := NamedColors.White

        StatusText := text_block:
            DefaultText := ArmoryText(GetReasonHelp(Reason))
            DefaultTextColor := NamedColors.White

        MainStack := stack_box:
            Orientation := orientation.Vertical

        MainStack.AddWidget(stack_box_slot{Widget := TitleText, HorizontalAlignment := horizontal_alignment.Center, Padding := margin{Bottom := 10.0}})
        MainStack.AddWidget(stack_box_slot{Widget := BankText, HorizontalAlignment := horizontal_alignment.Center, Padding := margin{Bottom := 8.0}})
        MainStack.AddWidget(stack_box_slot{Widget := CartText, HorizontalAlignment := horizontal_alignment.Center, Padding := margin{Bottom := 12.0}})
        MainStack.AddWidget(stack_box_slot{Widget := StatusText, HorizontalAlignment := horizontal_alignment.Center, Padding := margin{Bottom := 12.0}})

        Root := canvas:
            Slots := array:
                canvas_slot:
                    Anchors := anchors{Minimum := vector2{X := 0.5, Y := 0.5}, Maximum := vector2{X := 0.5, Y := 0.5}}
                    Offsets := margin{Left := 0.0, Top := 0.0, Right := 820.0, Bottom := 900.0}
                    Alignment := vector2{X := 0.5, Y := 0.5}
                    SizeToContent := false
                    Widget := overlay:
                        Slots := array:
                            overlay_slot:
                                Widget := color_block{
                                    DefaultColor := NamedColors.Black,
                                    DefaultOpacity := 0.92,
                                    DefaultDesiredSize := vector2{X := 820.0, Y := 900.0}
                                }
                            overlay_slot:
                                Padding := margin{Left := 24.0, Top := 24.0, Right := 24.0, Bottom := 24.0}
                                Widget := MainStack

        UI := armory_ui_state{
            Root := Root,
            BankText := BankText,
            CartText := CartText,
            StatusText := StatusText
        }

        for (CatalogIndex -> Entry : Catalog):
            if (Entry.Enabled?):
                SelectButton := button_loud{DefaultText := ArmoryText("SELECT")}
                ItemLabel := text_block{
                    DefaultText := ArmoryText(GetCatalogRowLabel(Entry)),
                    DefaultTextColor := NamedColors.White
                }

                MainStack.AddWidget(
                    stack_box_slot:
                        Widget := stack_box:
                            Orientation := orientation.Horizontal
                            Slots := array:
                                stack_box_slot:
                                    Widget := ItemLabel
                                    Distribution := option{1.0}
                                stack_box_slot:
                                    Widget := SelectButton
                                    Padding := margin{Left := 12.0}
                        Padding := margin{Top := 3.0, Bottom := 3.0}
                )
                spawn{AwaitCatalogSelection(Player, UI, SelectButton, CatalogIndex)}

        ClearPrimaryButton := button_loud{DefaultText := ArmoryText("CLEAR PRIMARY")}
        ClearSecondaryButton := button_loud{DefaultText := ArmoryText("CLEAR SECONDARY")}
        ClearSidearmButton := button_loud{DefaultText := ArmoryText("CLEAR SIDEARM")}
        RebuyButton := button_loud{DefaultText := ArmoryText("REBUY")}
        ReadyButton := button_loud{DefaultText := ArmoryText(GetReadyLabel(Reason))}
        CloseButton := button_loud{DefaultText := ArmoryText("CLOSE")}

        MainStack.AddWidget(
            stack_box_slot:
                Widget := stack_box:
                    Orientation := orientation.Horizontal
                    Slots := array:
                        stack_box_slot{Widget := ClearPrimaryButton, Padding := margin{Right := 4.0}}
                        stack_box_slot{Widget := ClearSecondaryButton, Padding := margin{Left := 4.0, Right := 4.0}}
                        stack_box_slot{Widget := ClearSidearmButton, Padding := margin{Left := 4.0}}
                Padding := margin{Top := 14.0}
        )

        MainStack.AddWidget(
            stack_box_slot:
                Widget := stack_box:
                    Orientation := orientation.Horizontal
                    Slots := array:
                        stack_box_slot{Widget := RebuyButton, Padding := margin{Right := 6.0}}
                        stack_box_slot{Widget := ReadyButton, Padding := margin{Left := 6.0, Right := 6.0}}
                        stack_box_slot{Widget := CloseButton, Padding := margin{Left := 6.0}}
                HorizontalAlignment := horizontal_alignment.Center
                Padding := margin{Top := 12.0}
        )

        spawn{AwaitArmoryAction(Player, UI, ClearPrimaryButton, 1)}
        spawn{AwaitArmoryAction(Player, UI, ClearSecondaryButton, 2)}
        spawn{AwaitArmoryAction(Player, UI, ClearSidearmButton, 3)}
        spawn{AwaitArmoryAction(Player, UI, RebuyButton, 4)}
        spawn{AwaitArmoryAction(Player, UI, ReadyButton, 5)}
        spawn{AwaitArmoryAction(Player, UI, CloseButton, 6)}

        return UI

    AwaitCatalogSelection(Player:player, UI:armory_ui_state, Button:button_loud, CatalogIndex:int)<suspends>:void=
        race:
            UI.ClosedEvent.Await()
            loop:
                Button.OnClick().Await()
                SelectCatalogItem(Player, CatalogIndex)

    AwaitArmoryAction(Player:player, UI:armory_ui_state, Button:button_loud, Action:int)<suspends>:void=
        race:
            UI.ClosedEvent.Await()
            loop:
                Button.OnClick().Await()
                HandleArmoryAction(Player, Action)

    SelectCatalogItem(Player:player, CatalogIndex:int):void=
        if (State := PlayerStates[Player], Entry := Catalog[CatalogIndex], Entry.Enabled?):
            if (Entry.Category = 0):
                set State.PendingPrimary = CatalogIndex
            else if (Entry.Category = 1):
                set State.PendingSecondary = CatalogIndex
            else if (Entry.Category = 2):
                set State.PendingSidearm = CatalogIndex
            else:
                SetArmoryStatus(Player, "INVALID CATEGORY")
                return

            set State.ReadyAtOpening = false
            RefreshArmoryUI(Player)

    HandleArmoryAction(Player:player, Action:int):void=
        if (State := PlayerStates[Player]):
            if (Action = 1):
                set State.PendingPrimary = -1
                set State.ReadyAtOpening = false
                RefreshArmoryUI(Player)
            else if (Action = 2):
                set State.PendingSecondary = -1
                set State.ReadyAtOpening = false
                RefreshArmoryUI(Player)
            else if (Action = 3):
                set State.PendingSidearm = -1
                set State.ReadyAtOpening = false
                RefreshArmoryUI(Player)
            else if (Action = 4):
                HandleRebuy(Player, State)
            else if (Action = 5):
                HandleReady(Player, State)
            else if (Action = 6):
                HandleClose(Player, State)

    HandleRebuy(Player:player, State:armory_player_state):void=
        if (State.PreviousPrimary < 0, State.PreviousSecondary < 0, State.PreviousSidearm < 0):
            SetArmoryStatus(Player, "NO PREVIOUS LOADOUT")
            return

        set State.PendingPrimary = State.PreviousPrimary
        set State.PendingSecondary = State.PreviousSecondary
        set State.PendingSidearm = State.PreviousSidearm

        if (State.ShopReason = 4):
            Queued := QueuePending(State)
            if (Queued?):
                RemoveArmoryUI(Player)
            else:
                SetArmoryStatus(Player, "REBUY LOADOUT INVALID")
        else if (State.ShopReason = 2):
            Committed := CommitPending(Player, State)
            if (Committed?):
                RemoveArmoryUI(Player)
            else:
                SetArmoryStatus(Player, "NOT ENOUGH SCRAP FOR REBUY")
        else if (State.ShopReason = 3):
            Committed := CommitPending(Player, State)
            if (Committed?):
                RemoveArmoryUI(Player)
            else:
                SetArmoryStatus(Player, "NOT ENOUGH SCRAP FOR REBUY")
        else:
            RefreshArmoryUI(Player)

    HandleReady(Player:player, State:armory_player_state):void=
        if (State.ShopReason = 1):
            Valid := CanCommitPending(State)
            if (Valid?):
                set State.ReadyAtOpening = true
                RemoveArmoryUI(Player)
            else:
                SetArmoryStatus(Player, "LOADOUT INVALID OR OVER BUDGET")
        else if (State.ShopReason = 4):
            Queued := QueuePending(State)
            if (Queued?):
                RemoveArmoryUI(Player)
            else:
                SetArmoryStatus(Player, "NEXT LOADOUT INVALID")
        else:
            Committed := CommitPending(Player, State)
            if (Committed?):
                RemoveArmoryUI(Player)
            else:
                SetArmoryStatus(Player, "LOADOUT INVALID OR OVER BUDGET")

    HandleClose(Player:player, State:armory_player_state):void=
        if (State.ShopReason = 2, State.HoldForShop?):
            SetArmoryStatus(Player, "CHOOSE A LOADOUT OR WAIT FOR FALLBACK")
        else if (State.ShopReason = 3, State.HoldForShop?):
            SetArmoryStatus(Player, "CHOOSE A LOADOUT OR WAIT FOR FALLBACK")
        else:
            RemoveArmoryUI(Player)

    QueuePending(State:armory_player_state):logic=
        Valid := IsValidCart(State)
        if (not Valid?):
            return false

        set State.QueuedPrimary = State.PendingPrimary
        set State.QueuedSecondary = State.PendingSecondary
        set State.QueuedSidearm = State.PendingSidearm
        set State.HasQueued = true
        set State.ShopReason = 0
        return true

    CanCommitPending(State:armory_player_state):logic=
        Valid := IsValidCart(State)
        if (not Valid?):
            return false
        PendingTotal := GetPendingTotal(State)
        if (PendingTotal > State.Bank):
            return false
        return true

    RefreshArmoryUI(Player:player):void=
        if (State := PlayerStates[Player], UI := State.UI?):
            Total := GetPendingTotal(State)
            Projected := State.Bank - Total

            UI.BankText.SetText(ArmoryText("SCRAP: {State.Bank} / {BankCap}"))
            UI.CartText.SetText(
                ArmoryText(
                    "PRIMARY: {GetCatalogName(State.PendingPrimary)} | SECONDARY: {GetCatalogName(State.PendingSecondary)} | SIDEARM: {GetCatalogName(State.PendingSidearm)} | TOTAL: {Total} | AFTER: {Projected}"
                )
            )

    SetArmoryStatus(Player:player, Text:string):void=
        if (State := PlayerStates[Player], UI := State.UI?):
            UI.StatusText.SetText(ArmoryText(Text))

    GetCatalogName(CatalogIndex:int):string=
        if (CatalogIndex >= 0, Entry := Catalog[CatalogIndex], Entry.Enabled?):
            return Entry.DisplayName
        return "EMPTY"

    GetCatalogRowLabel(Entry:armory_catalog_item):string=
        var Prefix:string = GetCategoryName(Entry.Category)
        var Feature:string = ""
        if (Entry.Featured?):
            set Feature = " [FEATURED]"
        if (Entry.SeasonalTag <> ""):
            return "{Prefix} | {Entry.DisplayName} | {Entry.Price} SCRAP | {Entry.SeasonalTag}{Feature}"
        return "{Prefix} | {Entry.DisplayName} | {Entry.Price} SCRAP{Feature}"

    GetCategoryName(Category:int):string=
        if (Category = 0):
            return "PRIMARY"
        if (Category = 1):
            return "SECONDARY"
        if (Category = 2):
            return "SIDEARM"
        return "INVALID"

    GetArmoryTitle(Reason:int):string=
        if (Reason = 1):
            return "SCRAPLINE ARMORY // OPENING BUY"
        if (Reason = 2):
            return "SCRAPLINE ARMORY // NEXT LIFE"
        if (Reason = 3):
            return "SCRAPLINE ARMORY // JOIN IN PROGRESS"
        if (Reason = 4):
            return "SCRAPLINE ARMORY // QUEUE NEXT LOADOUT"
        return "SCRAPLINE ARMORY"

    GetReasonHelp(Reason:int):string=
        if (Reason = 1):
            return "BUY PHASE // READY LOCKS YOUR CART // PRESS ARMORY INPUT TO REOPEN"
        if (Reason = 2):
            return "CHANGE LOADOUT OR REBUY // HARD LIMIT 8 SECONDS"
        if (Reason = 3):
            return "FIRST LOADOUT // UP TO 12 SECONDS"
        if (Reason = 4):
            return "CHANGES APPLY NEXT LIFE // YOU REMAIN VULNERABLE"
        return ""

    GetReadyLabel(Reason:int):string=
        if (Reason = 1):
            return "READY"
        if (Reason = 4):
            return "SAVE NEXT"
        return "BUY & SPAWN"

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
