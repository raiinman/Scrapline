# Scrapline — Armory / Match Economy Specification

## Status

**FEATURE FREEZE V2 — design locked; compile-clean implementation scaffold established; final runtime validation moves into Astra build/post-build.**

The Armory is now a core Scrapline mechanic. It intentionally reopens a **small custom Verse surface** because the native fixed-loadout control case cannot provide the desired per-player buy/sell economy and adaptive next-life loadouts cleanly.

This change does **not** reopen map design. `SPATIAL_CONTRACT.md` remains authoritative for terrain, districts, routes, spawn regions, major anchors, verticality, lighting, and environment construction.

The Armory mechanic is no longer a pre-Astra presentation blocker. The current candidate compiles in live UEFN and is documented as the implementation baseline.

When Astra is explicitly authorized to build the level, Astra must:
- preserve this frozen economy contract,
- finish/repair the Armory presentation using `ARMORY_UI_SPEC.md`,
- wire the final production devices,
- run the lifecycle/economy test matrix in this document during/after construction,
- keep the native control case available as the fallback if the custom layer proves materially less reliable.

## Core loop

Scrapline remains a 12-player-target / 16-player-cap FFA.

The player-facing loop is:

**45-second opening Armory → ~10 minutes of combat → first to 30 eliminations wins.**

The Armory borrows Counter-Strike-style economic decision making without copying Counter-Strike's round/elimination structure.

Players spend match-local **Scrap** on the weapons for a life, earn modest Scrap from eliminations, receive recovery income after death, and may adapt their next loadout instead of being trapped with one setup for the whole match.
## Economy — locked alpha values

- Currency name: **Scrap**.
- Persistence: **match-local only**; no cross-match wallet or permanent unlock economy in alpha.
- Starting bank: **3,000 Scrap**.
- Bank cap: **5,000 Scrap**.
- Elimination reward: **+150 Scrap** to the eliminator.
- Base death recovery: **+1,500 Scrap**.
- Consecutive-death recovery step: **+250 Scrap** per consecutive death without an elimination.
- Maximum death recovery: **2,000 Scrap**.
- Any elimination resets that player's recovery tier so their next death returns to the 1,500 base.
- No kill-streak income multiplier.
- No placement income.
- No interest.
- No persistent economy.
- No economy reward may alter the native elimination score or match-end authority.

Examples:
- first death after a kill or at match start: +1,500,
- second consecutive death without a kill: +1,750,
- third and later consecutive deaths without a kill: +2,000 cap.

The recovery system is intentionally stronger than the kill reward so the economy does not snowball toward the player already winning.

## Purchase commitment

A cart is only charged when its loadout is committed for the next life.

Before commitment:
- add/remove/sell is a **100% refund**,
- changing a queued next-life cart does not touch current inventory,
- no weapon is granted merely because its card was selected.

After commitment:
- Scrap is deducted once,
- that life's weapons are granted,
- the purchase is non-refundable,
- the weapons are lost on death.
Island Settings keeps **Eliminated Player's Items = Delete** and **Allow Item Drop = No** so there is no corpse-loot or dropped-weapon economy.

## Loadout shape

The alpha has three weapon slots:
1. **Primary** — rifle / marksman / sniper / primary shotgun families as approved by the catalog.
2. **Secondary** — SMG / compact shotgun / other approved secondary families.
3. **Sidearm** — pistol / approved sidearm families.

Each catalog entry declares which slot it may occupy. The Armory must reject an invalid slot combination.

A **free fallback sidearm** is always enabled. A player can never become unable to enter combat because their bank is too low.

Price-policy bands for the first catalog:
- fallback/basic sidearm: **0–300**,
- premium sidearm: **400–600**,
- SMG / secondary: **900–1,300**,
- shotgun: **1,200–1,600**,
- standard rifle: **1,500–2,000**,
- marksman / premium rifle: **1,800–2,400**,
- high-impact sniper / special: **3,200–4,200**.

Exact weapon names and exact per-entry prices remain editor-configurable catalog data. Powerful long-range/special weapons should normally require saving rather than being automatic opening buys.

## Opening Armory phase

At match start:
- all present players receive 3,000 Scrap,
- all present players are protected and prevented from participating in combat,
- the Armory opens automatically,
- opening buy duration is **45 seconds**,
- a balanced starter preset is preselected so a new player can simply press Ready,
- players may freely edit/refund the pending cart,
- pressing Ready closes the full shop but does not release the player early,
- the player may reopen the cart until the global phase expires.
At 45 seconds:
- every valid cart commits,
- an invalid/empty cart receives the safe fallback preset or free fallback sidearm,
- selected weapons are granted,
- player protection/stasis is removed,
- combat begins for everyone together.

Use a native round time of **10:45** so the intended combat window remains approximately 10 minutes. Native Island Settings still owns the authoritative timeout and 30-elimination match end.

The Armory's 45-second timer is a **phase gate only**. It is not a second match timer and may not end the round.

## Mid-match adaptation

A purchased loadout belongs to one life.

On elimination:
1. the eliminated player's current items are deleted natively,
2. the economy adds the player's death-recovery payment,
3. the eliminated player may rebuy, change, or use a queued next-life loadout,
4. the next committed loadout is charged exactly once,
5. that loadout is granted for the next life.

Fast path:
- if a valid queued **Next Loadout** exists and is affordable, commit it automatically,
- otherwise offer **REBUY** for the last loadout when affordable,
- otherwise offer **CHANGE LOADOUT**,
- if no valid choice is made by the hard limit, use the safe fallback.

The native respawn target remains approximately **3 seconds**.

If a player explicitly chooses to change after death and is still shopping when the native respawn occurs, the newly spawned character may be hidden, invulnerable, and placed in stasis for a maximum of **8 seconds total post-death Armory time**. Ready immediately releases them. The hard limit prevents invulnerability abuse.

## Editing the next loadout while alive

Players may open the Armory while alive to edit **NEXT LOADOUT**.

This does not:
- remove or replace current-life weapons,
- spend Scrap immediately,
- grant weapons immediately,
- make the player invulnerable.
Opening the live Armory consumes UI input focus; the player remains physically present and vulnerable. This prevents using the shop as a combat invulnerability button.

The queued cart is revalidated against the player's bank when it is actually committed after death.

## Join in progress

JIP remains supported.

A JIP player:
- starts with **3,000 Scrap**,
- receives a personal first-life Armory opportunity,
- never changes the global match clock,
- does not restart the opening phase for existing players.

If JIP occurs during the global opening phase:
- the player joins that phase,
- but is guaranteed at least **12 seconds** of protected shopping from their own join time.

If JIP occurs after combat begins:
- the player receives up to **12 seconds** of protected personal shopping,
- commits a valid first-life loadout or receives the fallback,
- then enters the active match.

## Seasonal / live-ops catalog contract

The Armory must be data-driven. Seasonal changes must not require rewriting the economy state machine.

Each catalog entry should expose editor-configurable data equivalent to:
- stable catalog ID,
- display name,
- category / allowed slot,
- Scrap price,
- Item Granter item index,
- enabled flag,
- featured flag,
- seasonal tag,
- sort order.

Use an editable custom Verse class/array for catalog configuration where the live compiler supports it.

Disabled entries remain out of the shop without changing economy code. Preserve stable Item Granter indexes where practical so a seasonal rotation is a data/config change instead of an architecture change.

Alpha does **not** include persistent unlocks, a battle pass, permanent wallets, or paid power. Those are future systems, not hidden requirements.

## Production device architecture

Keep native authority wherever native behavior is already correct.
Required gameplay objects:
- **Island Settings** — FFA, 10:45 total round clock, native 30-elimination end, health/shield, movement, respawn, spawn immunity, native 50-point elimination sustain, inventory/drop rules.
- **19 × Player Spawn Pad** — native spawn selection only.
- **1 × Tracker: `TR_Eliminations`** — individual 0/30 HUD feedback only.
- **1 × Item Granter: `IG_Armory`** — registers the catalog weapons in a stable order.
- **1 × Elimination Manager: `EM_Economy`** — event source for eliminator/eliminated economy updates; no item drops.
- **1 × Verse creative device: `scrapline_armory_device`** — economy, catalog, Armory UI, loadout commitment/granting, opening phase, JIP, leave cleanup, and temporary shop protection.

The old fixed-loadout `IG_Loadout` production path and the direct **Spawn Pad → IG_Loadout / Grant Item** binding are retired once the Armory implementation validates.

Use `IG_Armory.GrantItemIndex(Agent, ItemIndex)` for specific catalog selections rather than creating one Item Granter per weapon.

The Armory Verse may subscribe once to:
- playspace PlayerAddedEvent,
- playspace PlayerRemovedEvent,
- EM_Economy EliminationEvent,
- EM_Economy EliminatedEvent,
- Armory input/UI widget events.

**Do not bind the Armory to the 19 Player Spawn Pads.** Native Spawn Pads remain the sole spawn-selection authority. The Armory reacts to player/character readiness after native spawning rather than choosing or driving spawn pads.

Do not subscribe per-respawn to `fort_character.EliminatedEvent` when `EM_Economy` already provides the required global eliminator/eliminated event surface.

## Verse ownership boundary

Custom Verse is authorized to own only:
- match-local Scrap balances,
- recovery-tier state,
- current / previous / queued loadout IDs,
- catalog validation,
- buy/sell/refund calculations,
- Armory UI state,
- opening buy-phase gate,
- JIP first-buy gate,
- temporary stasis/visibility/vulnerability protection while a player is legitimately gated by the Armory,
- granting the committed catalog items,
- per-player state/UI cleanup on leave.
Custom Verse must **not** own:
- elimination score,
- 30-elimination victory,
- 10-minute combat timeout,
- end-game activation,
- spawn coordinates or spawn selection,
- elimination sustain,
- terrain,
- map layout,
- environment art,
- asset placement,
- lighting,
- VFX placement,
- persistent progression.

There is no production End Game device and no production Timer device for match authority.

## UI contract

The Armory UI must expose, at minimum:
- current Scrap bank,
- category tabs,
- weapon name and price,
- affordability / disabled state,
- current cart by slot,
- cart total,
- projected bank after purchase,
- Buy/Add,
- Sell/Remove,
- Ready,
- Rebuy,
- Change Loadout,
- Next Loadout state,
- visible opening/death/JIP countdown when one exists.

A small persistent **SCRAP / ARMORY** HUD control may open the Next Loadout menu while alive. It must coexist cleanly with `TR_Eliminations`.

UEFN Central's Verse UI Visual Builder may be used to prototype/export layout code, but generated UI/Verse remains candidate material until live UEFN compile and runtime validation.

## Failure-safe rules

- Never deduct Scrap twice for one life.
- Never grant a cart before it is committed.
- Never grant more than the legal slot count.
- Never allow a negative bank.
- Clamp bank at 5,000.
- If a referenced catalog index is invalid, disable that entry and report it rather than granting a different weapon.
- A failed/empty cart must always degrade to the free fallback safely.
- Leaving the match removes player UI and match-local state.
- Rejoining starts as JIP with the normal 3,000 first-entry bank in alpha.
- Simultaneous eliminations may award economy events independently but may not touch the native winner calculation.
## Validation gate

Before this feature becomes production-authoritative, test in live UEFN:

1. Opening phase with 1 player: 45-second gate, Ready, reopen, fallback, correct 10:00 combat remainder.
2. Two players: purchase charge exactly once; elimination +150; victim recovery +1,500.
3. Recovery ladder: consecutive deaths reach 1,750 then 2,000 and cap; an elimination resets the tier.
4. Rebuy: affordable and unaffordable cases.
5. Next Loadout: queue while alive, no current-life inventory change, correct next-spawn commit.
6. Death shop: native ~3-second respawn plus maximum 8-second protected shop hold; no indefinite invulnerability.
7. Spawn cycle: all 19 pads can grant the selected loadout without changing native spawn selection.
8. JIP during opening phase with >12 and <12 seconds remaining.
9. JIP during active combat.
10. Leave while shop is open; leave while queued state exists; rejoin as JIP.
11. Duplicate subscription attack: repeated deaths/JIP/UI open-close must not multiply rewards or grants.
12. Double/simultaneous eliminations: economy may award both events; Island Settings remains sole winner authority.
13. Bank bounds: never negative, never above 5,000.
14. Invalid catalog index / disabled seasonal entry.
15. 12-player target and 16-player ceiling smoke test.
16. Live `ValkyrieToolset.VerseToolset.BuildAll`: zero diagnostics for accepted production code.

Do not trust UEFN Central or standalone verse-lsp validation over the live Epic UEFN compiler.

## Phase exit

The Armory design is frozen by this document.

The Armory design/architecture phase is complete enough for Astra handoff: the candidate code is live-compiler clean and the responsibility boundaries are frozen.

Final production acceptance still requires the critical lifecycle/economy tests above, but those tests are now part of the **Astra construction/post-build validation pass**, when the real 19-spawn level and final UMG widget exist.

Do not start Astra automatically; explicit user authorization is still required.
