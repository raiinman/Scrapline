# Scrapline — Fab Library Audit

## Scope

Full Epic Games Launcher Fab library audit captured from the user's **My Library** page.

Owned library totals at audit time:
- **160 products**
- **77 3D**
- **4 Material & Textures**
- **1 Decal**
- **1 Animation**
- **2 VFX**
- **4 Game Systems**
- **69 Tools & Plugins**
- **2 Tutorials & Examples**

Ownership is a selection pool, not a command to import everything.

## Status

**FINAL INTAKE CLOSED.**

The stop rule has fired. The live Scrapline project now has verified coverage for every required asset family and `ASSET_MANIFEST.md` is frozen for the one-shot.

## Production Content Promoted from the Owned Library

### Factory Environment Collection

- URL: https://www.fab.com/listings/2ee66462-8c2b-4303-892c-83f7fc0d9b3e
- Selectively migrated into `/Scrapline/Imported/FactoryCurated/`
- 14 approved StaticMeshes plus dependencies
- supplies the horizontal gantry/hero landmark, recycling machinery, forklift, engine, assembly-line pieces, containers, and electrical equipment

### Vehicle Variety Pack Volume 2

- URL: https://www.fab.com/listings/591e3b3f-9d49-4cd2-8e28-d471c1a10cab
- Selectively migrated into `/Scrapline/Imported/VehicleVarietyV2Curated/`
- approved silhouettes: Box Truck + Campervan

### Garage

- URL: https://www.fab.com/listings/b225b181-1eae-4df5-ad7c-4d49eeb7a6e8
- Selectively migrated into `/Scrapline/Imported/GarageSource/`
- 12 approved workshop/structure StaticMeshes
- bundled ThirdPerson/demo gameplay content excluded

### Modular Industrial Pipe Set

- URL: https://www.fab.com/listings/bc2c6167-f00a-4564-9b9e-98f599fa6a65
- 28 StaticMeshes promoted into `/Scrapline/Imported/IndustrialPipesSource/`
- complete frozen pipe vocabulary

### Warning Signs Decals Vol. 1

- URL: https://www.fab.com/listings/8064dbb6-85f3-4ec1-8390-7c8eb8f4cd96
- 12 selected industrial/hazard decal material instances promoted into `/Scrapline/Imported/WarningSignsSource/`
- novelty/non-industrial signs excluded

### African Slate Quarry

- URL: https://www.fab.com/listings/578d0ceb-5ccb-425f-abd5-e791a21551b6
- 18-mesh curated production subset already verified in Scrapline

## Existing Core Production Pool

Already-live content remains approved:

- Post-Apocalyptic Scrapyard Pack — primary visual authority
- Abandoned Junk Car
- Gas Cylinder / Propane Tank
- Industrial Rubble
- Rubble Pack
- 14 mounted referenced-content products covering barriers, rubble, electrical/junkyard props, mine cart, manhole, and VFX

### Warehouse Essentials — Quarantined

Warehouse Essentials is owned and physically present but is **not** approved production coverage.

Its single live mesh requests five missing material packages (`Materials/_1` through `Materials/_5`). No required Scrapline role depends on it. Do not repair or count it during the one-shot unless it is explicitly revalidated.

## Referenced-content handling

Fab Referenced Content is valid for placement even when its source editor is read-only.

Do not duplicate or promote an entire referenced pack merely to make it editable. Promote only a specific asset when implementation proves that its material, collision, Nanite/static-mesh settings, geometry, or another source property must change.

## Reserve Pool — Do Not Import Before One-Shot

These remain owned/recovered/downloaded sources but are unnecessary now that all required categories are covered:

- Junkyard
- Construction Site Vol. 1 / Vol. 2
- City Street Props
- Wasteland Props
- MW Landscape Auto Material
- Warehouse / additional warehouse packs
- Power Generator
- Factory Pack Vol. 1
- Street Props packs
- Unfinished Building
- Old Mine
- Derelict Corridor
- Dark Ruins
- Post Apocalypse Survivor Environment Kitbash
- additional vehicle/container packs
- City Sample Buildings / Vehicles
- Soul: City / Cave
- unrelated medieval/village/museum/palace/sci-fi environment packs

Do not import reserve content just because it exists.

## Rejected / Avoid

- **Lookout Tower** — known UEFN failure; blacklisted.
- **Old West VOL. 6** — removed from active project for art-direction mismatch/noise.
- Generic medieval, palace, museum and overt sci-fi content — not valid substitutes for the frozen industrial pool.

## Stop Rule — Satisfied

Required conditions:

- at least two strong vehicle/wreck silhouettes — **yes**
- coherent loading/storage kit — **yes**
- convincing workshop kit — **yes**
- distinct heavy-machinery/power kit — **yes**
- modular pipe vocabulary — **yes**
- industrial signage/decals — **yes**
- strong hero-landmark candidate — **yes, Factory horizontal gantry/crane assembly**
- no weak required category — **yes**

Therefore:
**No additional Fab browsing, downloading, or broad donor intake belongs in the one-shot path.**

Reopen acquisition only for a specific implementation failure documented in `ASSET_GAP_MATRIX.md`.
