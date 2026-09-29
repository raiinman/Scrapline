# Scrapline — Project Brief

## Status

**Pre-build integration complete; ready for explicit Astra one-shot authorization.**

The macro map design, spatial contract, terrain specification, first-alpha gameplay baseline, implementation toolchain, physical-fit verification, production asset pool, and gameplay/device integration are locked or verified. Selective reserve/donor intake is complete and the intake stop rule has fired.

The first-alpha gameplay layer is validated as native-device only: Island Settings + 19 Player Spawn Pads + one Item Granter + one Tracker. No production custom Verse or `@editable` wiring is required.

Current gate:
- obtain explicit user authorization before Astra executes the primary construction pass.

The final contradiction/confusion closeout has passed.

Still gated until explicit one-shot authorization:
- execute the primary build,
- test and repair after the primary pass unless a blocking runtime/editor issue appears earlier.

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
5. Resolve and validate the first-alpha gameplay package. Current Epic native settings/devices cover the baseline; no production custom Verse is required.
6. Assemble the Astra implementation specification from the frozen spatial contract, asset manifest, physical-fit record, and exact native gameplay wiring.

Next — gated on explicit user authorization:
7. Execute the one-shot build.
8. Test after the primary build pass unless a blocking editor/runtime failure requires earlier validation.

## Remaining Pre-Build Decisions

The map skeleton no longer has open design decisions.

Remaining execution preparation:
- resolve final spawn transforms **inside the frozen spawn regions** after real cover/collision exists,
- obtain explicit user authorization before the Astra one-shot begins.

Exact gameplay/device wiring is finalized in `VERSE_GAMEPLAY_INTEGRATION.md` and integrated into `ONE_SHOT_PROMPT_DRAFT.md`.

Lighting/time-of-day concept, hero landmark, district placement, route network, verticality budget, major traversal rules, and major asset roles are frozen in `SPATIAL_CONTRACT.md`.

Do **not** reopen broad Fab/library acquisition unless implementation proves a specific frozen category is unusable.
