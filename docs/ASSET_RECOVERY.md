# Scrapline — Asset Recovery Status

## Why Fab appeared to lose files

Two separate failures overlapped:

1. The first UE 5.6 staging project was exposed to Epic through a **whole-project junction to D:**. Unreal logged a Content directory watcher failure through that layout, and direct write tests showed D: is dramatically slower than C: for small writes. Large Fab copies into that redirected project could therefore stall or time out.
2. Epic Online Services became unavailable during the same intake wave. Several UE-format products acquired only their Fab manifest/metadata and never completed an asset payload install.

A Fab manifest or a nonzero advertised cache size does **not** prove that the payload exists locally.

## Staging project repair

The staging project has been rebuilt as a physical local project under:

`C:\Users\mikea\OneDrive\Documents\Unreal Projects\Scrapline_UE56_Staging\ScrapStage56.uproject`

Changes:
- short project name: **ScrapStage56**,
- Content / Saved / Intermediate / DerivedDataCache are now physical C: folders, not D: junctions,
- stale old staging project records were removed from Unreal recent-project metadata,
- Epic Launcher now discovers the corrected `ScrapStage56.uproject`,
- the obsolete D:-redirected staging tree was quarantined instead of deleted.

The repaired local receiver is working. The original priority UE-only retry wave has now completed successfully. Keep using ScrapStage56 as a temporary donor/curation project rather than treating all staged content as shipping Scrapline content.

## Recovered content

### Wasteland Props - Free Pack

Fab had actually downloaded the complete UE payload into:

`C:\ProgramData\Epic\EpicGamesLauncher\VaultCache\Wastelan3111d46318b7V1\data\Content`

Verified:
- approximately **2.97 GB**,
- **268 .uasset files**,
- **1 .umap**.

The full payload is also present in the repaired ScrapStage56 receiver under `Content/FreeWastelandProps_Meshingun`.

### Construction Site VOL. 1

Fab downloaded the Unity package instead of UE content. The Unity package was not wasted: it contains the original source FBX and texture files.

Recovered to:

`C:\Users\mikea\Documents\FabRecovered\ConstructionSiteVol1`

Verified recovery:
- **70 FBX**,
- **114 texture files**,
- approximately **1.24 GB** recovered source content.

### Construction Site VOL. 2

Recovered to:

`C:\Users\mikea\Documents\FabRecovered\ConstructionSiteVol2`

Verified recovery:
- **45 FBX**,
- **92 texture files**,
- approximately **0.95 GB** recovered source content.

These two construction packs can now enter the same curated FBX pipeline used for African Slate Quarry; they do not need to be downloaded again.

## Complete donor projects already available

- Dark Ruins Megascans Sample — ~25.7 GB / 13,717 uassets.
- Factory Environment Collection — ~8.7 GB / 2,116 uassets.
- Derelict Corridor Megascans — ~4.7 GB / 5,808 uassets.
- Vehicle Variety Pack Volume 2 — ~1.31 GB / 153 uassets.
- Wasteland Props — recovered directly from Fab cache and also present in ScrapStage56.

## Complete exchange/source downloads already available

- African Slate Quarry — High FBX; curated production subset already in Scrapline.
- Junkyard — High FBX.
- Unfinished Building — High FBX.
- Old Mine — FBX source.
- FREE Post Apocalypse Survivor Environment Kitbash — FBX source.
- London Street Props — FBX source.
- Urban Garbage and Debris — FBX source.
- Construction Site Vol. 1/2 — recovered source from Unity packages.

## Completed priority UE-only staging installs

The products that previously existed only as Fab manifest stubs have now materialized as real UE 5.6 assets inside ScrapStage56.

Verified on disk:

| Product | ScrapStage56 content folder | Approx. size | Verified assets |
|---|---|---:|---:|
| Landscape Material | MW Landscape Auto Material | `MWLandscapeAutoMaterial` | 0.685 GB | 97 uassets / 3 umaps |
| Modular Industrial Pipe Set | `IndustrialPipesM` | 0.218 GB | 42 uassets / 1 umap |
| Warning Signs Decals Vol. 1 | `FD_WarningSigns_V1` | 2.218 GB | 243 uassets / 1 umap |
| Garage | `GaragePack` | 1.652 GB | 557 uassets / 5 umaps |
| City Street Props | `Deko_MatrixDemo` | 5.732 GB | 749 uassets / 2 umaps |

Epic Launcher install history also records successful installs for all five products.

At the latest verification, ScrapStage56 contained approximately **13.54 GB**, **1,956 uassets**, and **6 staged top-level content families** including Wasteland Props. C: had approximately **33.25 GB free** after the completed intake.

## Still manifest-only / reserve downloads not required for the priority wave

Several owned UE-format reserve products may still have Fab manifests without local payload paths, including:
- Free Sample Warehouse & Storage Vol. 01,
- Industry Props Pack 6,
- Street Props Pack Vol. 1,
- Street Props Pack Vol. 2,
- Vehicle Variety Pack,
- City Sample Vehicles,
- City Sample Buildings,
- Soul: City / Soul: Cave and other reserve environments.

Do not treat those as available unless their real payload is verified. They are no longer prerequisites for the current priority staging wave unless the live Scrapline gap scan justifies them.

## Curation rule

Do **not** re-download the five completed priority UE-only packs.

Next:
1. inspect their real assets in ScrapStage56,
2. curate only pieces that fill the locked Scrapline asset gaps,
3. migrate approved subsets into the live Scrapline UEFN project,
4. verify the final project-visible paths,
5. clear temporary staged bulk content when no longer needed,
6. freeze the asset manifest only after the live project gap scan passes.

Priority curation order:
1. Garage,
2. Modular Industrial Pipe Set,
3. Warning Signs Decals,
4. City Street Props selective utility/sign/barrier content,
5. MW Landscape Auto Material only if its terrain workflow proves compatible and useful.

Do not re-download assets already recovered above.
