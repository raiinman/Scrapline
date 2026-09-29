# Scrapline — Asset Gap Matrix

## Purpose

Track the production-asset families required by the locked map design and enforce the intake stop rule.

## Status

**CLOSED — freeze threshold satisfied.**

The final live UEFN curation pass eliminated the remaining weak categories. Broad Fab/library acquisition is no longer part of the one-shot path.

## Final Coverage

| Asset family | Status | Frozen sources | One-shot disposition |
|---|---|---|---|
| Scrapyard architecture | Strong | Post-Apocalyptic Scrapyard Pack | Frozen |
| Fencing / hard barriers | Strong | Scrapyard modular fences, Metal Barricade, rubble | Frozen |
| Concrete / rubble / destruction | Strong | Concrete rubble variants, Cement Rubble, Broken Slab, Industrial Rubble, Rubble Pack | Frozen |
| Terrain rocks / perimeter dressing | Strong | 18 curated African Slate Quarry meshes + generated heightmap | Frozen |
| Utility / electrical detail | Strong | Rusty Electrical Box + Factory electrical panel/switchboard + Scrapyard fuse/power assets | Frozen |
| Ambient VFX | Strong | Talisman VFX primary, Deserted VFX secondary | Frozen |
| Vehicles / wreck forms | Strong | Abandoned Junk Car, Box Truck, Campervan, Scrapyard ruined cars | Frozen |
| Loading / warehouse vocabulary | Strong | Factory containers/forklift, Garage pallet/cart, Scrapyard containers, Deserted Props | Frozen |
| Workshop interiors | Strong | Garage structure/workbench/shelves/cart/stairs/railings + Scrapyard repair clutter | Frozen |
| Heavy machinery / power infrastructure | Strong | Factory gantry/crane assembly, recycling machine, engine/container, forklift, assembly line, electrical equipment | Frozen |
| Modular industrial pipes | Strong | 28 verified IndustrialPipesSource StaticMeshes + mounted Scrapyard/Deserted fallbacks | Frozen |
| Signage / decals | Strong | 12 selected Warning Signs instances + Scrapyard signage/graffiti | Frozen |
| Hero landmark | **Frozen** | Factory horizontal gantry/crane composition | `SM_Crane01` primary |
| Ruined structural shells | Strong | Scrapyard structures + Garage | No additional donor required |
| Elevated traversal | Strong / controlled | Scrapyard metal catwalk family primary; wooden catwalks rare | Budgeted, not filler |

Warehouse Essentials is physically present but quarantined because its mesh requests five missing material packages. It is not counted toward coverage.

## Frozen Hero Landmark

Primary:
`/Scrapline/Imported/FactoryCurated/Meshes/Crane/SM_Crane01`

Supporting pieces:
- `SM_CraneCabin01`
- `SM_CraneCable01`

Real staged captures confirm that this is a long horizontal industrial gantry/bridge assembly rather than a tall skyline construction crane. Preserve the shared pivots of the three crane pieces.

Secondary industrial anchors:
- `SM_RecyclingMachine01`
- `SM_EngineWithContainer`

The gantry composition belongs slightly off geometric center in the central kill yard and must not become an uncontested full-map elevated lane.

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
- Warehouse Essentials load failures are isolated to that quarantined asset and do not reopen a production family

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

Physical-fit/selection verification is complete and recorded in `PHYSICAL_FIT_VERIFICATION.md`. The pre-build hold was later lifted for gameplay integration and the UEFN Central comparison; both are now complete. **Asset intake remains closed.** Synthetic image generation, bulk reserve import, and Astra/irreversible environment construction remain separately gated unless the user explicitly authorizes them.
