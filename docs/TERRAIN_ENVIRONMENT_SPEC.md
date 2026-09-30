# Scrapline — Terrain & Environment Build Specification

## Purpose

This document translates the locked macro design into an implementation-facing environment plan for the one-shot build.

The goal is a believable, compact industrial scrapyard arena built directly from available production assets, with terrain shaped specifically to support FFA combat.

## Coordinate System

- Arena center: approximately **X=0, Y=0**.
- Primary playable boundary: approximately **-7,000 to +7,000 cm** on X and Y.
- Scenic / landscape boundary: approximately **-8,500 to +8,500 cm**.
- Treat district coordinates here as planning anchors. Major-asset transforms must stay within the placement/orientation tolerances in `SPATIAL_CONTRACT.md`; only small terrain-fit and micro-cover adjustments may move freely within those contracts.

## Heightmap / Landscape Baseline

**Generated and staged for review.**

Current files:
- `Resources/Terrain/Scrapline_Terrain_v1_253x253_16bit.png` — importable 16-bit grayscale heightmap.
- `Resources/Terrain/Scrapline_Terrain_v1_preview.png` — quick visual preview.
- `Resources/Terrain/Scrapline_Terrain_v1.json` — generation/import metadata.

Generation constants:
- Resolution: **253 x 253**.
- Target physical span: approximately **170 m x 170 m**.
- Starting X/Y Landscape scale: approximately **67.46 cm per quad** (252 quads across ~170 m).
- Starting Z scale: approximately **4.0**, providing roughly 20.48 m total vertical range.
- Generated elevation range: approximately **-2.45 m to +4.79 m**.
- The heightmap includes the shallow central basin, broad district pads, irregular perimeter shoulders, service-road gaps, shallow drainage cuts, and low sightline-breaking berms.
- Preserve adequate vertical headroom above and below the working yard elevation.

Epic documents 253 x 253 as a recommended Landscape size and supports 16-bit grayscale PNG heightmaps.
Technical references:
- https://dev.epicgames.com/documentation/unreal-engine/landscape-technical-guide-in-unreal-engine
- https://dev.epicgames.com/documentation/fortnite/landscape-mode-in-unreal-editor-for-fortnite

If UEFN import behavior requires a slightly different numerical scale, preserve the locked **170 m terrain envelope** and combat elevation relationships rather than blindly preserving these starting values.

## Terrain Profile

### Central Basin

- Center approximately at (0, 0).
- Broad depression approximately 35–50 m across.
- Target depth: approximately **-1.5 to -2.5 m** relative to the surrounding primary yard.
- Slopes must be traversable and should feel graded by industrial earthwork, not naturally eroded.

### District Pads

Create broad, subtly uneven but buildable areas under the four districts.

Do not make them perfectly flat rectangles. Flatten only enough for buildings, containers, machinery, and roads to sit believably.

### Perimeter Shoulders

Raise the outer terrain approximately **+3 to +5 m** in irregular sections.

Use the rise to:
- hide the hard edge of the combat space,
- terminate sightlines,
- provide background mass,
- create believable scrapyard berms and service roads.

Do not create continuous high-ground firing positions around the perimeter.

### Drainage / Service Cuts

Add several shallow industrial drainage or runoff cuts:

- typical depth: **0.5–1.2 m**,
- broad enough to traverse cleanly,
- broken rather than continuous,
- useful as temporary low cover and route separators.

At least one drainage/service cut should connect visually toward the central basin without becoming a trench that dominates combat.

## District Anchors

Use these as composition centers, not boxes:

- Scrap / Wreck Yard: **(-3,800, +3,600)**.
- Loading Yard: **(+3,900, +3,700)**.
- Ruined Workshop: **(+3,900, -3,800)**.
- Machinery / Power Yard: **(-3,800, -3,900)**.
- Central Kill Yard: **(0, 0)**.

Allow district assets to bleed across these boundaries so the map reads as one facility.

## Route Width Targets

- Main lanes before cover: approximately **7–10 m**.
- Secondary routes: approximately **4.5–7 m**.
- Interior / service connectors: approximately **3–5 m** where believable.
- Elevated catwalks: use real asset widths; avoid artificially scaling thin walkways into implausible platforms.
- Outer flank sections: approximately **10–14 m** including cover and terrain transitions.

## Sightline Rules

- Intentional long sightlines should generally terminate around **50–65 m**.
- No spawn should intentionally look straight through the center from the moment a player appears.
- Use wrecks, partial walls, containers, machinery, fences, terrain shoulders, and building corners to break views.
- Avoid repeated waist-high-cover rows that make the map look procedurally tiled.
- Every long lane needs at least one lateral escape opportunity.

## Verticality Rules

Ground is the dominant layer.

Mid-level positions at roughly **+4–6 m** may use:
- workshop roofs,
- catwalks,
- container stacks,
- partial second floors,
- industrial platforms.

Only a few high positions may reach **+8–10 m**.

Every high position must be exposed to multiple counter-angles and must not overlook all spawn regions.

## Central Landmark

The central landmark is **already selected**: the Factory shared-pivot gantry assembly led by `SM_Crane01`, with `SM_CraneCabin01` and `SM_CraneCable01`.

Place and orient it exactly within the tolerances in `SPATIAL_CONTRACT.md`. Preserve shared pivots and ground from the structural crane rather than the lower cable bound.

Build lower supporting wreckage/machinery/cover around it without closing both ends. The landmark should be recognizable from most districts but must not become a safe full-length elevated firing perch.

## Candidate Spawn Bands

Plan **18–20** spawn locations. Initial candidate zones may be distributed around these approximate anchors, then shifted to real cover:

- (-6,100, +4,300), (-6,500, +1,500), (-6,200, -2,000), (-5,100, -5,100)
- (-2,700, -6,200), (0, -6,500), (+2,900, -6,100), (+5,200, -5,000)
- (+6,300, -2,000), (+6,500, +1,400), (+5,700, +4,300), (+3,500, +6,000)
- (+800, +6,500), (-2,200, +6,300), (-4,700, +5,400)
- plus 3–5 protected mid-band positions chosen after structures are placed.

These are not final transforms. Do not place a spawn merely because a coordinate exists; validate line-of-sight, cover, collision, and route access first.

## Asset-First Placement Rules

Before placing environment art:

1. Inventory the assets actually present in the Scrapline project using Unreal MCP and Power Tools.
2. Group usable assets by architecture, vehicles/wrecks, barriers, machinery, debris, utilities, signage, VFX, and landmarks.
3. Use the frozen district/major-anchor assignments from `SPATIAL_CONTRACT.md` and `ENVIRONMENT_COMPOSITION_BOARD.md`; choose only approved secondary/micro variants inside those assignments.
4. Prefer real asset dimensions over arbitrary scaling.
5. Do not create visible substitute boxes when a suitable asset is available.
6. Keep unrelated visual styles out even if they are technically available.

## One-Shot Environment Sequence

1. Inspect project assets and identify the strongest asset families.
2. Generate the 253 x 253 terrain heightmap and import/create the Landscape.
3. Establish the central basin, perimeter shoulders, district pads, drainage cuts, and service-road contours.
4. Place the frozen Factory gantry assembly using the anchor/orientation test in `SPATIAL_CONTRACT.md`.
5. Establish each district with its largest structures first.
6. Create center routes, cross-district links, and the broken outer flank route.
7. Establish vertical routes and counter-angles.
8. Add hard cover and sightline blockers.
9. Place provisional spawn devices and validate their visibility relationships.
10. Add secondary props, debris, utilities, signage, and restrained VFX.
11. Establish the frozen readable overcast/hazy late-afternoon daylight treatment from `SPATIAL_CONTRACT.md`; tune exposure/intensity for gameplay readability rather than selecting a different time-of-day concept.
12. Run collision, asset, dependency, material/texture, and performance-oriented audits.
13. Only after the environment is coherent, wire the final gameplay devices and Verse behavior.

## Composition Standard

Scrapline should look like an abandoned industrial scrapyard that has accumulated decades of improvised additions, damage, salvage, and neglect.

Avoid:
- pristine modular repetition,
- perfectly parallel cover rows,
- visible four-quadrant symmetry,
- excessive tiny clutter in combat paths,
- decorative objects that create unpredictable collision,
- asset-pack showcase composition that ignores gameplay.

The environment should be dirty and irregular while the underlying combat flow remains deliberate.