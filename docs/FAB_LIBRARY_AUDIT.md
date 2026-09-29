# Scrapline — Fab Library Audit

## Scope

Full Epic Games Launcher Fab library audit captured from the user's **My Library** page.

Current library totals:
- **160 products**
- **77 3D**
- **4 Material & Textures**
- **1 Decal**
- **1 Animation**
- **2 VFX**
- **4 Game Systems**
- **69 Tools & Plugins**
- **2 Tutorials & Examples**

This audit separates owned content from content that is actually approved or present in Scrapline. Ownership alone does not make an asset one-shot-ready.

## One-Shot Production Pool

These owned packs are materially useful to the locked Scrapline design and should be considered before the asset manifest is frozen.

### Core environment / industrial

- Post-Apocalyptic Scrapyard Pack — mounted visual authority.
- Junkyard — Quixel Megascans, 96-asset industrial/salvage collection.
- Factory Environment Collection — heavy factory environment with machinery, cranes, forklift, assembly/storage areas and vehicles.
- Factory Pack Vol.1 — 151-mesh modular factory architecture pack.
- Construction Site VOL. 2 — Tools, Parts, and Machine Props — 52 industrial/construction meshes.
- Construction Site VOL. 1 — Supply and Material Props.
- Industry Props Pack 6 — industrial storage/box/barrel collection.
- City Street Props — 305 high-fidelity urban/utility props.
- Mega Street Props Pack — 101 street/industrial props.
- Street Props Pack Vol.1.
- Street Props Pack Vol.2.
- Wasteland Props - Free Pack — rusty wasteland barrels, tires, crates, tools and related props.
- FREE Post Apocalypse Survivor Environment Kitbash set — FBX post-apocalyptic/industrial kitbash sample.

### Loading / workshop / storage

- Warehouse — Quixel Megascans.
- Garage — complete garage plus transport/tools; useful as individual props.
- Free sample Warehouse & Storage - Vol 01.
- Warehouse Essentials Pack - Free 3D — already present in Scrapline.
- Unfinished Building — High FBX source already on disk.
- Derelict Corridor Megascans Sample — already on disk.
- Dark Ruins Megascans Sample — UE 5.6 donor project already on disk.
- Old Mine — High FBX source already on disk.

### Machinery / pipes / utilities

- Modular Industrial Pipe Set.
- Power Generator.
- Gas Cylinder 03 - Propane Tank — already present.
- Electrical Box — referenced content already present.
- Industrial Junkyard Propane Tank Metal — referenced content already present.
- Industrial Junkyard Crate Metal — referenced content already present.
- Mine Cart — referenced content already present.
- Metal Manhole Cover — referenced content already present.

### Vehicles / wreck silhouettes

- Abandoned & junk Car — already present in Scrapline.
- Vehicle Variety Pack Volume 2 — already downloaded locally.
- Vehicle Variety Pack.
- City Sample Vehicles — 13 vehicle family pack.
- Doomsday Pickup Truck - Drivable Post-Apocalyptic Vehicle.

### Containers / cargo / lane shaping

- Worn Metal Shipping Container.
- Military Cargo Container.
- Sci-Fi Supply Crate — reserve only; use only if its visual treatment fits the scrapyard.
- Metal Barricade — referenced content already present.
- Deserted: Domination Props — referenced content already present.

### Rubble / garbage / terrain dressing

- African Slate Quarry — 18 curated production meshes already imported.
- Rubble Pack — already present.
- Industrial Rubble — already present.
- Urban Garbage and Debris - Game-Ready Scan.
- Broken Concrete Slab — referenced.
- Cement Rubble — referenced.
- Concrete Rubble Pile variants — referenced.
- Dark Ruins / Unfinished Building / Old Mine — selective donor use only.

### Signage / atmosphere / polish

- Warning signs decals Vol. 1.
- London Street Props (Free) — reserve urban dressing.
- Talisman VFX — referenced.
- Deserted: Domination VFX — referenced.
- Landscape Material | MW Landscape Auto Material — optional compatibility test for terrain material workflow; do not make the one-shot depend on it until verified in UEFN.

## Final Staging Wave

Before freezing the manifest, prioritize this **owned** staging wave:

1. **Junkyard** — curate salvage, tires, trash, metal and large scrapyard silhouettes.
2. **Factory Environment Collection** — curate cranes, assembly machinery, cargo/forklift/industrial hero pieces.
3. **Construction Site VOL. 2** — curate tools, workbenches, ladders and machine props for Workshop/Machinery districts.
4. **Warehouse** — curate shelving, pallets, stock/storage and loading-yard pieces.
5. **Garage** — curate repair-shop/workshop props and vehicle-service dressing.
6. **Modular Industrial Pipe Set** — bring in a coherent pipe vocabulary.
7. **City Street Props** — cherry-pick utility boxes, signs, barriers, containers and industrial street details; do not migrate all 305 meshes.
8. **Warning signs decals Vol. 1** — industrial hazard/signage polish.
9. **Wasteland Props - Free Pack** — cherry-pick rusty barrels, tires, tools and wasteland filler.
10. **Power Generator** — FBX import for a dedicated power asset.
11. **Vehicle Variety Pack Volume 2** — curate only the strongest wreck/vehicle silhouettes.
12. **Worn Metal Shipping Container** and **Military Cargo Container** — add if current loading-yard containers are visually weak.
13. **FREE Post Apocalypse Survivor Environment Kitbash set** — inspect for wire/tower/industrial kitbash pieces that materially improve silhouettes.

The existing on-disk **Unfinished Building**, **Old Mine**, **Derelict Corridor**, and **Dark Ruins** remain selective donors and should be harvested in parallel with this wave.

## Heavy Reserves — Do Not Bulk-Migrate

Owned but too large, stylistically risky, or redundant for the first one-shot unless a specific gap survives the final scan:

- City Sample Buildings.
- Soul: City.
- Soul: Cave.
- Faymere River Village.
- ElderBoom Hollow Massive Medieval Village Environment.
- Modular Rural Cabins.
- Asian Canal Environment.
- Stylized Lake Village.
- Paladin RPG Set.
- Science Fiction Valley Town.
- museum / palace / heritage environment samples.

## Useful Production Utilities — Not Environment Dependencies

Owned tools that may help production but should not become new one-shot dependencies without a concrete need:

- [Free] Procedural Building Generator — UE donor authoring reserve.
- Substance 3D for Unreal Engine.
- Unreal Datasmith.
- Global Search Pro.
- Layer Manager UI.
- Rename Tool.
- Level Bookmarks.
- Blueprint Screenshot Tool.
- PCG Layered Biomes.
- Simple Noise Generators.

## Rejected / Avoid

- Lookout Tower — known UEFN failure; do not re-add.
- Old West VOL. 6 — removed from active project due art-direction mismatch/noise.
- Generic medieval, palace, museum and overt sci-fi content should not be used merely because it is owned.

## Recovery Cross-Check

`ASSET_RECOVERY.md` is authoritative for whether a listed Fab product is actually on disk, recovered from cache, or only represented by a manifest stub. Do not treat library ownership as download completion.

## Stop Rule

Asset acquisition is complete when the final staging wave has been selectively curated and the live UEFN scan confirms:

- at least two strong vehicle/wreck silhouettes,
- a coherent loading/storage kit,
- a convincing workshop tool kit,
- a distinct heavy-machinery/power kit,
- modular pipe vocabulary,
- industrial signage/decals,
- one strong hero-landmark candidate,
- no weak required category in `ASSET_GAP_MATRIX.md`.

After that point, no additional Fab browsing belongs in the one-shot path.