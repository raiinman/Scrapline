# Scrapline — Asset Gap Matrix

## Purpose

Track only the asset families that matter to the locked map design so reserve-pack intake stops when the one-shot is adequately covered.

## Current Coverage

| Asset family | Status | Current sources | What is still useful |
|---|---|---|---|
| Scrapyard architecture | Strong | Post-Apocalyptic Scrapyard Pack, Warehouse Essentials | No urgent gap |
| Fencing / hard barriers | Strong | Scrapyard modular fences, Metal Barricade, rubble | No urgent gap |
| Concrete / rubble / destruction | Strong | Concrete rubble variants, Cement Rubble, Broken Slab, Industrial Rubble, Rubble Pack | Dark Ruins may add a few premium structural pieces |
| Terrain rocks / perimeter dressing | Strong | 18 curated African Slate Quarry production meshes + generated heightmap | No further rock-pack intake needed before the one-shot |
| Utility / electrical detail | Medium-strong | Electrical Box, lamps, water pump, tanks, canisters | Add only if a donor offers visibly better large infrastructure |
| Ambient VFX | Strong | Deserted VFX, Talisman VFX | No urgent gap |
| Vehicles / wreck forms | Medium | Abandoned Junk Car + scrapyard content | One bulk vehicle pack would improve variety |
| Loading / warehouse vocabulary | Medium | Deserted Props, Warehouse Essentials | More pallets/containers/loading structures are useful but not mandatory |
| Workshop interiors | Medium | Warehouse Essentials + general scrapyard props | Tools/shelving/garage equipment would improve the southeast district |
| Heavy machinery / power infrastructure | Weak-medium | pumps, water tower, ventilators, propane tank | Strong generator/tank/machine/crane assets still desirable |
| Modular industrial pipes | Weak | limited current pipe vocabulary | Modular Industrial Pipe Set remains high-value |
| Signage / decals | Medium | scrapyard message board and misc props | Warning Signs Decals would noticeably improve authored detail |
| Hero landmark | Not frozen | water tower/guardpost candidates exist | Prefer one stronger crane/gantry/processing-machine silhouette if available |
| Ruined structural shells | Medium | scrapyard structures, Warehouse Essentials | Dark Ruins donor is expected to strengthen this category |

## Intake Stop Rule

Do not keep collecting assets for categories already marked **Strong**.

Before the one-shot, prioritize only:
1. **Factory Environment Collection** donor content for heavy machinery/power and hero-landmark candidates,
2. **Modular Industrial Pipe Set** donor content for the Machinery/Power district,
3. **Warning Signs Decals Vol. 1** for industrial signage/polish,
4. one additional vehicle family only if the final live project scan still lacks two distinct vehicle/wreck silhouettes.

Already on disk and ready for curation/import:
- **Unfinished Building** — High FBX source, about 0.88 GB, 38 FBX files / 646 JPG textures.
- **Old Mine** — High FBX source, about 1.70 GB, 90 FBX files / 559 JPG textures.
- **Dark Ruins Megascans Sample** — UE 5.6 donor project, about 25.46 GB / 13,717 uassets; migrate only a very small generic structural subset.

Do not continue collecting more rocks, rubble, generic warehouse filler, or giant city packs before the one-shot.

Dark Ruins should be inspected mainly for ruined structural shells, rock/cliff transitions, rubble, retaining-wall-like pieces, and materials. It is not expected to solve the heavy-machinery or vehicle gaps.

## Freeze Threshold

The manifest is ready to freeze when:
- no required category is Weak,
- a hero landmark is selected from a verified project-visible asset,
- at least two vehicle/wreck silhouettes are available,
- the Machinery/Power district has enough large-scale industrial vocabulary to look distinct from the other districts,
- all selected donor/imported content has been verified inside UEFN.