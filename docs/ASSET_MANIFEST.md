# Scrapline — Asset Manifest

## Status

Asset research is substantially complete. The first referenced-content wave and several modifiable Fab packs are now in Scrapline and verified by tooling, but the manifest is **not frozen** because the larger reserve/donor pool has not yet been selectively finalized.

Only assets verified by the live Scrapline project may be treated as implementation-ready.

## Live Scrapline Asset Audit

The project now contains **14 approved Fab reference files**. The previously mounted OldWest Vol. 6 reference was removed from the active project during housekeeping because it was outside the approved art direction.

Verified mounted references:
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

A clean project reopen previously completed with the approved reference wave loading successfully and without LookoutTower. Native asset search confirms mounted production content from the Scrapyard, rubble, barricade, electrical, junkyard, and mine-cart references.

## Visual Authority

### Post-Apocalyptic Scrapyard Pack

- Source: Fab
- URL: https://www.fab.com/listings/c584020d-fcae-453d-b496-fce46d90c97b
- Status: **Approved / mounted and verified in Scrapline**
- Role: primary environment kit
- Intended use: scrapyard architecture, rusted industrial structures, cover, elevation pieces, junkyard dressing, and large visual anchors.

Everything else must visually belong beside this pack.

## Rejected / Removed from Active Project

### LookoutTower

- Verse path: `/tj_v@fortnite.com/LookoutTower`
- Project reference previously created: `References/LookoutTower_de8fd42e20af5226830d2090e3182367.uref`
- Status: **Rejected / removed from Scrapline**
- Reason: adding the referenced content caused UEFN to load hundreds of GameFeature plugins, repeatedly rebuild Verse digests, consume large amounts of memory, and produce `GameFeaturePlugin.StateMachine.Canceled` failures.
- Recovery: the `.uref` was removed from the Scrapline project and quarantined outside the project. The generated Verse/workspace cache was rebuilt cleanly.
- Rule: **Do not add LookoutTower back to Scrapline unless its packaging changes and it is explicitly re-tested in an isolated project first.**

### OldWest Vol. 6

- Status: **Removed from active Scrapline reference set / quarantined outside the project**
- Reason: not required by the locked visual direction and generated substantial Content Browser alias noise.
- Rule: only restore it if a specific generic industrial asset is proven necessary and cannot be sourced from the approved pool.

## Mounted Easy-Import Wave

The original direct/easy-import queue is complete. All planned items from that wave are mounted in the live Scrapline project and load successfully.

This gives the one-shot immediate access to:
- the full Art Bully scrapyard visual family,
- barriers and fencing,
- rubble and broken concrete,
- industrial junkyard details,
- electrical/utility dressing,
- mine/salvage props,
- two VFX families,
- Deserted industrial props.

Do not add more individual one-off Fab assets unless a specific design gap remains after the bulk reserve is evaluated.

## Claimed Fab Reserve Pool

The user explicitly confirmed adding the following larger free/bulk Fab packs to the Fab Library. These are **owned/claimed**, not yet all mounted in Scrapline.

High-value reserve:
- Junkyard — 96-asset Quixel junkyard collection
- Factory Environment Collection
- Factory Pack Vol. 1
- City Street Props
- Modular Industrial Pipe Set
- City Sample Buildings
- City Sample Vehicles
- Quixel Warehouse
- Garage
- Unfinished Building
- Old Mine
- Derelict Corridor Megascans Sample

Vehicles:
- Abandoned & Junk Car
- Doomsday Pickup Truck
- Vehicle Variety Pack
- Vehicle Variety Pack Volume 2
- City Sample Vehicles

Industrial / construction / warehouse:
- Wasteland Props — Free Pack
- Industry Props Pack 6
- Street Props Pack Vol. 1
- Street Props Pack Vol. 2
- Mega Street Props Pack
- Construction Site VOL. 1 — Supply and Material Props
- Construction Site VOL. 2 — Tools, Parts, and Machine Props
- Free Sample Warehouse & Storage Vol. 01
- Warehouse Essentials Pack
- Power Generator
- FREE Post Apocalypse Survivor Environment Kitbash Set

Debris / dressing / signage:
- Warning Signs Decals Vol. 1
- Rubble Pack
- Industrial Rubble
- Urban Garbage and Debris
- Gas Cylinder 03 — Propane Tank
- London Street Props (Free)

Several reserve packs use Unreal Engine project/FBX delivery rather than direct UEFN referenced content. They remain optional reserves: add only the bulk packs that import cleanly and fill a real gap in vehicles, machinery, architecture, pipes, signage, or debris.

## Local Modifiable Fab Content

The following packs are physically present under `Content/Fab` and were confirmed by the project asset sweep:

- Abandoned Junk Car — 9 project files, about 57.9 MB.
- Gas Cylinder 03 / Propane Tank — 5 project files, about 308.6 MB.
- Industrial Rubble — 5 project files, about 4.9 MB.
- Rubble Pack — 5 project files, about 6.3 MB.
- Warehouse Essentials Pack — 21 project files, about 52.7 MB.

The live project-only sweep currently sees 58 assets total. Several production assets are marked `likely_unused` because construction has not started; do not treat that as permission to delete them before the one-shot.

## Curated FBX Content

### African Slate Quarry

- Source: Fab / Quixel Megascans
- URL: https://www.fab.com/listings/578d0ceb-5ccb-425f-abd5-e791a21551b6
- Status: **High-quality source preserved / 18-asset production subset imported and verified**
- Source package: approximately 1.62 GB extracted, 82 source asset folders, 129 FBX files including supplied variations/LODs, and 752 JPG textures.
- Production destination: `/Scrapline/Imported/AfricanSlateQuarry/Curated/`.
- Imported production content: **18 meshes + 18 material instances + 72 selected 4K texture maps**.
- Curated project footprint: approximately **155.7 MB**.
- Every curated mesh uses the verified `M_ASQ_Master` BaseColor/Normal/Roughness/AO material workflow.
- All 18 meshes were individually verified with a material slot, all four texture parameters populated, and Nanite enabled.
- Conservative convex collision was generated for the curated meshes.
- Temporary selection-scan and pilot assets were deleted after verification.
- The High/4K Fab source remains outside Scrapline so shipping resolution can be reduced later without losing source quality.

Curated roles:

**Ground / gravel / low breakup**
- `ASQ_xb5ebhf`
- `ASQ_xb5gfgm`
- `ASQ_xbnhajp`
- `ASQ_xbtefbk`
- `ASQ_xbtgah3`

**Medium boulders / slate / fractured rock**
- `ASQ_xb5gbjo`
- `ASQ_xbkgcc1`
- `ASQ_xbkgdbu`
- `ASQ_xbkndhe`
- `ASQ_xblhegj`
- `ASQ_xbrgfjp`
- `ASQ_xckjajs`

**Large ledges / cliffs / vertical rock**
- `ASQ_xbnjbc3`
- `ASQ_xbrdfck`
- `ASQ_xcdeajb`
- `ASQ_xcghcfe`
- `ASQ_xckifaf`
- `ASQ_xckjagi`

Intended use: perimeter earthwork, quarry cuts, drainage/service-road transitions, industrial excavation dressing, sightline termination, and selective natural breakup around the scrapyard. These assets supplement the Art Bully visual authority; they do not redefine Scrapline as a wilderness map.

## Required Asset Families Before Freeze

The one-shot needs enough verified in-project choices for:

- primary rusty scrapyard architecture,
- wrecks / vehicle forms,
- fencing and barriers,
- containers / loading-yard props,
- heavy machinery / power infrastructure,
- concrete/rubble,
- utility/electrical props,
- signage/detail,
- restrained ambient VFX,
- one strong industrial centerpiece class.

The exact hero asset remains unlocked until the live asset inventory can compare real candidates.

## Freeze Procedure

Before the Codex one-shot:

1. Keep the mounted easy-import wave intact and do not re-add LookoutTower.
2. Evaluate the live mounted pool against the required asset families.
3. Add only the highest-value bulk reserve packs needed to fill weak families.
4. Re-run live asset inventory after each bulk addition.
5. Confirm usable asset families and their actual project-visible asset paths.
6. Select the central hero landmark from assets actually present.
7. Mark this manifest **Frozen for One-Shot**.

## Hard Rule

Codex must not silently replace a missing environment family with visible primitive geometry.

If a required production asset is absent, it must either:
- select another verified production asset already present,
- use a built-in Fortnite/UEFN production asset that fits the style,
- or report the specific missing dependency rather than fabricating a greybox substitute.