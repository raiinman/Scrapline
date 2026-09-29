# Scrapline — Astra Confusion Audit

## Status

**PASS — final pre-Astra contradiction/confusion audit complete 2026-09-29.**

This audit asks a hostile question: *If Astra wanted to misunderstand the design while technically following the docs, where could it do so?*

The original design ambiguity purge remains valid, and the post-gameplay-integration / post-generator sweep also passes. The completed UEFN Central result is quarantined as comparison evidence and does not modify the native gameplay handoff. This document does **not** authorize Astra construction; explicit user authorization is still required.

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
| UEFN Central generated 16 spawn pads + five Verse files + Timer/End Game paths | Astra could mix a rejected architecture into the validated native package | Generator result is quarantined as evidence; final handoff explicitly keeps 19 pads, no production Verse, and Island Settings as sole end authority |

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

## Final gameplay / generator contradiction sweep

After the native gameplay package was integrated and the UEFN Central experiment was completed, the hardened one-shot was checked again against `SPATIAL_CONTRACT.md` and the rejected generator output.

Pass conditions:
- playable envelope still reads **140 m × 140 m**,
- scenic envelope still reads **170 m × 170 m**,
- all four district anchor coordinates match the frozen contract,
- gantry target center remains approximately **(-250, +250)**,
- gantry orientation remains **NW ↔ SE**,
- Garage target remains approximately **(+4000, -3900)**,
- uninterrupted elevated runs remain capped at roughly **15 m**,
- all **19** frozen candidate spawn regions remain authoritative,
- gameplay wiring does not introduce or move spawn coordinates,
- gameplay wiring does not own terrain, map layout, asset placement, lighting, VFX placement, asset discovery, or environment construction,
- the gameplay placeholder is gone,
- the prompt explicitly records **Production custom Verse package: empty**,
- Island Settings is the sole authoritative 30-elimination / 10-minute end-condition path,
- `TR_Eliminations` is HUD feedback only and cannot create a competing end-game path,
- `IG_Loadout` is triggered only by native Player Spawn Pad spawn events,
- the rejected generator's **16-pad** instruction does not appear as active build guidance,
- no Timer Device, End Game Device, Verse `ScoreMap`, manual Tracker increment, or generated `@editable` spawn array appears in the active one-shot gameplay package,
- **Infinite Reserve Ammo = On / Infinite Magazine Ammo = Off** remains explicit, so the generator's looser “Infinite Ammo” wording cannot replace normal reload behavior.

The automated constant/stale-wording sweep passes the frozen spatial/gameplay constants. Rejected generator terms remain only in clearly labeled evidence/audit text where needed to explain what must not be built.

## Remaining blocker

No design, asset-fit, gameplay-wiring, Verse-compiler, or handoff-clarity blocker remains.

The only remaining gate is **explicit user authorization to let Astra execute the one-shot construction pass**.

Do not reopen map design or custom Verse merely because construction has not started yet.

## Final handoff rule

Before Astra is allowed to execute the one-shot:
- read `SPATIAL_CONTRACT.md` first among design documents,
- keep Layer 1 spatial rules separate from Layer 2 art freedom,
- require Astra to fix skeleton acceptance failures before dressing,
- require every deviation/fallback to be reported,
- do not authorize the run if the prompt once again asks Astra to choose a frozen macro-design decision.
