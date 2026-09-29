# Scrapline — Astra Confusion Audit

## Status

**REOPENED — spatial/design audit still passes; Feature Freeze v2 gameplay audit pending.**

This audit asks a hostile question: *If Astra wanted to misunderstand the design while technically following the docs, where could it do so?*

The original spatial/design ambiguity purge remains valid. Feature Freeze v2 intentionally changed the gameplay architecture by adding the Scrapline Armory / match economy, so the previous native-only gameplay closeout is no longer final. The new Armory design is frozen in `ARMORY_ECONOMY_SPEC.md`, but the audit cannot return to PASS until accepted Armory code/wiring is live-validated and synchronized into the one-shot handoff.

This document does **not** authorize Astra construction.

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

The final Astra prompt must read it before the softer composition/design documents.

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

## Spatial decisions Astra no longer owns

Astra is **not** asked to invent:
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

## Feature Freeze v2 gameplay contradiction sweep

The spatial/design checks above remain valid. The gameplay closeout is now deliberately **pending** until the Armory implementation is real rather than merely designed.

The next PASS must verify all of the following:
- playable/scenic envelopes and all frozen anchors remain unchanged,
- all **19** spawn regions remain authoritative,
- Armory Verse never chooses spawn coordinates or moves spawn pads,
- Island Settings remains the sole 30-elimination / timeout winner authority,
- native combat target is approximately 10 minutes after the frozen 45-second opening Armory gate,
- `TR_Eliminations` remains HUD feedback only,
- no manual Tracker increment is used for normal eliminations,
- no production End Game device or match-authority Timer is introduced,
- `IG_Armory` replaces the fixed `IG_Loadout` path only after live validation,
- `EM_Economy` is used only as an eliminator/eliminated event source and drops no economy items,
- Armory Verse owns only Scrap, catalog/cart/loadout state, UI, buy gates, granting, and cleanup,
- Armory Verse does not own elimination score, victory, native timeout, spawn selection, sustain, terrain, layout, lighting, VFX, or asset placement,
- starting Scrap = **3,000**, cap = **5,000**, elimination reward = **150**, recovery ladder = **1,500 / 1,750 / 2,000**,
- purchases charge once per life and rewards fire once per event,
- free fallback prevents a player from becoming unable to spawn,
- JIP / leave / repeated death / UI open-close do not duplicate subscriptions, grants, or currency events,
- Infinite Reserve Ammo = On / Infinite Magazine Ammo = Off remains explicit,
- the rejected UEFN Central five-file package appears only as labeled evidence,
- accepted Armory code compiles with live UEFN at zero diagnostics,
- exact first-release catalog Item Granter indexes are documented,
- `ONE_SHOT_PROMPT_DRAFT.md` no longer contains stale native-only fixed-loadout instructions.

## Current blockers

Gameplay handoff clarity is intentionally not closed yet.

Before Astra may execute:
1. implement the smallest Armory candidate,
2. validate it with live Epic UEFN,
3. run the critical lifecycle/economy matrix from `ARMORY_ECONOMY_SPEC.md`,
4. lock the initial catalog/index wiring,
5. harden the one-shot prompt against the verified implementation,
6. rerun this audit and return it to **PASS**,
7. obtain explicit user authorization.

Do not reopen the spatial design while closing this gameplay gate.

## Final handoff rule

Before Astra is allowed to execute the one-shot:
- read `SPATIAL_CONTRACT.md` first among spatial/design documents,
- read `ARMORY_ECONOMY_SPEC.md` before gameplay wiring,
- keep Layer 1 spatial rules separate from Layer 2 art freedom,
- keep native match authority separate from Armory Verse authority,
- require every deviation/fallback to be reported,
- do not authorize the run while this document remains REOPENED/PENDING.
