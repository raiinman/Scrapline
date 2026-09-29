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

Because C: space is limited, use ScrapStage56 as a **one-pack-at-a-time staging project**, harvest/migrate the useful subset, then clear that pack before adding the next large UE-only product.

## Recovered content

### Wasteland Props - Free Pack

Fab had actually downloaded the complete UE payload into:

`C:\ProgramData\Epic\EpicGamesLauncher\VaultCache\Wastelan3111d46318b7V1\data\Content`

Verified:
- approximately **2.97 GB**,
- **268 .uasset files**,
- **1 .umap**.

A lightweight donor descriptor `WastelandRecovered.uproject` was added beside the cached Content tree and successfully opened in UE 5.6. No duplicate 3 GB copy was required.

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
- Wasteland Props — recovered directly from Fab cache as described above.

## Complete exchange/source downloads already available

- African Slate Quarry — High FBX; curated production subset already in Scrapline.
- Junkyard — High FBX.
- Unfinished Building — High FBX.
- Old Mine — FBX source.
- FREE Post Apocalypse Survivor Environment Kitbash — FBX source.
- London Street Props — FBX source.
- Urban Garbage and Debris — FBX source.
- Construction Site Vol. 1/2 — recovered source from Unity packages.

## Manifest-only / not actually downloaded

The following UE-format products have Fab metadata/manifests but **no local payload path**. They cannot be recovered from disk because their asset data never completed downloading:

- Landscape Material | MW Landscape Auto Material — ~0.69 GB advertised payload.
- Modular Industrial Pipe Set — ~0.22 GB.
- Warning Signs Decals Vol. 1 — ~2.22 GB.
- Garage — ~1.65 GB.
- City Street Props — ~5.73 GB.
- Free Sample Warehouse & Storage Vol. 01 — ~0.58 GB.
- Industry Props Pack 6 — ~0.18 GB.
- Street Props Pack Vol. 1 — ~1.45 GB.
- Street Props Pack Vol. 2 — ~1.04 GB.
- Vehicle Variety Pack — ~1.37 GB.
- City Sample Vehicles — ~7.40 GB.
- City Sample Buildings — ~14.29 GB.
- Soul: City / Soul: Cave and several other reserve environments.

Do not mistake these manifest stubs for completed downloads.

## Retry rule

After Epic Online Services is stable:

1. add **one UE-only product at a time** to `ScrapStage56`,
2. verify real `.uasset` files appear under its Content folder,
3. inspect/curate,
4. migrate only the approved subset to Scrapline,
5. remove the staged source pack before starting another large UE-only install.

Priority retry order:
1. MW Landscape Auto Material,
2. Modular Industrial Pipe Set,
3. Warning Signs Decals,
4. Garage,
5. only then City Street Props if the live asset gap still justifies its size.

Do not re-download assets already recovered above.