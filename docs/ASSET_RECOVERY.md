# Scrapline — Asset Recovery Status

## Status

**Recovery complete. Priority donor curation complete.**

The Fab/Epic staging failure is no longer a build blocker. The repaired UE 5.6 staging project works, the priority UE-only payloads were recovered/downloaded, and the production subset needed by Scrapline has been migrated and verified inside live UEFN.

## Original Failure

Two problems overlapped:

1. The first UE 5.6 staging project used a whole-project junction to D:. Unreal logged directory-watcher failures through that layout, and direct write tests showed D: was dramatically slower than C: for small writes.
2. Epic Online Services became unavailable during the same intake wave. Several UE products acquired only Fab manifest metadata and never completed their payload install.

A Fab manifest or advertised cache size did not prove that the payload existed locally.

## Repaired Staging Project

Physical local receiver:

`C:\Users\mikea\OneDrive\Documents\Unreal Projects\Scrapline_UE56_Staging\ScrapStage56.uproject`

Rules:
- physical C: Content/Saved/Intermediate/DDC folders
- no whole-project D: redirect
- staging is a donor/curation workspace, not shipping Scrapline content
- never bulk-migrate sample projects into Scrapline

## Recovered Content

### Wasteland Props - Free Pack

Complete UE payload recovered from Epic cache.

Verified:
- approximately **2.97 GB**
- **268 .uasset files**
- **1 .umap**

The recovered source remains reserve-only after the final asset freeze.

### Construction Site VOL. 1

Recovered from the downloaded Unity package to:

`C:\Users\mikea\Documents\FabRecovered\ConstructionSiteVol1`

Verified:
- **70 FBX**
- **114 texture files**
- approximately **1.24 GB**

### Construction Site VOL. 2

Recovered to:

`C:\Users\mikea\Documents\FabRecovered\ConstructionSiteVol2`

Verified:
- **45 FBX**
- **92 texture files**
- approximately **0.95 GB**

Both construction packs are now reserve-only; Garage filled the live workshop gap without requiring another FBX import wave.

## Complete Donor / Source Libraries

Still available if a specific post-freeze failure requires them:

- Dark Ruins Megascans Sample
- Factory Environment Collection
- Derelict Corridor Megascans
- Vehicle Variety Pack Volume 2
- Wasteland Props
- African Slate Quarry High FBX
- Junkyard High FBX
- Unfinished Building High FBX
- Old Mine FBX
- Post Apocalypse Survivor Kitbash FBX
- London Street Props FBX
- Urban Garbage and Debris FBX
- Construction Site Vol. 1 / 2 recovered FBX source

## Completed UE-Only Downloads

The former manifest-only priority products successfully materialized into ScrapStage56:

- MW Landscape Auto Material
- Modular Industrial Pipe Set
- Warning Signs Decals Vol. 1
- Garage
- City Street Props

Epic Launcher install history confirmed all five.

Current staging paths for curated/renamed sources:

- Garage: `/Game/Imported/GarageSource/`
- Modular Industrial Pipes: `/Game/Imported/IndustrialPipesSource/`
- Warning Signs: `/Game/Imported/WarningSignsSource/`
- Factory curated donor subset: `/Game/Imported/FactoryCurated/`
- Vehicle Variety V2 curated donor subset: `/Game/Imported/VehicleVarietyV2Curated/`

Unneeded full sources such as City Street Props and MW Landscape remain staging/reserve content, not live Scrapline dependencies.

## Production Curation Completed

Verified live UEFN promotion:

### Factory

`/Scrapline/Imported/FactoryCurated/`

- 121 live assets
- 14 selected StaticMeshes
- crane / machinery / forklift / assembly / container / electrical vocabulary

### Vehicles

`/Scrapline/Imported/VehicleVarietyV2Curated/`

- 71 live assets
- Box Truck + Campervan StaticMeshes

### Garage

`/Scrapline/Imported/GarageSource/`

- 61 live assets
- 12 selected StaticMeshes
- donor demo/ThirdPerson Blueprints excluded

The Garage donor emits legacy demo Blueprint errors in UE5.6 because its bundled ThirdPerson sample references obsolete XR/input nodes. Those errors are confined to the donor demo and are not present in the migrated production subset.

### Pipes

`/Scrapline/Imported/IndustrialPipesSource/`

- 32 live assets
- 28 StaticMeshes

### Warning Signs

`/Scrapline/Imported/WarningSignsSource/`

- 52 live assets
- 12 selected decal MaterialInstanceConstants

## Live Verification

After promotion:

- UEFN opens Scrapline successfully.
- Map Check: **0 errors / 0 warnings**.
- Power Tools Project Health: **0 errors / 3 warnings**.
- The 3 warnings are pre-existing oversized propane-tank textures.
- Factory crane/forklift/recycling machinery, vehicle meshes, Garage workbench, pipe valve, and a selected Warning Sign material were all loaded successfully through the live UEFN bridge.

## Post-Freeze Staging Cleanup

After the live production pool was frozen and verified, three no-longer-required staging payloads were removed from ScrapStage56 to preserve C: headroom:

- City Street Props (`Deko_MatrixDemo`) — approximately **5.73 GB**
- MW Landscape Auto Material — approximately **0.68 GB**
- duplicate staged Wasteland Props — approximately **2.97 GB**

The Wasteland source remains verified intact in Epic's VaultCache at **268 .uasset files / 269 total files**.

The curated `Content/Imported` staging tree remains in place as a repair source for the frozen Factory, Vehicle, Garage, Pipes, and Warning Signs imports.

After cleanup, C: free space was approximately **38.19 GB**.

## Recovery / Intake Rule Going Forward

Do not re-download or re-stage the completed priority packs.

The asset manifest is frozen. Reserve content should remain untouched unless a specific implementation failure forces the asset-gap process to reopen.

Once temporary staging space is no longer useful for the one-shot repair window, it may be cleaned to recover C: space; preserve the live Scrapline project and any source package explicitly intended as a durable archive.
