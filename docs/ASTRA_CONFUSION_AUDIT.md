# Scrapline — Astra Confusion Audit

## Status

**PASS AFTER HOSTILE RED TEAM — no remaining pre-construction design/authority blocker; listed runtime acceptance risks remain explicit GPT-6.1 Sol build/post-build obligations.**

This audit asks a hostile question: *If Astra wanted to misunderstand the design while technically following the docs, where could it do so?*

The original spatial/design ambiguity purge remains valid. Feature Freeze v2 added the Scrapline Armory / match economy, and the authority boundary is now frozen across `ARMORY_ECONOMY_SPEC.md`, `ARMORY_UI_SPEC.md`, and `VERSE_GAMEPLAY_INTEGRATION.md`.

The red-team-hardened Armory Verse/UMG scaffold is live-compiler clean after catalog-range, protected-shop-input, and victim-death lifecycle fixes. Final `WBP_ScraplineArmory` presentation plus the full lifecycle/economy/multiplayer matrix are intentionally **not pre-construction blockers**; they are explicit GPT-6.1 Sol construction/post-build acceptance tasks.

This document did **not** itself authorize construction at red-team closeout. **That gate was subsequently satisfied when the user explicitly authorized the one-shot on 2026-09-30. The active worker is GPT-6.1 Sol.**

## Authority created

`SPATIAL_CONTRACT.md` is now the single placement authority for:
- macro spatial layout,
- major anchor placement and orientation,
- route connectivity and width limits,
- central approach windows,
- outer-flank behavior,
- verticality/catwalk budget,
- spawn-region distribution,
- lighting/time-of-day concept,
- implementation freedom versus prohibited redesign.

The active GPT-6.1 Sol prompt must read it before the softer composition/design documents.

## Ambiguities found and closed

| Previous ambiguity | Failure Astra could have produced | Resolution |
| --- | --- | --- |
| MAP_DESIGN said the exact hero was still flexible | Astra could choose a different crane/machine | Hero is explicitly frozen to the Factory shared-pivot gantry assembly |
| TERRAIN spec told the agent to select a central landmark | Astra could re-run design selection | Rewritten to place the already-selected Factory gantry |
| Gantry had no explicit heading | 26.9 m asset could be rotated into a wall across center | Target center and NW↔SE endpoint/orientation test are frozen |
| “Slightly off center” was subjective | Astra could move the gantry too far into a district | Target center ~(-250,+250), ~±300 cm terrain-fit tolerance |
| Crane shared-pivot grounding was easy to misread | Cable minimum could sink/misplace the structure | Ground from structural crane; never from lower cable bound |
| Garage district lacked placement/facing authority | Garage could face outward or sit as an isolated box | Target SE anchor and center-facing service court are frozen |
| Garage roof was described as possible traversal | Astra could build a dominant roof route | Roof is rare/intentional high access; no easy catwalk feed |
| District connectivity was conceptual only | Agent could create dead ends or weak cross-links | Center + both neighbors + broken flank required for every district |
| Outer flank was merely “broken” | Agent could still build a near-complete ring | Continuous-ring prohibition plus interruption rules are explicit |
| Catwalk guidance had no hard run budget | Agent could create an elevated highway | ~15 m / three-flat-module uninterrupted cap; two main clusters preferred |
| Wooden catwalk rarity was subjective | Agent could overuse wood while claiming “some” restraint | One functional wooden route, normally ≤2 modules |
| Container stacking was unspecified | Agent could make three-high towers | Routine maximum is two high; double stack counts as +6 m combat position |
| Vehicle/container lane blocking was qualitative | Agent could plug 4.5 m secondary connectors | Required routes must retain ~3 m practical traversal minimum |
| Spawn layout had 15 anchors plus “3–5 more” | Agent could invent arbitrary mid spawns | 19 named candidate regions frozen, with local fit tolerance |
| Lighting was left for implementation | Agent could make a night/neon/dark cinematic map | Readable hazy/overcast late-afternoon daylight is frozen |
| “Inspect and categorize” implied new asset selection | Agent could treat the frozen pool as a new design exercise | One-shot now says verify required assets; do not re-select major anchors |
| Asset-manifest section still said it was blocked on freezing | Agent could treat asset roles as undecided | Prompt now states the manifest is already frozen |
| Prompt did not define authority precedence | Softer old prose could override newer decisions | Spatial, asset, fit, and gameplay authorities are explicitly separated |
| Fallback behavior was vague | Agent could substitute a major structure for convenience | Emergency fallback hierarchy requires an actual technical failure and reporting |
| Implementation freedom was not bounded | “Artistic judgment” could mutate combat geometry | Allowed micro choices and forbidden macro redesign are listed separately |
| Handoff draft still spoke to Codex generically | Model-specific execution intent was unclear | One-shot draft now addresses Astra as the implementation model |
| UEFN Central generated 16 spawn pads + five Verse files + Timer/End Game paths | Astra could mix a rejected architecture into the active package | Generator result remains quarantined. Feature Freeze v2 authorizes only the narrow Armory Verse boundary; 19 pads and Island Settings score/end authority remain frozen. |
| Armory UI polish stalled in ChatGPT remote-editor mode | Astra could think the current scaffold is visually final, or conversely refuse to build until it is already perfect | `ARMORY_UI_SPEC.md` explicitly makes final UMG presentation an Astra construction task; the current `WBP_ScraplineArmory` is a scaffold/reference, not a visual-finish mandate. |

## Spatial decisions the build worker no longer owns

GPT-6.1 Sol is **not** asked to invent:
- where the five major combat spaces are,
- which asset is the hero,
- gantry orientation,
- Garage district/orientation intent,
- which major vehicle belongs in which district,
- central ingress/egress relationships,
- neighbor-route requirements,
- outer-flank topology,
- spawn distribution pattern,
- elevation bands,
- catwalk network scope,
- container stack ceiling,
- lighting concept,
- primary/fallback hierarchy.

## Decisions intentionally left local

These are safe implementation choices because they do not redesign the skeleton:
- exact micro-prop location/rotation,
- individual approved clutter/decal/graffiti variant,
- small cover offsets needed to maintain route widths,
- fine Landscape blending around mesh footprints,
- restrained VFX placement,
- exact spawn transform inside its frozen region after LOS/collision exists,
- exposure/intensity tuning inside the frozen lighting treatment.

## Verification sweep

After the first rewrite pass, the governing handoff/design documents were searched again for stale phrases that would reopen:
- central-landmark selection,
- exact-hero flexibility,
- “Still Flexible During Implementation,”
- final lighting/time-of-day selection,
- old Codex one-shot wording in the implementation prompt.

No remaining matches were found in the audited handoff/design set.

## 2026-09-30 hostile red-team delta

The red team found and closed several implementation/handoff traps without reopening the frozen map:
- `IT_Armory` was promoted to an explicit required exact-one production role; missing/duplicate tagged Armory devices now have clear fail-closed handoff instructions,
- Item Granter catalog mappings are range-checked against the verified 7-item / index 0–6 live contract before `GrantItemIndex`,
- protected opening/JIP/death shops can no longer be converted into deadline-free live `Next Loadout` mode by the Armory hotkey,
- victim recovery/shop lifecycle is separated from eliminator income: `EM_Economy` stays Valid On Self Elimination = Off and only supplies `EliminationEvent`; one long-lived per-player `fort_character.EliminatedEvent()` watcher handles victim/self/environment deaths,
- stale Player Spawn Pad `SpawnedEvent` subscription wording was removed; pads remain native-only,
- the MCP Verse write failure fallback is documented: inspect/read back, edit the live source through an authorized local path if required, then prove the result with live `BuildAll`,
- three 8192 Propane/Gas Cylinder source textures remain health warnings, but the current LOD/streaming configuration passed the 2026-09-30 UEFN local validation/content-cook path; finished-map memory and Creator Portal checks remain required.

No red-team correction changes the frozen spatial skeleton, asset selection, economy values, or native score/spawn/end authority.

## Feature Freeze v2 gameplay contradiction sweep

The spatial/design checks above remain valid. The gameplay **authority/hand-off closeout passes**: the Armory mechanic, native-vs-custom ownership boundary, and UI responsibility are all explicit. Runtime production acceptance remains a build/post-build test obligation rather than a pre-construction ambiguity.

Production acceptance during/after the GPT-6.1 Sol pass must verify all of the following:
- playable/scenic envelopes and all frozen anchors remain unchanged,
- all **19** spawn regions remain authoritative,
- Armory Verse never chooses spawn coordinates or moves spawn pads,
- Island Settings remains the sole 30-elimination / timeout winner authority,
- native combat target is approximately 10 minutes after the frozen 45-second opening Armory gate,
- `TR_Eliminations` remains HUD feedback only,
- no manual Tracker increment is used for normal eliminations,
- no production End Game device or match-authority Timer is introduced,
- `IG_Armory` replaces the fixed `IG_Loadout` path only after live validation,
- `EM_Economy` is used only as the eliminator-income event source, keeps Valid On Self Elimination = Off, and drops no economy items; victim recovery/shop state comes from the single per-player character death watcher,
- Armory Verse owns only Scrap, catalog/cart/loadout state, UI, buy gates, granting, and cleanup,
- Armory Verse does not own elimination score, victory, native timeout, spawn selection, sustain, terrain, layout, lighting, VFX, or asset placement,
- starting Scrap = **3,000**, cap = **5,000**, elimination reward = **150**, recovery ladder = **1,500 / 1,750 / 2,000**,
- purchases charge once per life and rewards fire once per event,
- free fallback prevents a player from becoming unable to spawn,
- JIP / leave / repeated death / UI open-close do not duplicate death watchers/subscriptions, grants, or currency events,
- self/manual/environmental deaths receive victim recovery/shop handling without +150 self-income,
- protected shop input cannot erase or bypass its opening/JIP/death deadline,
- Infinite Reserve Ammo = On / Infinite Magazine Ammo = Off remains explicit,
- the rejected UEFN Central five-file package appears only as labeled evidence,
- accepted Armory code compiles with live UEFN at zero diagnostics,
- exact first-release catalog Item Granter index contract is documented and final production indexes are verified during the GPT-6.1 Sol pass,
- `ARMORY_UI_SPEC.md` makes final presentation/pagination/loadout-rail ownership an explicit GPT-6.1 Sol task,
- `ONE_SHOT_PROMPT_DRAFT.md` no longer contains stale native-only fixed-loadout or pre-Astra-UMG-blocker instructions.

## Current blockers

There are **no remaining design/confusion blockers** to the GPT-6.1 Sol handoff.

Before GPT-6.1 Sol executes:
1. keep the compile-clean Armory scaffold and frozen docs synchronized,
2. **authorization gate: SATISFIED 2026-09-30**.

During GPT-6.1 Sol construction/post-build:
1. finish or rebuild `WBP_ScraplineArmory` to `ARMORY_UI_SPEC.md`,
2. verify the final Item Granter catalog/index wiring,
3. run the critical lifecycle/economy/JIP/leave/self-death/trade/duplicate-watcher/multiplayer matrix from `ARMORY_ECONOMY_SPEC.md`,
4. preserve native spawn/score/end authority and fall back to the native control if the custom layer proves less reliable.

Do not reopen the spatial design while completing those runtime tasks.

## Final handoff rule

Before GPT-6.1 Sol executes the one-shot:
- read `SPATIAL_CONTRACT.md` first among spatial/design documents,
- read `ARMORY_ECONOMY_SPEC.md` and `ARMORY_UI_SPEC.md` before gameplay/UI wiring,
- keep Layer 1 spatial rules separate from Layer 2 art freedom,
- keep native match authority separate from Armory Verse authority,
- treat final Armory UMG presentation/runtime validation as part of the GPT-6.1 Sol pass rather than a reason to redesign the mechanic,
- require every deviation/fallback to be reported,
- authorization was explicitly granted on 2026-09-30; execute through `docs/SOL61_ONE_SHOT_PROMPT.md`. Use `docs/BUILD_RUN_STATE.md` for interruption recovery.
