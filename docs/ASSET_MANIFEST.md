# Scrapline — Asset Manifest

## Status

**FROZEN FOR ONE-SHOT — 2026-09-29**

The live UEFN project now satisfies every required production-asset family in `ASSET_GAP_MATRIX.md`. The final donor curation wave was verified through the live UEFN Asset Registry / Power Tools bridge.

Do not resume broad asset acquisition before the one-shot. Add or replace content only if implementation proves a specific frozen asset is unusable.

## Final Live Verification

Latest live UEFN checks:

- Scrapline project opens successfully.
- Map Check: **0 errors / 0 warnings**.
- Power Tools Project Health: **0 errors / 3 warnings**.
- The 3 health warnings are pre-existing oversized Gas Cylinder / Propane Tank textures; they are not failures in the new curated imports.
- Health scan saw approximately **504 project files / 2.60 GB**.
- Representative new assets were loaded individually inside UEFN with no unreadable properties/errors:
  - Factory crane
  - Factory forklift
  - Vehicle box truck
  - Vehicle campervan
  - Garage workbench
  - Industrial pipe valve
  - Warning-sign material instance

## Mounted Referenced Content

The project contains **14 approved Fab reference files**:

- Post-Apocalyptic Scrapyard Pack
- Deserted: Domination Props
- Deserted: Domination VFX
- Talisman VFX
- Concrete Rubble Pile
- Concrete Rubble Pile 2
- Cement Rubble
- Broken Concrete Slab
- Metal Barricade
- Rusty Electrical Box
- Industrial Junkyard Crate Metal
- Industrial Junkyard Propane Tank
- Mine Cart
- Metal Manhole Cover

The previously mounted OldWest Vol. 6 reference remains outside the active project.

## Visual Authority

### Post-Apocalyptic Scrapyard Pack

- Source: Fab
- URL: https://www.fab.com/listings/c584020d-fcae-453d-b496-fce46d90c97b
- Status: **Approved / mounted / verified**
- Role: primary visual authority, scrapyard architecture, rusted structures, cover, elevation, junkyard dressing, and large visual anchors.

Everything else must visually belong beside this pack.

## Frozen Curated Donor Content

### Factory Environment Collection

- Source: Fab
- URL: https://www.fab.com/listings/2ee66462-8c2b-4303-892c-83f7fc0d9b3e
- Status: **Approved / selectively migrated / live-verified**
- Live namespace: `/Scrapline/Imported/FactoryCurated/`
- Live inventory: **121 assets total / 14 StaticMeshes**
- Approximate live footprint: **604 MB**

Approved static meshes:
- `Meshes/Crane/SM_Crane01`
- `Meshes/Crane/SM_CraneCabin01`
- `Meshes/Crane/SM_CraneCable01`
- `Meshes/SM_RecyclingMachine01`
- `Meshes/SM_EngineWithContainer`
- `Meshes/SM_ForkLift`
- `Meshes/SM_AssemblyLine01`
- `Meshes/SM_AssemblyLine02`
- `Meshes/SM_AssemblyLineControl01`
- `Meshes/SM_AssemblyLineTable01`
- `Meshes/SM_Container01_01`
- `Meshes/SM_Container01_02`
- `Meshes/SM_ElectricalPanel_01`
- `Meshes/SM_ElectricalSupply_Switchboard01`

Roles:
- Machinery / Power Yard
- Loading Yard
- central industrial landmark
- electrical/infrastructure dressing
- hard-cover machinery silhouettes

### Hero Landmark — Frozen

Primary central landmark:
`/Scrapline/Imported/FactoryCurated/Meshes/Crane/SM_Crane01`

Compose it with the verified cabin/cable pieces and surrounding scrap/industrial cover. It must not become an uncontested full-map perch.

Secondary hero/support anchors:
- `SM_RecyclingMachine01`
- `SM_EngineWithContainer`

### Vehicle Variety Pack Volume 2

- Source: Fab
- URL: https://www.fab.com/listings/591e3b3f-9d49-4cd2-8e28-d471c1a10cab
- Status: **Approved / selectively migrated / live-verified**
- Live namespace: `/Scrapline/Imported/VehicleVarietyV2Curated/`
- Live inventory: **71 assets total / 2 StaticMeshes**

Approved vehicle silhouettes:
- `Meshes/SM_BoxTruck_01a`
- `Meshes/SM_Campervan_01a`

Use as static wreck/vehicle forms unless implementation has a specific reason to preserve vehicle behavior. They supplement the already-live Abandoned Junk Car.

### Garage

- Source: Fab
- URL: https://www.fab.com/listings/b225b181-1eae-4df5-ad7c-4d49eeb7a6e8
- Status: **Approved / selectively migrated / live-verified**
- Live namespace: `/Scrapline/Imported/GarageSource/`
- Live inventory: **61 assets total / 12 StaticMeshes**

Approved meshes:
- `Meshes/SM_Garage_1`
- `Meshes/SM_Garage_1_roof`
- `Meshes/SM_Workbench`
- `Meshes/SM_Shelf`
- `Meshes/SM_Shelf_1`
- `Meshes/SM_Cart`
- `Meshes/SM_Pallet`
- `Meshes/SM_Stairs`
- `Meshes/SM_Railings`
- `Meshes/SM_Illuminator`
- `Meshes/SM_Ventilation`
- `Meshes/SM_Wheel`

Role: Ruined Workshop structure, repair/workbench dressing, shelving, traversal pieces, and workshop identity.

The donor's bundled ThirdPerson demo/gameplay content is explicitly **not approved** and was not migrated.

### Modular Industrial Pipe Set

- Source: Fab
- URL: https://www.fab.com/listings/bc2c6167-f00a-4564-9b9e-98f599fa6a65
- Status: **Approved / curated system migrated / live-verified**
- Live namespace: `/Scrapline/Imported/IndustrialPipesSource/`
- Live inventory: **32 assets total / 28 StaticMeshes**

Use the model family as the frozen modular pipe vocabulary: straight lengths, turns, T-joints, connectors, valves, and bracing.

Role: Machinery / Power Yard, service infrastructure, lane framing, sightline breakup, and visual overlap between districts.

### Warning Signs Decals Vol. 1

- Source: Fab
- URL: https://www.fab.com/listings/8064dbb6-85f3-4ec1-8390-7c8eb8f4cd96
- Status: **Approved / selectively migrated / live-verified**
- Live namespace: `/Scrapline/Imported/WarningSignsSource/`
- Live inventory: **52 assets total / 12 selected MaterialInstanceConstants**

Approved decal instances and verified visual meaning:
- `MI_WarningSign_V1_11` — biohazard
- `MI_WarningSign_V1_12` — radiation
- `MI_WarningSign_V1_14` — POISON / skull
- `MI_WarningSign_V1_30` — TOXIC / skull
- `MI_WarningSign_V1_31` — TOXIC / biohazard
- `MI_WarningSign_V1_34` — biohazard symbol
- `MI_WarningSign_V1_35` — radiation
- `MI_WarningSign_V1_36` — left arrow
- `MI_WarningSign_V1_37` — right arrow
- `MI_WarningSign_V1_40` — CRASH
- `MI_WarningSign_V1_51` — machinery/explosion-style hazard
- `MI_WarningSign_V1_54` — skull-and-crossbones warning

Each selected instance has its matching Albedo, Normal, and ORM texture set present in the live project. Selection rule: industrial hazard, toxic/biohazard/radiation/explosion, directional, and crash language only. The novelty filler from the 60-decal donor set is not part of the one-shot pool.

## Existing Local Modifiable Fab Content

Verified under `Content/Fab`:

- Abandoned Junk Car
- Gas Cylinder 03 / Propane Tank
- Industrial Rubble
- Rubble Pack

These remain approved production content. The oversized propane source textures are the only current Project Health warnings.

### Warehouse Essentials — Quarantined

Warehouse Essentials is physically present but is **not approved for the one-shot**. Current UEFN logs show its single live mesh requesting five missing material packages (`Materials/_1` through `Materials/_5`). Those packages do not exist in the live project. Do not use or repair this asset during the one-shot unless it is explicitly revalidated; no required Scrapline role depends on it.

## African Slate Quarry

- Source: Fab / Quixel Megascans
- URL: https://www.fab.com/listings/578d0ceb-5ccb-425f-abd5-e791a21551b6
- Status: **Approved / curated / verified**
- Live destination: `/Scrapline/Imported/AfricanSlateQuarry/Curated/`
- Production content: **18 meshes + 18 material instances + 72 selected 4K texture maps**
- Approximate footprint: **155.7 MB**
- Every curated mesh uses the verified `M_ASQ_Master` material workflow.
- All 18 meshes were individually verified; Nanite and conservative collision were configured.

Roles:
- perimeter earthwork
- quarry cuts
- drainage/service-road transitions
- sightline termination
- restrained natural breakup

## Required Family Coverage

The frozen pool now has verified choices for:

- rusty scrapyard architecture
- wreck / vehicle forms
- fencing / hard barriers
- containers / loading props
- workshop structures and dressing
- heavy machinery / power infrastructure
- modular industrial pipes
- concrete / rubble
- utility / electrical props
- industrial signage / decals
- ambient VFX
- terrain/perimeter rocks
- central hero landmark

No required category remains weak.

## Reserves — Do Not Add Before One-Shot

These are owned/recovered/on disk but are now **reserve only** because the intake stop rule has fired:

- Junkyard
- Construction Site Vol. 1 / Vol. 2
- City Street Props
- Wasteland Props
- MW Landscape Auto Material
- Dark Ruins
- Derelict Corridor
- Unfinished Building
- Old Mine
- Post Apocalypse Survivor Kitbash
- additional vehicle packs
- City Sample Buildings / Vehicles
- Soul: City / Cave and unrelated large environment packs

Do not import them merely because they are available.

## Rejected / Removed

### LookoutTower

Status: **Rejected / blacklisted.**

It previously caused severe GameFeature/Verse loading thrash and was removed from Scrapline. Do not re-add without isolated re-testing after a packaging change.

### OldWest Vol. 6

Status: **Removed / quarantined.**

It does not belong to the locked art direction and generated unnecessary Content Browser noise.

## Hard Rule

Codex must not silently replace a missing environment family with visible primitive geometry.

If a frozen production asset cannot be used, Codex must:
- choose another verified production asset from this manifest,
- use a suitable built-in Fortnite/UEFN production asset,
- or report the exact dependency/problem.

Do not restart asset hunting during the primary one-shot build.
