# Scrapline — Environment Composition Board

## Purpose

Translate the frozen asset manifest into district-level placement guidance without generating new art or importing reserve packs. `ASSET_MANIFEST.md` remains the approval/source authority.

## Global visual rule

The mounted Post-Apocalyptic Scrapyard pack is the visual glue. Factory, Garage, Deserted Props, and the curated pipe kit are role-specific additions, not separate theme zones.

Repeat Scrapyard fencing, corrugated metal, junk, hanging wires, graffiti, signage, tires, barrels, pallets, and utility clutter across district boundaries so the arena reads as one facility that accumulated additions over time.

## Center — Kill Yard

Primary landmark:
`/Scrapline/Imported/FactoryCurated/Meshes/Crane/SM_Crane01`

Support:
- matching crane cabin/cable pieces
- `SM_RecyclingMachine01`
- `SM_EngineWithContainer`
- IndustrialPipesSource pieces
- concrete rubble and Metal Barricade reference

Real staged captures show that the Factory crane is a long horizontal industrial gantry/bridge assembly, not a tall skyline construction crane. Preserve the shared pivots of `SM_Crane01`, `SM_CraneCabin01`, and `SM_CraneCable01`; do not independently ground those pieces. Place the assembly slightly off geometric center and use its long horizontal silhouette to frame movement through the basin. Keep playable access controlled so the gantry does not become an uncontested elevated lane.

## Northwest — Scrap / Wreck Yard

Primary live vocabulary:
- Abandoned Junk Car
- `SM_Campervan_01a`
- `SCBK_old_car_ruin_L0` / `SCBK_old_car_ruin_blue_L0`
- `SCBK_huge_junk_pile_L0`
- `SCBK_junk_pile_02_L0`
- modular Scrapyard fences and wire gates
- tires, barrels, garbage bins, graffiti, hanging wire, rubble

Reserve-only fallbacks: Vehicle V2 Sedan/SUV source meshes, Garage ATV/bicycle, Construction dumpster/roadblocks.

## Northeast — Loading Yard

Primary live vocabulary:
- `SM_BoxTruck_01a`
- Factory `SM_Container01_01` / `SM_Container01_02`
- `SM_ForkLift`
- Garage pallet/cart
- Scrapyard blue/green/red/yellow shipping-container variants
- `SCBK_wooden_cable_spool_01_L0`
- `SCBK_wooden_pallet_01_L0`
- Deserted Props semi-truck, cargo-cart, scissors-lift, pallet/tarp/box pieces as mounted fallbacks

Use Factory containers as the primary container language. Use Scrapyard color variants for restrained weathered variation. Do not use Warehouse Essentials; it is quarantined.

## Southeast — Ruined Workshop

Primary live shell:
- `/Scrapline/Imported/GarageSource/Meshes/SM_Garage_1`
- `SM_Garage_1_roof`

Interior / traversal:
- workbench, shelves, cart, pallet, stairs, railings, illuminator, ventilation, wheel
- Scrapyard fuse boxes, hanging wires, barrels, garbage bins, window/door parts
- selected warning decals and restrained graffiti

Real staged captures confirm that `SM_Garage_1` and `SM_Garage_1_roof` are a shared assembly. Preserve their original relative pivots before grounding/placing them. The shell is compact, so build district identity outward with service clutter, stairs, railings, signage, exterior cover, and Scrapyard grime rather than expecting the shell alone to fill the southeast district. Keep clutter off combat paths and preserve sprint-speed readability.

## Southwest — Machinery / Power Yard

Primary:
- Factory recycling/assembly/electrical pieces
- complete curated IndustrialPipesSource vocabulary

Blend:
- `SCBK_large_reservoir_01_L0`
- `SCBK_large_spotlight_01_L0`
- Scrapyard duct/pipe/powerline pieces
- Talisman steam/sparks
- utility/electrical referenced props

## Perimeter / Terrain

Use the staged heightmap plus African Slate Quarry for irregular shoulders, cuts, sightline termination, and service-road transitions. Scrapyard silos, water tower, powerlines, and sparse Deserted arid/dead foliage may provide skyline/micro-dressing only where they do not become unintended combat perches.

## Verticality budget

Ground is dominant. Use the metal catwalk family as the primary elevated traversal kit. Wooden catwalks are rare wreck-yard accents only.

Do not scatter catwalks because the pack contains many modules. Every elevated route must earn its place, stay within the locked +4–6 m normal elevation range, and expose any rare +8–10 m position to multiple counter-angles.

## Atmosphere

Preferred:
- Talisman `NS_Dustmotes_01`
- falling/burst sparks
- restrained lingering/rising/spray steam

Live Niagara inventory confirms Talisman `NS_Dustmotes_01`, five spark systems, and seven steam systems. Deserted VFX provides `N_LandscapeStorm`, `NS_AA_Fire`, `NS_AA_Fire_constant`, `NS_AnitiAircraftExplosions`, and `NS_JetFlyByDust`. Use Deserted fire/dust/storm spectacle only when a specific composition needs it. Scrapline should feel abandoned and dangerous, not actively exploding everywhere.

## Referenced-content handling

Live UEFN captures confirm that Scrapyard and Deserted Props referenced assets are usable production content even when their source editors are read-only. Do not duplicate a referenced pack merely to make it editable. Promote only a specific asset that implementation proves must be modified.

See `REAL_ASSET_VISUAL_STUDIES.md` for the grounded visual evidence and representative captured assets.

## Remaining fit gate

Before final placement guidance, verify local bounds and collision for the Factory crane, Garage shell, Box Truck, Campervan, primary containers, and representative metal/wooden catwalk modules. Do not infer exact dimensions from screenshots or naming.
