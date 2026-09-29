# Scrapline — Verse / Gameplay Integration Phase

## Status

**REOPENED FOR FEATURE FREEZE V2 — Armory implementation validation pending.**

The original native-first control case was validated on 2026-09-29 and remains the baseline for everything native UEFN already solves correctly. The later UEFN Central five-file manager package was rejected and remains quarantined in `UEFN_CENTRAL_GENERATOR_RESULT.md`.

The user has now intentionally added a requirement the fixed native loadout does not solve cleanly: a Counter-Strike-inspired, FFA-adapted Armory with match-local Scrap, buy/sell decisions, per-life loadouts, recovery income, next-life adaptation, JIP buy handling, and a seasonal catalog.

That requirement authorizes a **narrow custom Verse layer**. It does not authorize a custom FFA manager.

Astra environment construction remains blocked until the Armory candidate compiles in live UEFN, passes the critical lifecycle/economy tests, and the final contradiction/confusion audit returns to PASS.

## Governing authorities

Read before gameplay implementation:
1. `AGENTS.md`
2. `docs/AGENTS.md`
3. `docs/ARMORY_ECONOMY_SPEC.md` — **Armory/economy authority**
4. `docs/GAMEPLAY_SPEC.md`
5. this document — **implementation/wiring authority**
6. `docs/SPATIAL_CONTRACT.md`
7. `docs/ASSET_MANIFEST.md`
8. `docs/PHYSICAL_FIT_VERIFICATION.md`
9. `docs/TOOLING.md`
10. `docs/ONE_SHOT_PROMPT_DRAFT.md`
11. `docs/BUILD_READINESS.md`

Gameplay integration must not reopen map design. `SPATIAL_CONTRACT.md` remains placement authority.
## Architecture rule

Keep native authority wherever native behavior is already correct.

### Native authority

Island Settings continues to own:
- Free For All team structure,
- 16-player ceiling / 12-player target,
- native spawn selection,
- approximately 3-second respawn,
- approximately 2-second spawn immunity,
- 100 health / 100 shield,
- movement and fall-damage rules,
- building/destruction rules,
- Infinite Reserve Ammo / normal magazines,
- deleted eliminated inventory and disabled manual drops,
- native 50-point elimination sustain,
- elimination score,
- first-to-30 victory,
- time-limit fallback.

`TR_Eliminations` remains HUD feedback only.

### Custom Armory authority

`scrapline_armory_device` may own only:
- match-local Scrap balances,
- recovery-tier state,
- catalog configuration/validation,
- current / previous / queued loadout state,
- buy/sell/refund calculations,
- Armory UI,
- 45-second opening buy-phase gate,
- JIP first-buy gate,
- temporary legitimate shop protection,
- granting the committed catalog items,
- UI/state cleanup on leave.

It must not maintain a parallel elimination score, winner map, match timer, End Game path, or spawn solver.

## Required production objects

Candidate production device set:
- **Island Settings**
- **19 × Player Spawn Pad**
- **1 × Tracker — `TR_Eliminations`**
- **1 × Item Granter — `IG_Armory`**
- **1 × Elimination Manager — `EM_Economy`**
- **1 × Verse creative device — `scrapline_armory_device`**

No production End Game device.
No production Timer device for match authority.
No custom siphon/restoration device.
The old fixed-loadout `IG_Loadout` path and direct **Spawn Pad → IG_Loadout / Grant Item** binding are retired only after the Armory candidate validates.

## Island Settings delta

Keep the previously validated native baseline except for the round clock:

- Max Players: **16**
- Teams: **Free for All**
- Total Rounds: **1**
- Time Limit: **10 Minutes 45 Seconds**
- Eliminations to End: **30**
- Round Win Condition: **Eliminations**
- Last Standing Ends Game: **Off**
- Spawn Location: **Spawn Pads**
- Spawn Pad Selection: **Random**
- Respawn Type: **Individual**
- Respawn Time: **3 Seconds**
- Spawn Immunity Time: **2 Seconds**
- Spawn Limit: **Infinite**
- Join in Progress: **Spawn**
- Health / Shield: **100 / 100**
- Overshield: **Off**
- Health / Shield recharge: **Off**
- Fall Damage: **Off**
- Sprint / Slide / Mantle / normal Crouch: **On**
- Allow Building: **None**
- Infinite Reserve Ammo: **On**
- Infinite Magazine Ammo: **Off**
- Allow Item Drop: **No**
- Maximum Equipment Slots: **3**
- Start with Pickaxe: **No**
- Eliminated Player's Items: **Delete**
- Environment / Structure / Weapon / Pickaxe destruction: **Off / None**
- Health Granted on Elimination: **50**
- Max Trackers on HUD: **1**
- Show Elimination Feed: **Yes**

The extra 45 seconds are the non-combat opening Armory gate. Island Settings remains the sole native timeout authority.

## `TR_Eliminations`

Keep the validated Tracker contract:
- Stat to Track: **Eliminations**
- Target Value: **30**
- Starting Value: **0**
- Assign on Game Start: **On**
- Assign When Joining in Progress: **On**
- Sharing: **Individual**
- When Target Is Reached: **Do Nothing**
- Show on HUD: **Detailed**
- Use Persistence: **Off**

Do not call `Tracker.Increment` for normal eliminations. Do not let the Tracker end the round.
## `IG_Armory`

Use one Item Granter as the catalog backing store.

Register the first-release weapons in a stable editor-visible order. Keep unused/seasonal slots stable where practical so catalog changes do not silently shift indexes.

The Armory Verse grants a specific selection using the current Epic API:
- `item_granter_device.GrantItemIndex(Agent, ItemIndex)`.

Configuration intent:
- items go directly to the receiving player's inventory,
- drops at the player location are disabled,
- current-life inventory is expected to be empty after native elimination cleanup,
- sequential index grants must keep already granted Armory items rather than clearing on every grant,
- reserve ammo remains owned by Island Settings.

Do not hard-code Fortnite weapon asset identifiers in Verse. Catalog metadata stores the editor-configured Item Granter index.

Current Epic reference:
- https://dev.epicgames.com/documentation/fortnite/verse-api/fortnitedotcom/devices/item_granter_device/grantitemindex

## `EM_Economy`

Use one Elimination Manager only as a stable global economy event source.

Required Verse event surfaces:
- `EliminationEvent` — sends the eliminator agent; award +150 Scrap and reset that player's recovery tier.
- `EliminatedEvent` — sends the eliminated agent; apply that player's death-recovery payment and advance the recovery tier.

Do not configure `EM_Economy` to spawn/drop reward items.

This avoids per-character elimination subscriptions that must be recreated after every respawn.

Current Epic reference:
- https://dev.epicgames.com/documentation/fortnite/verse-api/fortnitedotcom/devices/elimination_manager_device
## Catalog contract

Prefer one Verse file for the first implementation unless live compiler/UI constraints justify a small helper.

Use an editor-configurable custom `class<concrete>`/array where supported. Epic currently documents editable custom class instances and arrays.

Each catalog entry should expose data equivalent to:
- stable ID,
- display name,
- category / allowed slot,
- Scrap price,
- `IG_Armory` item index,
- enabled,
- featured,
- seasonal tag,
- sort order.

The runtime shop is built from enabled entries. Seasonal weapon changes should be data/config changes, not changes to the economy state machine.

Current Epic reference:
- https://dev.epicgames.com/documentation/fortnite/editable-properties-in-verse

## UI contract

The UI must support:
- Scrap bank,
- Primary / Secondary / Sidearm browsing,
- price and affordability state,
- cart contents,
- cart total,
- projected remaining bank,
- Buy/Add,
- Sell/Remove,
- Ready,
- Rebuy,
- Change Loadout,
- Next Loadout,
- phase/death/JIP countdowns.

The opening shop is interactive and owns input focus while shown.

Epic's current UEFN UI path supports per-player widgets, buttons, and input mode through Verse/UMG:
- https://dev.epicgames.com/documentation/fortnite/making-widgets-interactable-in-unreal-editor-for-fortnite
- https://dev.epicgames.com/documentation/fortnite/custom-buttons-in-fortnite

UEFN Central's Verse UI Visual Builder may be used to prototype/export the layout. Its output is candidate code only until live UEFN validation.
## Lifecycle / subscriptions

At `OnBegin`:
- initialize every player already returned by `GetPlayspace().GetPlayers()`,
- subscribe once to `PlayerAddedEvent`,
- subscribe once to `PlayerRemovedEvent`,
- subscribe once to each of the 19 `SpawnedEvent` sources,
- subscribe once to `EM_Economy.EliminationEvent`,
- subscribe once to `EM_Economy.EliminatedEvent`.

Current Epic references confirm `GetPlayers`, PlayerAddedEvent, PlayerRemovedEvent, and Player Spawn Pad SpawnedEvent.

Do not subscribe a new elimination callback every respawn.

Per-player state must be removed when a player leaves:
- Armory canvas/widget reference,
- bank,
- recovery tier,
- current loadout,
- previous loadout,
- queued next loadout,
- temporary shop/gate flags.

Repeated UI open/close must not multiply purchase callbacks.

## Opening phase

For present players:
- initialize bank to 3,000,
- open the Armory,
- block combat participation for 45 seconds,
- allow free cart edits/refunds,
- Ready closes the full shop but does not release early,
- at expiry commit a valid cart or fallback,
- grant the chosen indexes,
- release all eligible players together.

The 45-second Verse timer is a phase gate only. It must never call End Game.

Current `fort_character` APIs expose stasis, visibility, and vulnerability controls. Use only what live UEFN compilation/runtime proves necessary.

## Respawn / adaptation

A loadout belongs to one life.

On death:
- native settings delete the current weapons,
- `EM_Economy` awards recovery,
- queued Next Loadout is preferred if valid/affordable,
- otherwise Rebuy may commit the previous loadout if affordable,
- otherwise the player may Change Loadout,
- otherwise the safe fallback is used.
If the player is still shopping when the native respawn occurs, the new character may be hidden/invulnerable/in stasis only until Ready or the **8-second total post-death hard limit** expires.

The shop may also be opened while alive to edit Next Loadout:
- no current weapon changes,
- no immediate charge,
- no immediate grant,
- no invulnerability,
- the player remains physically present and vulnerable while the menu owns input.

## Join in progress

JIP receives:
- 3,000 starting Scrap,
- normal Tracker assignment,
- a protected first-buy opportunity,
- no change to the global clock.

During the opening phase, a JIP player joins the global shop but receives at least 12 seconds of personal protected shopping from join time.

During active combat, a JIP player receives up to 12 seconds of protected personal shopping, then commits/falls back and enters the match.

## Economy invariants

Locked values are in `ARMORY_ECONOMY_SPEC.md`.

Implementation invariants:
- charge a life exactly once,
- reward an elimination exactly once,
- reward a death exactly once,
- bank never below 0,
- bank never above 5,000,
- invalid/disabled catalog entry never grants a different item by accident,
- free fallback always permits entry,
- no economy event increments elimination score,
- no economy event ends the round.

## Prior validation history

2026-09-29 native control:
- optional siphon Verse candidate compiled with 0 live diagnostics,
- siphon was removed as redundant,
- live `ValkyrieToolset.VerseToolset.BuildAll` with no custom production Verse returned **0 diagnostics**.

UEFN Central original experiment:
- failed run `4b6861de-6c4d-5292-9a65-ad6f7eb0ee1d`,
- completed run `6e9b9891-1848-5b65-8289-50521fc26c9b`,
- completed run marked **Not validated**,
- five-file architecture rejected for API/compiler defects, lifecycle gaps, duplicate score/end authority, extra wiring, and 16-pad contradiction.

That rejected package remains historical evidence. Do not use it as the Armory implementation base.
## Current implementation checkpoint

2026-09-29 live UEFN:
- created one candidate file: `/Scrapline/Verse/scrapline_armory_device.verse`,
- current core covers catalog metadata, match-local bank/recovery state, one-time global subscriptions, 19-pad spawn hooks, JIP/leave cleanup, opening/JIP/death phase gates, indexed Item Granter grants, and stasis/vulnerability release logic,
- current Epic digests were queried live for `GrantItemIndex`, Elimination Manager events, playspace lifecycle, spawn events, stasis, and player UI APIs,
- first compile exposed six Verse effect-context errors only; those were repaired,
- live `ValkyrieToolset.VerseToolset.BuildAll` after repair: **0 diagnostics**,
- functional Verse UI/cart interaction is now implemented in the same one-file candidate: dynamic catalog rows, per-slot replacement/clear, Rebuy, Ready, queued Next Loadout, input-trigger reopen, per-player UI cleanup, and input focus,
- the UI pass produced one additional effect-context diagnostic; it was repaired,
- live `ValkyrieToolset.VerseToolset.BuildAll` after the UI repair: **0 diagnostics**,
- runtime device references, first-release catalog registration/index wiring, visible countdown polish, and multiplayer runtime tests remain pending, so this is **not yet production-authoritative**.

The verified text mirror is tracked in `verse/scrapline_armory_device.verse`.

## Armory validation gate

Before production adoption, verify in live UEFN:

1. 45-second opening phase and approximately 10:00 combat remainder.
2. Ready / reopen / timeout fallback.
3. Purchase deducted once.
4. +150 elimination reward once.
5. Death recovery 1,500 → 1,750 → 2,000 cap.
6. Recovery reset after an elimination.
7. Rebuy affordable/unaffordable behavior.
8. Next Loadout queued while alive without current-life weapon changes.
9. Native ~3-second respawn plus maximum 8-second protected change window.
10. All 19 spawn pads preserve native spawn selection and grant the committed loadout.
11. JIP during opening phase.
12. JIP during active combat.
13. Leave while UI/queued state exists.
14. Repeated death/UI cycles do not duplicate subscriptions, charges, rewards, or grants.
15. Simultaneous eliminations do not create a second winner authority.
16. Invalid/disabled catalog index fails safe.
17. 12-player target / 16-player ceiling smoke test.
18. `ValkyrieToolset.VerseToolset.BuildAll` returns zero diagnostics for accepted code.

Standalone verse-lsp or generator validation does not outrank the live Epic compiler.

## Environment ownership prohibition

Armory Verse must not own:
- terrain,
- map layout,
- asset placement,
- spawn coordinates,
- lighting,
- VFX placement,
- asset discovery,
- environment construction.

## Phase exit

**PENDING.**

The design is frozen, but production Armory code is not yet validated.

The phase returns to PASS only when:
- the smallest accepted Armory implementation compiles in live UEFN,
- the critical lifecycle/economy tests pass,
- exact editor wiring/catalog indexes are documented,
- `ONE_SHOT_PROMPT_DRAFT.md` reflects verified reality,
- `ASTRA_CONFUSION_AUDIT.md` returns to PASS.

Until then, stop before Astra construction.
