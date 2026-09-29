# Scrapline — Project Brief

## Status

**Final pre-build / asset manifest frozen.**

The macro map design, terrain specification, first-alpha gameplay baseline, UEFN/Codex toolchain, and production asset pool are locked or verified. Selective reserve/donor intake is complete and the intake stop rule has fired.

Remaining gates:
- generate and validate the small Verse gameplay package,
- finalize the Codex one-shot prompt with frozen asset paths/device wiring,
- execute the primary build,
- test and repair after the primary pass unless a blocking runtime/editor issue appears earlier.

## Objective

Create a simple, polished Free For All map in UEFN using a deliberately curated set of real Fab/UEFN assets.

Scrapline is intentionally testing an asset-first one-shot workflow: research and lock the environment kit first, then give Codex a sufficiently complete specification to assemble the playable map without falling back to blank boxes or improvised placeholder art.

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

Next:
5. Generate and validate the Verse gameplay package through UEFN Central / Omni-Verse.
6. Assemble the final implementation specification for Codex.
7. Execute the one-shot build.
8. Test after the primary build pass unless a blocking editor/runtime failure requires earlier validation.

## Remaining Pre-Build Decisions

- choose final lighting/time-of-day treatment during environment composition
- refine exact spawn transforms after structures and cover are placed
- generate/validate the Verse package
- finalize and approve the Codex one-shot build prompt

Do **not** reopen broad Fab/library acquisition unless implementation proves a specific frozen category is unusable.
