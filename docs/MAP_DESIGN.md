# Scrapline — Map Design

## Status

**Macro layout locked for the first one-shot build.**

The playable envelope, player-density target, combat districts, route network, terrain profile, verticality, spawn regions, and major anchor placements are approved. `SPATIAL_CONTRACT.md` is the implementation authority for exact major-placement/orientation rules and allowed tolerances. Only micro-prop dressing and small fit adjustments remain implementation choices.

## Locked Design Constants

- Primary mode: Free For All.
- Primary population: **12 players**.
- Supported ceiling: **16 players** if testing shows the arena can sustain it.
- Playable combat footprint: approximately **140 m x 140 m** (14,000 x 14,000 Unreal units/cm).
- Scenic / terrain footprint: approximately **170 m x 170 m**.
- Central combat yard: approximately **42 m across**.
- Outer broken flank route: approximately **10–14 m wide**.
- Longest intentional combat sightlines: approximately **50–65 m**.
- Spawn candidates: **19 frozen candidate regions** distributed around the arena.
- Normal terrain center depression: approximately **1.5–2.5 m below the surrounding yard**.
- Perimeter terrain rise: approximately **3–5 m above the main yard**.
- Secondary playable elevation: approximately **+4–6 m**.
- Rare maximum useful perch: approximately **+8–10 m**.

## Coordinate Convention

Treat the center of the arena as approximately **X=0, Y=0**.
The 140 m playable envelope runs approximately from **-7,000 to +7,000 cm** on X and Y. The wider terrain/scenic envelope runs approximately from **-8,500 to +8,500 cm**.

District centers are working anchors, not hard rectangular borders:

- Northwest, around **(-3,800, +3,600)**: Scrap / Wreck Yard.
- Northeast, around **(+3,900, +3,700)**: Loading Yard.
- Southeast, around **(+3,900, -3,800)**: Ruined Workshop.
- Southwest, around **(-3,800, -3,900)**: Machinery / Power Yard.
- Center, around **(0, 0)**: Central Kill Yard / landmark.

## Overall Shape

Scrapline must not read as a clean four-quadrant arena.

The four districts should overlap visually and physically. Structures, fences, wrecks, terrain shoulders, pipe runs, debris, and partial walls should make the arena feel like a believable industrial scrapyard that happened to produce good combat lanes.

Avoid visible symmetry. Preserve underlying balance without making the layout look mirrored.

## Central Kill Yard

The center is the most recognizable combat space and should pull players into fights without becoming mandatory.

- Approximately 42 m across.
- Slightly depressed relative to the surrounding districts.
- Contains the frozen Factory crane shared-pivot assembly (`SM_Crane01` + cabin + cable) as the large industrial landmark.
- The gantry orientation and placement are frozen by `SPATIAL_CONTRACT.md`; do not select a different hero during implementation.
- Must have multiple entrances and exits.
- Must contain meaningful hard cover.
- Must not provide uncontested high ground over the entire map.
Players entering center should gain faster cross-map access and more combat opportunities, not an automatic positional advantage.

## Combat Districts

### Scrap / Wreck Yard

Use wrecked vehicles, tires, scrap piles, metal barriers, stacked junk, fencing, and irregular hard cover.

Combat character: medium-range fights broken by dense cover, with short close-range pockets.

### Loading Yard

Use containers, gates, warehouse/loading structures, pallets, barriers, ramps, and service infrastructure.

Combat character: clearer lanes, crossfires, and predictable cover shapes with multiple lateral exits.

### Ruined Workshop

Use garage/workshop architecture, damaged walls, tools, shelving, roof access, stairs, and partial interiors.

Combat character: shortest engagement distances on the map, with limited roof and interior routes.

### Machinery / Power Yard

Use pipes, generators, tanks, electrical equipment, heavy machinery, cranes/gantries, and industrial frames.

Combat character: irregular silhouettes, medium-range lanes, and controlled verticality.

## Route Structure

Every district must connect to:
- the central kill yard,
- both neighboring districts,
- at least one portion of the outer flank route.

The outer route is deliberately broken rather than a perfect ring. Buildings, terrain, fences, and wreckage should periodically force players inward or through a decision point.
Primary combat lanes should generally feel **7–10 m wide** before cover is added. Secondary routes should generally feel **4.5–7 m wide**. Tight interior connectors may narrow further where the assets support believable movement.

Do not create long empty corridors.

## Verticality

Use three practical height bands:

1. **Ground:** primary combat and most traversal.
2. **Mid:** roofs, catwalks, container tops, partial second floors, roughly +4–6 m.
3. **High:** only a few exposed positions, roughly +8–10 m maximum.

Every meaningful elevated position needs at least two attack angles and at least two believable ways to leave or challenge it.

No tower, roof, crane, or terrain ridge may dominate the whole arena.

## Terrain Philosophy

Terrain supports combat and environmental believability; it is not scenic mountain terrain.

Use:
- a shallow industrial basin,
- irregular raised perimeter shoulders,
- drainage cuts / ditches,
- dirt service roads,
- broken embankments,
- flattened pads where large structures sit,
- small elevation transitions that block or reveal sightlines.

Avoid:
- dramatic mountains,
- deep canyons,
- decorative terrain noise that harms movement,
- perfectly flat airport-style ground across the entire arena.

## Spawning

Use the **19 frozen spawn candidate regions** around the outer and middle bands; do not add or remove regions during the one-shot without a demonstrated spawn failure.

Spawns should:
- place hard cover within a few seconds,
- avoid direct views into the central yard where possible,
- avoid obvious spawn rooms,
- distribute players across all four districts,
- use native UEFN spawn safety / enemy-range behavior where practical.
Desired rhythm:

**spawn → immediate cover → choose center, neighboring district, or flank → fight**

The environment should do most of the spawn protection work. Do not depend on complicated Verse spawn-selection logic unless testing proves native devices insufficient.

## Art / Composition Rule

Build the finished visible environment from the approved/available Fab and Fortnite asset pool.

Do not use blank boxes, primitive-block architecture, or newly authored Blender environment meshes as final visible stand-ins when a suitable production asset exists.

Primitive/modeling tools are allowed for invisible technical helpers, collision repair, terrain integration, and minor fixes only.

## Performance Rule

The library is a selection pool, not a command to place every asset.

Prefer coherent asset families, reuse where visually natural, use HLOD/streaming appropriately, and avoid dense micro-prop spam that adds cost without improving combat readability.

## Implementation Tuning — Limited

The build agent may tune only within the boundaries in `SPATIAL_CONTRACT.md`:

- micro-prop and small-cover transforms that preserve required route widths,
- exact spawn transforms inside the locked candidate regions after LOS/collision checks,
- approved clutter/decal/VFX choices within each district,
- fine terrain blending around real asset footprints,
- lighting intensity/exposure within the frozen overcast late-afternoon treatment.

The hero landmark, district assignments, major anchor roles, route connectivity, catwalk budget, Garage roof treatment, container-stack ceiling, and time-of-day concept are **not implementation choices**.