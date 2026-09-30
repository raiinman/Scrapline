# Scrapline — Project Brief

## Status

**Feature Freeze v2 frozen for handoff — Armory mechanic compile-clean; final presentation/runtime acceptance assigned to GPT-6.1 Sol build/post-build.**

The macro map design, spatial contract, terrain specification, implementation toolchain, physical-fit verification, and production asset pool remain frozen. The user reopened only the gameplay layer before construction to add the Scrapline Armory / match economy defined in `ARMORY_ECONOMY_SPEC.md`; that layer is now frozen and GPT-6.1 Sol construction is authorized.

The previously validated native package remains the control for spawn selection, elimination scoring, match end, JIP participation, health/shields, 50-point elimination sustain, movement, destruction, and inventory cleanup. A narrowly scoped custom Verse layer is now authorized only for match-local Scrap, buy/sell UI, adaptive next-life loadouts, catalog configuration, Armory phase gating, JIP first-buy handling, and cleanup.

Current gate state:
- Armory economy/authority contract: frozen,
- live-compiler-clean Verse/UMG scaffold: synchronized,
- contradiction/confusion closeout: complete,
- construction authorization: **granted 2026-09-30**,
- active worker: **GPT-6.1 Sol** using `SOL61_ONE_SHOT_PROMPT.md`.

Still closed unless separately justified:
- broad asset acquisition,
- synthetic image generation as an environment substitute,
- redesign of the frozen spatial contract.

Not a pre-construction blocker:
- final Armory UMG visual polish,
- full 19-spawn/JIP/leave/multiplayer economy acceptance testing. Those are now GPT-6.1 Sol construction/post-build responsibilities.

## Objective

Create a simple, polished Free For All map in UEFN using a deliberately curated set of real Fab/UEFN assets.

Scrapline is intentionally testing an asset-first one-shot workflow: research and lock the environment kit and spatial skeleton first, then give the implementation agent a sufficiently explicit specification to assemble the playable map without redesigning the arena or falling back to blank boxes/improvised placeholder art.

## Core Experience

Scrapline should be:
- compact
- immediately readable
- fast to re-enter after spawning
- dense enough to create frequent fights
- open enough to support multiple routes and weapons
- vertically layered without allowing one dominant camping position
- visually coherent as a post-apocalyptic scrapyard / industrial combat zone

## Player-Space Direction

Primary target: **12-player FFA**.

The arena is physically designed to support up to **16 players** if post-build testing shows sufficient spawn safety and combat space. The locked playable footprint is approximately **140 m x 140 m**, within an approximately **170 m x 170 m** terrain/scenic envelope.

## Non-Negotiable Construction Rule

The final visible environment must be composed from the frozen production asset pool already available to the UEFN project.

Do not use primitive cubes, blank Blender meshes, generic greybox stand-ins, or newly modeled substitute environment pieces when a suitable approved asset exists.

Temporary technical helpers may be used only when required by UEFN gameplay/device logic and should not become visible environment art.

## Frozen Environment Direction

Primary visual authority:
- **Post-Apocalyptic Scrapyard Pack** — https://www.fab.com/listings/c584020d-fcae-453d-b496-fce46d90c97b

Verified live supporting families now include:
- African Slate Quarry terrain/perimeter pieces,
- Factory machinery/crane/forklift/containers/electrical equipment,
- Vehicle Variety Pack Vol. 2 box truck + campervan,
- Garage workshop structure/props,
- complete curated Modular Industrial Pipe mesh vocabulary,
- curated industrial/hazard Warning Signs decals,
- existing rubble, barriers, electrical, junkyard props, VFX, warehouse, and abandoned car content.

The central hero landmark is now the **Factory crane composition**, led by:
`/Scrapline/Imported/FactoryCurated/Meshes/Crane/SM_Crane01`

Supporting crane pieces:
- `SM_CraneCabin01`
- `SM_CraneCable01`

The recycling machine and engine/container remain strong secondary heavy-industry anchors.

## Workflow

Completed:
1. Lock map layout, terrain philosophy, spawn structure, verticality, and alpha gameplay rules.
2. Mount the approved UEFN referenced-content wave.
3. Selectively import useful FBX and Unreal Engine donor content.
4. Re-scan the live asset pool, choose the hero landmark, and freeze the asset manifest.

Completed:
5. Resolve and validate the native first-alpha control package.
6. Complete and audit the original UEFN Central generator experiment; reject its five-file architecture.
7. Freeze the Scrapline Armory / match-economy design in `ARMORY_ECONOMY_SPEC.md`.

Completed for handoff:
8. Build the smallest Armory candidate and validate current APIs/live UEFN compilation.
9. Integrate the Armory wiring plus scalable UMG scaffold into the handoff.

Active before Astra:
10. Complete the contradiction/confusion closeout with final Armory presentation/runtime validation explicitly delegated to Astra.

Then — gated on explicit user authorization:
11. Execute the one-shot build, including final `WBP_ScraplineArmory` implementation/polish.
12. Run the full Armory lifecycle/economy/multiplayer acceptance matrix after the real devices/spawns exist.

## Remaining Pre-Build Decisions

The map skeleton no longer has open design decisions.

Remaining execution preparation:
- keep the first-release catalog/index contract documented,
- update the Astra handoff with the current compile-clean Armory scaffold and explicit UMG presentation task,
- close the final contradiction/confusion audit,
- obtain explicit user authorization before the Astra one-shot begins.

During Astra construction/post-build:
- finish or rebuild `WBP_ScraplineArmory` to `ARMORY_UI_SPEC.md`,
- resolve final spawn transforms **inside the frozen spawn regions** after real cover/collision exists,
- run the full Armory lifecycle/economy/multiplayer acceptance matrix.

Lighting/time-of-day concept, hero landmark, district placement, route network, verticality budget, major traversal rules, and major asset roles remain frozen in `SPATIAL_CONTRACT.md`.

Do **not** reopen broad Fab/library acquisition unless implementation proves a specific frozen category is unusable.
