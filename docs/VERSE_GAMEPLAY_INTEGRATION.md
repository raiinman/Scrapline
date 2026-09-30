# Scrapline — Verse / Gameplay Integration Phase

## Status

**FEATURE FREEZE V2 HANDOFF READY — compile-clean Armory scaffold frozen; final UMG/runtime acceptance assigned to GPT-6.1 Sol construction/post-build.**

The original native-first control case was validated on 2026-09-29 and remains the baseline for everything native UEFN already solves correctly. The later UEFN Central five-file manager package was rejected and remains quarantined in `UEFN_CENTRAL_GENERATOR_RESULT.md`.

The user has now intentionally added a requirement the fixed native loadout does not solve cleanly: a Counter-Strike-inspired, FFA-adapted Armory with match-local Scrap, buy/sell decisions, per-life loadouts, recovery income, next-life adaptation, JIP buy handling, and a seasonal catalog.

That requirement authorizes a **narrow custom Verse layer**. It does not authorize a custom FFA manager.

The Armory is no longer a pre-construction presentation blocker. The current candidate compiles in live UEFN and defines the frozen gameplay authority boundary. Final UMG presentation plus the critical lifecycle/economy multiplayer matrix are explicit GPT-6.1 Sol construction/post-build tasks. Construction authorization was granted on 2026-09-30.

## Governing authorities

Read before gameplay implementation:
1. `AGENTS.md`
2. `docs/AGENTS.md`
3. `docs/ARMORY_ECONOMY_SPEC.md` — **Armory/economy authority**
4. `docs/ARMORY_UI_SPEC.md` — **Armory presentation/navigation authority**
5. `docs/GAMEPLAY_SPEC.md`
6. this document — **implementation/wiring authority**
7. `docs/SPATIAL_CONTRACT.md`
8. `docs/ASSET_MANIFEST.md`
9. `docs/PHYSICAL_FIT_VERIFICATION.md`
10. `docs/TOOLING.md`
11. `docs/SOL61_ONE_SHOT_PROMPT.md`
12. `docs/BUILD_READINESS.md`

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
- **1 × Input Trigger — `IT_Armory`**
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

Current live first-release contract, verified 2026-09-30:
- `IG_Armory` has exactly **7** registered items at indices **0..6**,
- Verse `RegisteredItemCount` is **7**,
- catalog `ItemIndex` values outside that range are invalid and must be rejected before `GrantItemIndex`,
- changing the registered item count or order requires updating the catalog/index contract and recompiling before runtime testing.

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

Use one Elimination Manager only as the stable **eliminator-income** source.

Required Verse event surface:
- `EliminationEvent` — sends the eliminator agent; award +150 Scrap and reset that player's recovery tier.

Required production setting:
- **Valid On Self Elimination = Off.** Self/manual/environmental deaths are handled by the victim-side character watcher below and must never generate +150 eliminator income.

Victim lifecycle is intentionally separate: each initialized player owns exactly one suspending watcher that awaits the current active `fort_character.EliminatedEvent()`, applies death recovery / protected next-life Armory state, then waits for the next native-spawned active character before re-arming. This covers self and non-agent deaths without depending on `EM_Economy.EliminatedEvent`.

Do not configure `EM_Economy` to spawn/drop reward items. Production code does not subscribe to `EM_Economy.EliminatedEvent`.

Current Epic reference:
- https://dev.epicgames.com/documentation/fortnite/verse-api/fortnitedotcom/devices/elimination_manager_device

## `IT_Armory`

Use exactly one Input Trigger for the Armory open/reopen action.

Current live testbench contract, verified 2026-09-30:
- actor label: `IT_Armory`,
- Creative Input Action: **Custom 14 (Toggle Inventory)**,
- Consume Input: **On**,
- Show on HUD: **On**,
- HUD Description: **ARMORY {input}**,
- Enabled at Game Start: **On**.

The Verse device discovers `IG_Armory`, `EM_Economy`, and `IT_Armory` by their generated Verse tags and intentionally requires **exactly one** object for each role. Missing or duplicate tagged roles make `OnBegin` abort instead of guessing.

Astra must therefore inventory and reuse the existing tagged live roles before creating devices. Do not place a second production `IG_Armory`, `EM_Economy`, or `IT_Armory` while the tagged testbench actor still exists.

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
- subscribe once to `EM_Economy.EliminationEvent` for eliminator income only,
- start exactly one `WatchPlayerDeaths` coroutine per initialized player,
- subscribe once to the Armory input and active UMG event surfaces.

**Do not subscribe the Armory to Player Spawn Pad events.** Native Player Spawn Pads remain the sole spawn-selection authority. The Armory waits for the native-spawned character/player state to become ready, then grants/releases the committed loadout.

Do not create a new callback stack every respawn. `WatchPlayerDeaths` is one long-lived coroutine per initialized player; after each awaited elimination it waits until the next active native-spawned character exists before awaiting that character's `EliminatedEvent()`.

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
- current core covers catalog metadata, match-local bank/recovery state, one-time playspace/economy/input subscriptions, JIP/leave cleanup, opening/JIP/death phase gates, character-ready grant/release logic, indexed Item Granter grants, and stasis/vulnerability handling; native Spawn Pads remain unhooked and authoritative,
- current Epic digests were queried live for `GrantItemIndex`, Elimination Manager events, playspace lifecycle, spawn events, stasis, and player UI APIs,
- first compile exposed six Verse effect-context errors only; those were repaired,
- live `ValkyrieToolset.VerseToolset.BuildAll` after repair: **0 diagnostics**,
- functional Verse UI/cart interaction is now implemented in the same one-file candidate: dynamic catalog rows, per-slot replacement/clear, Rebuy, Ready, queued Next Loadout, input-trigger reopen, per-player UI cleanup, and input focus,
- the UI pass produced one additional effect-context diagnostic; it was repaired,
- live `ValkyrieToolset.VerseToolset.BuildAll` after the UI repair: **0 diagnostics**,
- visible opening/JIP/death countdowns are now implemented in the same one-file UI candidate,
- the candidate was refactored to discover the three required classic devices through Verse Tag Markup (`armory_granter_tag`, `armory_economy_tag`, `armory_input_tag`) instead of brittle device `@editable` references; native Spawn Pads remain completely outside Verse ownership,
- the tag-discovery refactor also passes live `ValkyrieToolset.VerseToolset.BuildAll` with **0 diagnostics**,
- the testbench `IG_Armory`, `EM_Economy`, and `IT_Armory` actors have the generated tag classes applied and saved,
- runtime tag discovery and the first-release 7-item Item Granter index wiring have been exercised in the live testbench; indexed grants and the opening 45-second gate were observed in Fortnite,
- production presentation has moved to `/Scrapline/UI/WBP_ScraplineArmory`: 8 category tabs, 8 reusable paged weapon-card controls, Prev/Next, Ready, Re-buy, and Clear,
- UMG Custom Button `OnButtonClicked` events are bound through generated Verse `event(tuple())` fields; the one-file Armory device instantiates `UI.WBP_ScraplineArmory{}` and subscribes to those events,
- live `ValkyrieToolset.VerseToolset.BuildAll` remains **0 diagnostics** after the UMG integration,
- a forbidden `DefaultContentWidgetClass = None` styling experiment was rejected by UEFN validation and removed from the production direction; the validator-safe design preserves Epic's required button content, uses transparent button hitboxes, and draws Scrapline's flat card surfaces beneath them,
- the final validator-safe UMG pass still needs a fresh live-session visual/runtime test after UEFN re-authenticates; the current editor lost its Epic Connect token (`EOS_EpicConnect_TokenIsNoLongerValid`), so this is **not yet production-authoritative**.

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
16. Invalid/disabled/out-of-range catalog index fails safe and never grants a different registered item.
17. Self/manual/environmental death receives victim recovery/shop handling but never +150 self-elimination income.
18. 12-player target / 16-player ceiling smoke test.
19. `ValkyrieToolset.VerseToolset.BuildAll` returns zero diagnostics for accepted code.

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

**HANDOFF READY; PRODUCTION ACCEPTANCE DEFERRED TO ASTRA BUILD/POST-BUILD.**

The design/authority contract and compile-clean Armory scaffold are frozen. Final visual/runtime production acceptance is intentionally part of the Astra pass.

The integration architecture is ready for Astra handoff when:
- the accepted Armory implementation compiles in live UEFN,
- the authority boundary and catalog/device contract are documented,
- `ONE_SHOT_PROMPT_DRAFT.md` explicitly assigns final UMG presentation and runtime acceptance to Astra,
- `ASTRA_CONFUSION_AUDIT.md` confirms there is no contradiction about who owns those tasks.

Final production PASS still requires the critical lifecycle/economy matrix, but that matrix now runs during/after GPT-6.1 Sol construction against the real 19-spawn level and final `WBP_ScraplineArmory`.

Do not start Astra automatically; explicit user authorization is still required.
