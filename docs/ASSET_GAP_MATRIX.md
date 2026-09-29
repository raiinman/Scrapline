# Scrapline — Asset Gap Matrix

## Purpose

Track the production-asset families required by the locked map design and enforce the intake stop rule.

## Status

**CLOSED — freeze threshold satisfied.**

The final live UEFN curation pass eliminated the remaining weak categories. Broad Fab/library acquisition is no longer part of the one-shot path.

## Final Coverage

| Asset family | Status | Frozen sources | One-shot disposition |
|---|---|---|---|
| Scrapyard architecture | Strong | Post-Apocalyptic Scrapyard Pack, Warehouse Essentials | Frozen |
| Fencing / hard barriers | Strong | Scrapyard modular fences, Metal Barricade, rubble | Frozen |
| Concrete / rubble / destruction | Strong | Concrete rubble variants, Cement Rubble, Broken Slab, Industrial Rubble, Rubble Pack | Frozen |
| Terrain rocks / perimeter dressing | Strong | 18 curated African Slate Quarry meshes + generated heightmap | Frozen |
| Utility / electrical detail | Strong | Electrical Box + Factory electrical panel/switchboard + pumps/tanks/canisters | Frozen |
| Ambient VFX | Strong | Deserted VFX, Talisman VFX | Frozen |
| Vehicles / wreck forms | Strong | Abandoned Junk Car, Box Truck, Campervan, scrapyard content | Frozen |
| Loading / warehouse vocabulary | Strong | Warehouse Essentials, Factory containers, Garage pallet/cart, Deserted Props | Frozen |
| Workshop interiors | Strong | Garage structure/workbench/shelves/cart/stairs/railings + existing warehouse/scrapyard props | Frozen |
| Heavy machinery / power infrastructure | Strong | Factory crane, recycling machine, engine/container, forklift, assembly line, electrical equipment | Frozen |
| Modular industrial pipes | Strong | 28 verified Modular Industrial Pipe Set StaticMeshes | Frozen |
| Signage / decals | Strong | 12 selected Warning Signs decal instances + existing scrapyard signage | Frozen |
| Hero landmark | **Frozen** | Factory crane composition | `SM_Crane01` primary |
| Ruined structural shells | Adequate/Strong | Scrapyard structures + Garage + Warehouse Essentials | No additional donor required |

## Frozen Hero Landmark

Primary:
`/Scrapline/Imported/FactoryCurated/Meshes/Crane/SM_Crane01`

Supporting pieces:
- `SM_CraneCabin01`
- `SM_CraneCable01`

Secondary industrial anchors:
- `SM_RecyclingMachine01`
- `SM_EngineWithContainer`

The crane composition belongs in the central kill yard but must not become an uncontested full-map high-ground position.

## Intake Stop Rule — Triggered

The freeze threshold required:

- no required category at Weak — **met**
- a project-visible hero landmark — **met**
- at least two vehicle/wreck silhouettes — **met**
- distinct large-scale Machinery/Power vocabulary — **met**
- all selected donor/imported content verified inside UEFN — **met**

Latest verification:
- Scrapline Map Check: **0 errors / 0 warnings**
- Power Tools Project Health: **0 errors**
- 3 warnings remain for pre-existing oversized propane-tank textures only

## Reserve Disposition

Do **not** pull these into the live project before the one-shot unless implementation demonstrates a specific failure in the frozen pool:

- Junkyard
- Construction Site Vol. 1 / 2
- City Street Props
- Wasteland Props
- MW Landscape Auto Material
- Dark Ruins
- Derelict Corridor
- Unfinished Building
- Old Mine
- Post Apocalypse Survivor Kitbash
- City Sample Buildings / Vehicles
- additional warehouse/street/vehicle packs

Availability is no longer a reason to import content.

## Reopen Rule

Asset intake may reopen only when:
1. a frozen asset fails UEFN validation or cannot perform its documented role,
2. the primary build exposes a concrete missing family that cannot be solved from the frozen manifest or suitable built-in Fortnite content,
3. the replacement is narrowly scoped to that failure.

Otherwise, proceed to Verse and the one-shot.
