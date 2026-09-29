# Scrapline — Spatial Contract

## Status

**DESIGN FREEZE AUTHORITY — pre-build.**

This document is the implementation authority for Scrapline's spatial skeleton. It exists to prevent the one-shot build agent from redesigning the arena while trying to implement it.

If another Scrapline document contains older or softer placement language:
- this document controls **layout, major placement, route, orientation, verticality, and spatial tolerances**,
- `ASSET_MANIFEST.md` controls **which assets are approved**,
- `PHYSICAL_FIT_VERIFICATION.md` controls **verified dimensions/collision facts**,
- `GAMEPLAY_SPEC.md` controls **match/gameplay rules**.

Do not reinterpret locked items as suggestions.

## Coordinate convention

- World +X = east.
- World -X = west.
- World +Y = north.
- World -Y = south.
- Arena center = approximately **(0, 0)**.
- Primary playable boundary = approximately **X/Y -7000 to +7000 cm**.
- Scenic/terrain boundary = approximately **X/Y -8500 to +8500 cm**.
- Major assets should remain at **1.0 scale** unless a verified import correction is required. Do not solve fit by casually scaling production assets.

## Locked district anchors

These are composition centers, not visible square rooms. Asset dressing must bleed between them.

| District | Anchor (cm) | Spatial role |
| --- | ---: | --- |
| Scrap / Wreck Yard | **(-3800, +3600)** | dense irregular wreck cover; medium-range with close pockets |
| Loading Yard | **(+3900, +3700)** | clearer loading lanes/crossfires; containers and vehicles |
| Ruined Workshop | **(+3900, -3800)** | shortest-range district; compact Garage plus exterior service court |
| Machinery / Power Yard | **(-3800, -3900)** | irregular machinery/pipes; controlled elevated traversal |
| Central Kill Yard | **(0, 0)** | ~42 m basin; cross-map combat/circulation |

Do not move a district into another quadrant. Do not turn these anchors into four isolated square rooms.

## Locked central gantry

Primary landmark is the Factory shared-pivot assembly:
- `SM_Crane01`
- `SM_CraneCabin01`
- `SM_CraneCable01`

Rules:
- Preserve the three original relative pivots exactly.
- Keep all three at the same world scale.
- Do not independently ground, rotate, or offset cabin/cable pieces.
- Use the structural `SM_Crane01` contact with terrain to ground the assembly. **Do not ground from the cable's lower bound.**
- The cable has no simple collision; do not treat it as cover, a blocker, or playable structure.
- Target assembly pivot/visual center: approximately **(-250, +250) cm**, tolerance about **±300 cm** if terrain contact requires it.
- Long axis runs **NW ↔ SE**, approximately through **(-900, +1400)** and **(+400, -900)**. Use these endpoints as the orientation test instead of guessing a yaw from the mesh's local axes.
- Keep the gantry slightly off geometric center. Do not rotate it into a cardinal east-west or north-south wall unless required by a demonstrated collision failure.
- Do not deliberately create a route onto the full 26.9 m top span.
- If incidental mantling makes a short exposed portion reachable, that is acceptable only if it has multiple counter-angles and no safe full-length firing runway.

The central yard must retain at least four distinct approach/exit corridors. At least two must remain usable without passing through/under the crane.

Target center approach windows:
- NW approach: around **(-1500, +850)**.
- NE approach: around **(+800, +1500)**.
- SE approach: around **(+1500, -700)**.
- SW approach: around **(-850, -1500)**.

Keep roughly **6–9 m** of usable movement width through each approach after major cover is placed.

## Central supporting masses

Use lower secondary anchors to make the gantry feel embedded in a working/scrapped industrial yard:
- `SM_RecyclingMachine01`
- `SM_EngineWithContainer`
- pipe pieces, rubble, metal barricade, and Scrapyard glue.

Do not place both heavy secondary anchors directly opposite each other in a symmetrical composition.
Do not close both ends of the gantry.
At least one end of the gantry must remain a clearly readable bypass.

## Ruined Workshop / Garage

Primary shell is the shared assembly:
- `SM_Garage_1`
- `SM_Garage_1_roof`

Rules:
- Preserve the shell/roof relative pivots.
- Target assembly center: approximately **(+4000, -3900) cm**, tolerance about **±500 cm** for terrain contact.
- Keep the assembly footprint inside the southeast district core rather than drifting toward center.
- Orient the Garage's primary open/service face toward the **northwest / center-side service court**, not toward the outer scenic boundary.
- Preserve an exterior service court of roughly **8–14 m** between the Garage and the center-side cover field.
- Do not expect the 16.5 × 9.4 m shell to fill the district. Expand outward with approved stairs, railings, workbench/shelf/service clutter, warning signs, Scrapyard fencing/grime, and separate cover masses.
- The roof reaches approximately **+8 m**. It is **not a default traversal route**.
- Do not connect a catwalk directly into an easy Garage-roof firing platform.
- If roof access occurs, it must be exposed, challengeable from at least two directions, and have a fast way down.

## Loading Yard anchors

Primary major forms:
- `SM_BoxTruck_01a`
- Factory `SM_Container01_01` / `SM_Container01_02`
- `SM_ForkLift`
- Garage pallet/cart
- restrained Scrapyard container variants for weathered color variation.

Placement rules:
- Box Truck belongs in the **east/northeast half** of the Loading Yard, roughly around **(+4300, +3600)** with about **±700 cm** placement freedom.
- Angle the truck relative to the nearest lane; do not place it perfectly parallel to both world axes.
- Do not use the 2.71 m-wide truck as a plug across a 4.5 m connector.
- Factory containers are the routine gameplay container language.
- Prefer `SM_Container01_01` for repeated gameplay-critical cover because its one-box collision is the most predictable.
- Use `SM_Container01_02` for restrained variation.
- Do not build a continuous container wall across the Loading Yard.
- Single containers are ~3 m high. A deliberate double stack reaches ~6 m and therefore counts as a mid-level combat position.
- Maximum routine stack height: **two containers**. No three-high towers.
- Any double-stack position must be exposed to at least two counter-angles and must not overlook multiple spawn regions.

## Scrap / Wreck Yard anchors

Primary forms:
- `SM_Campervan_01a`
- Abandoned Junk Car
- Scrapyard old-car ruins
- junk piles, tires, barriers, fences, rubble.

Placement rules:
- Campervan belongs roughly around **(-4300, +3600)** with about **±700 cm** placement freedom.
- Angle it off the world grid and use it as one full-cover mass, not as a precise parkour prop.
- Do not form repeated parallel vehicle rows.
- Large junk piles should terminate sightlines or bend routes; do not use them to seal every lateral exit.
- The Wreck Yard may feel denser than other districts, but it still requires at least three readable exits: center, north/east neighbor, and west/south/flank choice.

## Machinery / Power Yard anchors

Primary forms:
- Factory recycling/assembly/electrical pieces,
- `SM_EngineWithContainer`,
- curated IndustrialPipesSource vocabulary,
- Scrapyard reservoir/spotlight/utility pieces.

Placement rules:
- Put the largest machinery mass broadly around **(-4100, -3600)**.
- Put the second heavy mass broadly around **(-3000, -4700)** rather than mirroring the first.
- Use pipes to frame routes and create partial visual screens, not continuous impassable walls.
- This district owns the strongest normal metal-catwalk route, but ground combat remains dominant.

## Required route network

Every district requires:
1. one clear route to the Central Kill Yard,
2. one route to each neighboring district,
3. at least one connection to a broken outer-flank segment.

No district may be a cul-de-sac.

### Neighbor links

Preserve these broad route bands while allowing believable bends around real assets:
- **NW ↔ NE:** northern service link, broadly around **Y +4300 to +5200**.
- **NE ↔ SE:** eastern service link, broadly around **X +4500 to +5400**.
- **SE ↔ SW:** southern service link, broadly around **Y -4500 to -5400**.
- **SW ↔ NW:** western service link, broadly around **X -4500 to -5400**.

These are route bands, not straight hallways. Offset them with structures, fences, terrain, and cover so the arena does not read as a square ring.

### Widths

- Primary lane before cover: **7–10 m**.
- Secondary route: **4.5–7 m**.
- Tight interior/service connector: **3–5 m**, only where believable.
- Outer flank section including cover/terrain transition: **10–14 m**.

Do not allow a vehicle, container, machinery piece, or rubble mass to unintentionally reduce a required secondary route below roughly **3 m clear traversal width**.

## Broken outer flank

The outer route is **not a continuous ring**.

Rules:
- No player should be able to run continuously near the playable boundary around the whole map without being forced inward.
- Each side of the arena must contain at least one inward decision/break.
- Do not create more than about **35 m** of uninterrupted outer-edge travel without an inward bend, obstruction, or combat decision.
- Perimeter shoulders may guide movement but must not become a continuous elevated firing ridge.

## Verticality contract

Ground is the dominant layer.

### Mid band: +4–6 m

Allowed:
- metal catwalks,
- deliberate double-container stacks,
- limited industrial platforms,
- carefully chosen roof/partial-floor access.

### High band: +8–10 m

Rare only.
Any high position must:
- be exposed from multiple directions,
- not see all spawn regions,
- not be the only route through an area,
- have at least two believable challenge/exit relationships.

### Catwalk budget

- Metal Scrapyard catwalks are the primary elevated kit.
- Rise modules naturally climb ~4.9 m and should connect ground to the normal mid band.
- Flat modules are roughly 5.12 m long × 2.56 m wide.
- **Maximum uninterrupted elevated run: about 15 m / three flat modules.**
- Prefer **two major metal-catwalk clusters map-wide**; a third small connector is allowed only if it solves a real route problem.
- Never create a complete elevated ring or a bridge network that bypasses most ground combat.
- Wooden catwalks are rare Wreck Yard flavor only.
- At most **one functional wooden route**, normally no more than **two modules**, and it should not become part of a map-spanning elevated network.

## Sightline contract

- Intentional long sightlines should generally terminate around **50–65 m**.
- No clean corner-to-corner or spawn-to-spawn diagonal across the full arena.
- Every long lane needs a lateral escape opportunity.
- No spawn begins with an unobstructed direct view into the central basin.
- The central gantry may be visible from most districts, but visibility of the landmark does not mean visibility of players beneath/around it.
- Avoid repeated waist-high-cover rows.

## Spawn-region contract

Use **19 candidate spawn regions**. Final transforms may move about **±400 cm** to sit behind real cover and avoid bad collision/LOS, but do not discard the distributed pattern and invent a new spawn layout.

Outer-band candidates:
1. (-6100, +4300)
2. (-6500, +1500)
3. (-6200, -2000)
4. (-5100, -5100)
5. (-2700, -6200)
6. (0, -6500)
7. (+2900, -6100)
8. (+5200, -5000)
9. (+6300, -2000)
10. (+6500, +1400)
11. (+5700, +4300)
12. (+3500, +6000)
13. (+800, +6500)
14. (-2200, +6300)
15. (-4700, +5400)

Protected mid-band candidates:
16. (-2700, +800)
17. (+2700, +900)
18. (+1000, -2800)
19. (-2800, -900)

Spawn rules:
- place hard cover within a few seconds of movement,
- avoid direct center visibility at spawn,
- do not put a spawn on an elevated route,
- do not cluster active spawns into obvious rooms,
- use native UEFN spawn safety/enemy-range behavior,
- only move a candidate outside its tolerance when the local asset/collision layout proves it unsafe; report that deviation.

## Lighting freeze

Use a **readable overcast / hazy late-afternoon industrial daylight** treatment.

Locked intent:
- daytime, not night,
- soft/medium contrast rather than dramatic black shadows,
- slightly warm directional light with cooler ambient fill,
- sun direction broadly from the west/southwest at a moderate elevation,
- restrained haze for depth without obscuring players,
- no heavy orange apocalypse filter,
- no dense fog,
- no lighting treatment that hides traversal edges, doorways, or opponents.

Astra may tune intensity/exposure for readability, but may not reinterpret Scrapline as a nighttime, storm-dark, neon, or extreme cinematic map.

## Implementation freedom

Astra **may** decide:
- exact micro-prop transforms,
- which approved small Scrapyard clutter variants dress a specific corner,
- decal/graffiti placement,
- small rotations/offsets that make cover feel natural,
- restrained VFX placement,
- fine terrain blending around asset feet,
- exact final spawn transform inside each allowed spawn region,
- small cover adjustments needed to preserve the locked route widths and LOS limits.

Astra **may not** decide:
- a different hero landmark,
- a different district layout or quadrant assignment,
- a new major building,
- a continuous outer ring,
- a long safe gantry-top route,
- a map-spanning catwalk network,
- three-high container towers,
- routine Garage-roof control,
- new visible greybox architecture,
- a new asset hunt,
- new mobility mechanics to compensate for a bad layout,
- a different time-of-day concept.

## Emergency fallback hierarchy

Use a fallback only after an actual load/collision/placement failure. Do not substitute assets because another option looks easier.

- Factory hero crane → mounted Deserted Props `SM_Crane01` **only if the Factory assembly is technically unusable**.
- Box Truck → approved Scrapyard/Abandoned vehicle forms.
- Campervan → Scrapyard old-car ruin / Abandoned Junk Car.
- Factory containers → mounted Scrapyard shipping-container variants.
- Metal catwalk module → another verified metal catwalk variant or mounted Deserted industrial platform.
- Garage assembly failure → **stop and report** rather than silently replacing the entire Ruined Workshop with a warehouse-sized structure.

Any fallback use must be reported as a spec deviation.

## Acceptance checks before dressing/polish

Before micro-detailing, verify:
- all five major spaces exist in the correct locations,
- Factory gantry is the central hero and matches the NW-SE orientation test,
- Garage is in the southeast with its service/open face toward the center-side court,
- every district has center + two-neighbor + flank connectivity,
- no required secondary route is accidentally pinched below practical traversal width,
- no uninterrupted catwalk run exceeds the budget,
- no Garage-roof or gantry-top position dominates the map,
- outer flank is broken rather than circular,
- spawn regions remain distributed around the arena,
- long sightlines terminate within the intended range,
- visual asymmetry is obvious despite balanced connectivity.

If any check fails, fix the skeleton **before** proceeding to micro-props, VFX, lighting polish, or gameplay-device wiring.
