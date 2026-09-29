using { /Fortnite.com/Devices }
using { /Fortnite.com/Characters }
using { /Verse.org/Simulation }
using { /UnrealEngine.com/Temporary/Diagnostics }

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

            if (not PresentAtStart?):
                if (OpeningPhaseActive?):
                    spawn{OpeningJipMinimum(Player)}
                else:
                    set State.ShopReason = 3
                    spawn{ActiveJipTimeout(Player)}

    OnPlayerAdded(Player:player):void=
        InitializePlayer(Player, false)

    OnPlayerRemoved(Player:player):void=
        ArmoryInput.Unregister(Player)

        var NewStates:[player]armory_player_state = map{}
        for (Key -> Value : PlayerStates, Key <> Player):
            set NewStates = ConcatenateMaps(NewStates, map{Key => Value})
        set PlayerStates = NewStates

    OnPlayerSpawned(Agent:agent):void=
        if (Player := player[Agent], State := PlayerStates[Player]):
            if (State.HoldForShop?):
                HoldPlayer(Player)
            else if (State.NeedsGrant?):
                GrantCommittedLoadout(Player, State)

    OnElimination(MaybeAgent:?agent):void=
        if (Agent := MaybeAgent?, Player := player[Agent], State := PlayerStates[Player]):
            AddScrap(State, EliminationReward)
            set State.DeathStreak = 0

    OnEliminated(Agent:agent):void=
        if (Player := player[Agent], State := PlayerStates[Player]):
            AddDeathRecovery(State)
            PrepareDeathCart(State)
            set State.HoldForShop = true
            set State.ShopReason = 2
            spawn{DeathShopTimeout(Player)}

    OnArmoryPressed(Agent:agent):void=
        if (Player := player[Agent], State := PlayerStates[Player]):
            if (OpeningPhaseActive?):
                set State.ShopReason = 1
            else:
                # During combat this edits NEXT LOADOUT only.
                PrepareNextCart(State)
                set State.ShopReason = 4

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
