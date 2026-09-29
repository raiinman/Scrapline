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

The full Fab library audit now confirms **160 owned products**, including **77 3D assets**. The one-shot should use that ownership more aggressively, but only through selective curation.

Before the manifest freeze, stage/curate the following owned packs:

1. **Junkyard** — primary salvage/wreckage expansion.
2. **Factory Environment Collection** — primary heavy-machinery, crane and hero-landmark source.
3. **Construction Site VOL. 2** — workshop tools, ladders, benches and machine props.
4. **Warehouse** — loading/storage vocabulary.
5. **Garage** — workshop/service-area props.
6. **Modular Industrial Pipe Set** — pipe vocabulary.
7. **City Street Props** — cherry-pick utility, sign, barrier and street-industrial details.
8. **Warning signs decals Vol. 1** — signage polish.
9. **Wasteland Props - Free Pack** — rusty wasteland filler.
10. **Power Generator** — dedicated power asset.
11. **Vehicle Variety Pack Volume 2** — curated vehicle/wreck silhouettes.
12. **Worn Metal Shipping Container** / **Military Cargo Container** — only if loading-yard container variety remains weak.
13. **FREE Post Apocalypse Survivor Environment Kitbash set** — inspect only for strong industrial/wire/tower silhouette pieces.

Already on disk and available for selective curation:
- **Unfinished Building** — High FBX source.
- **Old Mine** — High FBX source.
- **Derelict Corridor Megascans Sample**.
- **Dark Ruins Megascans Sample** — UE 5.6 donor.
- **African Slate Quarry** — already curated and complete.

Do not bulk-migrate City Sample Buildings, Soul: City, Soul: Cave, medieval/village packs, museum/palace samples, or other stylistically unrelated content merely because it is owned.

Full ownership and disposition are recorded in `FAB_LIBRARY_AUDIT.md`.

## Freeze Threshold

The manifest is ready to freeze when:
- no required category is Weak,
- a hero landmark is selected from a verified project-visible asset,
- at least two vehicle/wreck silhouettes are available,
- the Machinery/Power district has enough large-scale industrial vocabulary to look distinct from the other districts,
- all selected donor/imported content has been verified inside UEFN.