# Local asset reality check — 2026-09-30

Fresh-build authority: user explicitly requested a clean Scrapline-derived rebuild. The prior constructed level, spatial freeze, pre-build hold, frozen terrain and old placement JSON are historical references. This package does not inherit their layout.

## Confirmed local environment

- Live UEFN asset registry responded through Epic Unreal MCP and Power Tools. `/Scrapline/Imported` contains **446 assets**; matching disk count is 446 UAssets. This is current evidence, not the earlier build-health result.
- Imported families: AfricanSlateQuarry **109**, FactoryCurated **121**, GarageSource **61**, IndustrialPipesSource **32**, VehicleVarietyV2Curated **71**, WarningSignsSource **52**.
- `Content/Fab` contains **45 UAssets**. `References` contains **14 UREF files**. Mounted SCBK paths were freshly discovered; different assets have different GUID mounts—never fabricate a shared pack prefix.
- UE 5.6 and UE 5.8 installed at `C:/Program Files/Epic Games/`; Blender **5.2.1 LTS** installed at `C:/Program Files/Blender Foundation/Blender 5.2/blender.exe`.
- Active historical UEFN project: `C:/Users/mikea/Documents/Codex/2026-09-27/i-want-to-1-shot-a-3/outputs/Scrapline/Scrapline.uefnproject`. Preserve its map, Lore history, references and source assets. It is an asset donor, never the new construction base.
- Repaired UE donor stage: `C:/Users/mikea/OneDrive/Documents/Unreal Projects/Scrapline_UE56_Staging/ScrapStage56.uproject`. Other local donor projects: FactoryEnvironmentCollect, VehicleVarietyPackVolume2, DarkRuinsMegascansSample, DerelictCorridorMegascans.
- GitHub durable source refreshed from `raiinman/Scrapline`, latest fetched overnight branch `7f40556`; fresh branch: `fresh-build/quarry-cut-20260930`.
- Full bounded search evidence: `disk_inventory.json`, `disk_asset_files.csv`, `live_asset_paths.csv`, `mesh_material_bindings.csv`. File/registry presence is not cook, license, collision or runtime acceptance.

## Exact production kit and area assignments

Paths below are live object/package identities; resolve and validate each asset again in the fresh target namespace after migration.

| Family / source | Exact selections and materials | Fresh area | State |
|---|---|---|---|
| Factory Environment Collection, Fab `2ee66462-8c2b-4303-892c-83f7fc0d9b3e` | `/Scrapline/Imported/FactoryCurated/Meshes/Crane/SM_Crane01`, cabin/cable siblings; `Materials/MI_Crane01`, `MI_FireEquipmentBox`; `SM_EngineWithContainer`, `SM_RecyclingMachine01` with `MI_RecyclingMachine01`; `SM_ForkLift`; `SM_Container01_01`/`_02` with `MI_Container01`; assembly and electrical meshes | Transfer Court, Receiving, Power Loop | Live curated; geometry/texture export tested; representative live material slots read |
| Garage, Fab `b225b181-1eae-4df5-ad7c-4d49eeb7a6e8` | `/Scrapline/Imported/GarageSource/Meshes/SM_Garage_1` + `_roof`; `Materials/M_Garage_1` + `_roof`, `Textures/T_Garage_1_BC`, Normal, HRM; workbench, shelves, cart, pallet, stairs, railings, ventilation, wheel | Workshop Terrace | Live curated; shell/roof shared pivots; source demo Blueprints are excluded |
| Vehicle Variety V2, Fab `591e3b3f-9d49-4cd2-8e28-d471c1a10cab` | `/Scrapline/Imported/VehicleVarietyV2Curated/Meshes/SM_BoxTruck_01a`, `SM_Campervan_01a`; `Materials/BoxTruck/Mi_BoxTruck_Exterior_01a`/b/c, detailing/interior/glass; corresponding Camper material family | Dispatch Pocket, Receiving, Drain Cut | Live; all material slots must survive migration; static cover only |
| Industrial Pipes, Fab `bc2c6167-f00a-4564-9b9e-98f599fa6a65` | `/Scrapline/Imported/IndustrialPipesSource/` — `pipe_m_l300_00`, valve, turns, T joints, bracing; `/materials/pipes_m_skin0` with `/textures/pipes_m_diffuse_skin0`, roughness and normal textures; bindings in CSV | Power Loop / service margins | 28 live meshes; no invented pipe stand-ins |
| Warning Signs, Fab `8064dbb6-85f3-4ec1-8390-7c8eb8f4cd96` | `/Scrapline/Imported/WarningSignsSource/Decals/MI_WarningSign_V1_11`, 12, 14, 30, 31, 34, 35, 36, 37, 40, 51, 54; `Materials/M_MasterDecals`; matching albedo/normal/ORM | Lane entrances, workshop, electrical equipment | 12 live decal instances; inspect symbols in existing sign contact sheet before choosing |
| African Slate Quarry, Fab `578d0ceb` cache family | `/Scrapline/Imported/AfricanSlateQuarry/Curated/Meshes/ASQ_xckjajs`, `ASQ_xckjagi`, `ASQ_xb5ebhf` and 15 other curated meshes; `Curated/Materials/MI_ASQ_<id>` + corresponding BaseColor/Normal/Roughness/AO textures; `Materials/M_ASQ_Master` | Outside shoulders, drain edges, footing blends | 18 live meshes with texture families; use intact VaultCache sources for Blender, not incomplete D: copies |
| Post-Apocalyptic Scrapyard, Fab `c584020d-fcae-453d-b496-fce46d90c97b` | `SCBK_old_car_ruin_L0`, `SCBK_huge_junk_pile_L0`, junk pile 02, corrugated plates, wire fences, metal catwalk modules, reservoir, guardpost; exact GUID object paths in `live_asset_paths.csv` | Salvage margins throughout, local traversal, silhouettes | Mounted/read-only and placeable; no pack-wide duplication; not all source material settings editable |
| Existing Fab imports | Abandoned junk Car, Rubble Pack, Industrial Rubble, Warehouse Essentials, Gas Cylinder / Propane Tank; exact 45 paths in CSV | Wrecked drain margins, barrier feet, clutter | Live registry; earlier 8K propane texture warnings are historical and must be rechecked |
| Mounted supporting references | Deserted Props / VFX, Talisman VFX, Concrete Rubble Piles, Cement Rubble, Broken Concrete Slab, Metal Barricade, Rusty Electrical Box, industrial crate/propane, Mine Cart, Manhole Cover | Alternate cover, ground joins, restrained ambiance | 14 UREFs confirmed; revalidate mounted dependencies in fresh map |

## Downloaded sources and reserve content

Epic cache root: `C:/ProgramData/Epic/EpicGamesLauncher/VaultCache/`. FabLibrary contains African Slate Quarry, Junkyard, Post Apocalypse Survivor Kitbash, Unfinished Building, Old Mine, London Street Props, Urban Garbage and Debris, construction packs, Factory, Garage, pipes, vehicles, warning signs, Wasteland and other families. The audit lists actual files/sizes rather than equating metadata directories with completed payloads.

- African Slate complete sources are under `FabLibrary/African_Slate_Quarry-578d0ceb/fbx/high/south_african_slate_quar_extracted/`. Blender references use exact `xckjajs`, `xckjagi`, `xb5ebhf` geometry/textures.
- Junkyard actual source: `FabLibrary/Junkyard-a984aac1/fbx/high/junkyard_high_extracted/`. Reference barrels `teraccgda`, `teufceuda`, `tewscfuda` have matching Albedo/Normal and further maps. These are **source-only**, not currently migrated production dependencies. Native Scrapline barrel/propane vocabulary can fulfil the same small-clutter role; import these specific variants only if needed, with complete PBR/collision validation.
- Construction Vol 1/2 recovered at `C:/Users/mikea/Documents/FabRecovered/`: **115 FBX**, **197 TGA**, **9 PNG**, **6 EXR** total across both packs. Unity `.mat`/prefab content is not automatically a UEFN material. Meshes require unit/collision checks and UE material reconstruction using ALB/NRM/MS/AO maps. Reserve rather than mandatory.
- `C:/Users/mikea/Documents/FabExports/Scrapline/Incoming` and Processed currently contain no relevant payload files. Do not rely on their old names/status.
- `D:/UnrealDonors/Scrapline_SourceVault/` is incomplete: sparse/empty folders and **zero-byte texture files**, including xb5ecaf BaseColor. Do not claim a folder proves source integrity. Originals were found intact in C: VaultCache. No old content was deleted during this run.
- LookoutTower remains rejected for documented prior GameFeature/Verse/editor failures. OldWest is historical outside the active visual palette. Garage donor demo/StarterContent exports are not approved assets and are excluded from the reference scene.

## MW Landscape Auto Material — corrected availability

The previous `e451f03` September 29 cleanup record said its stage copy was removed to reclaim ~0.68 GiB. That record did not establish user approval; the user explicitly disputed the removal during this task. **The staging copy has now been restored from the intact local cache**, without redownload: `Content/MWLandscapeAutoMaterial/` in ScrapStage56. Source and restored tree both contain **100 files, 735,412,278 bytes**: 97 UAssets and 3 maps. File-by-file hash verification is recorded separately. Preserve it; do not remove installed/downloaded assets or history for housekeeping without explicit user approval.

Exact candidate master: `/Game/MWLandscapeAutoMaterial/Materials/MASTER/MTL_MWAM_AutoMaterial_MASTER`. Example instances: `Materials/Landscape/MTL_MWAM_Landscape_DesertExample`, IslandExample and MountainRangeExample. **Restored staging availability is confirmed; UEFN compatibility and material performance are not yet validated.** Inspect its texture/layer/foliage/dependency requirements before selective migration. Keep sample maps and procedural helper Blueprints out of the shipping arena.

## Terrain tools actually found and chosen workflow

- Live editor returned `EM_Landscape`, `EM_Foliage`, `EM_ModelingToolsEditorMode`. Landscape sculpt/import/paint is the practical base.
- Live registry exposes PCG, PCGBiome and Landmass assets; UE5.6 plugin directories also exist. Presence does not prove every procedural graph or brush is usable/cookable in UEFN. Use these in donor staging and bake results if needed; no runtime PCG requirement.
- Landscape splines can refine roads/cuts where supported. Keep route geometry and collision deliberate, not driven by automatic clutter scattering.
- Blender 5.2 has mesh/displacement/geometry-node capability. No user-installed ANT Landscape add-on or dedicated Gaea/World Machine/Houdini terrain app was found in the checked install/config locations; this is a bounded search, not an assertion about every disk folder.
- **Preferred:** new deterministic 253×253 16-bit heightmap → UEFN native Landscape → hand-sculpt playable grades and exterior cuts → curated quarry rock stitching. This uses proven available native tooling and avoids dependency on unverified brushes. MW auto material is a preserved candidate shading path, not a height generator.
- New inputs: `QuarryCut_253_16bit.png`, `terrain_import.json`. 230 m square scenery; XY 91.269841 cm; Z scale 8; landscape corner approximately (-11500,-11500,0) cm. Inspect import preview/orientation and center samples before saving.
- Material fallback exists locally: `/FortniteLandscape/Materials/M_FortniteLandscape_Customizable` and its exposed instance. Existing `/Scrapline/Environment/Materials/MI_Scrapline_Yard` is a reusable material source, not terrain geometry authority. Build a new instance; preserve original. Pair with validated quarry maps. Native customizable material can be used if MW fails UEFN validation; record the specific failure rather than silently abandoning MW.

Official terrain reference verified with Context7: https://dev.epicgames.com/documentation/fortnite/landscape-mode-in-unreal-editor-for-fortnite . UEFN landscape resolution is limited to 2048×2048 vertices or an equivalent aspect ratio; this package is safely below that limit.

Disk inventory was captured before the MW restoration. Use MW_RESTORATION.json for the verified restored tree (100 files, 735,412,278 bytes), rather than interpreting the earlier scan as its current absence.
