# Scrapline — Asset Manifest

## Status

Asset research is substantially complete. The first referenced-content wave is now mounted in Scrapline and verified by the live editor, but the manifest is **not frozen** because the larger bulk Fab reserve has not yet been selectively added.

Only assets verified by the live Scrapline project may be treated as implementation-ready.

## Live Scrapline Asset Audit

The live editor currently loads **15 enabled Fab reference files**. Fourteen are useful/planned Scrapline content references; one is an unrelated Old West pack that should remain out of the final visual palette.

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
- OldWest Vol. 6 — mounted but **not approved for Scrapline art direction**

The clean project reopen completed with these references loading successfully and without LookoutTower. Native asset search confirms mounted production content from the Scrapyard, rubble, barricade, electrical, junkyard, mine-cart, and Old West references.

## Visual Authority

### Post-Apocalyptic Scrapyard Pack

- Source: Fab
- URL: https://www.fab.com/listings/c584020d-fcae-453d-b496-fce46d90c97b
- Status: **Approved / mounted and verified in Scrapline**
- Role: primary environment kit
- Intended use: scrapyard architecture, rusted industrial structures, cover, elevation pieces, junkyard dressing, and large visual anchors.

Everything else must visually belong beside this pack.

## Rejected / Do Not Re-Add

### LookoutTower

- Verse path: `/tj_v@fortnite.com/LookoutTower`
- Project reference previously created: `References/LookoutTower_de8fd42e20af5226830d2090e3182367.uref`
- Status: **Rejected / removed from Scrapline**
- Reason: adding the referenced content caused UEFN to load hundreds of GameFeature plugins, repeatedly rebuild Verse digests, consume large amounts of memory, and produce `GameFeaturePlugin.StateMachine.Canceled` failures.
- Recovery: the `.uref` was removed from the Scrapline project and quarantined outside the project. The generated Verse/workspace cache was rebuilt cleanly.
- Rule: **Do not add LookoutTower back to Scrapline unless its packaging changes and it is explicitly re-tested in an isolated project first.**

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

## FBX Import Pilot

### African Slate Quarry

- Source: Fab / Quixel Megascans
- URL: https://www.fab.com/listings/578d0ceb-5ccb-425f-abd5-e791a21551b6
- Status: **Downloaded High quality / import pilot verified / not yet bulk-approved**
- Source package observed on disk: High tier, approximately 1.62 GB extracted.
- Package inventory observed: 82 top-level asset folders, 129 FBX files including supplied LOD/variation files, and 752 JPG texture files.
- Fab listing advertises 82 assets with FBX + JPG and 1K/2K/4K/8K textures.
- Pilot mesh imported successfully to `/Scrapline/Imported/AfricanSlateQuarry/Pilot/ASQ_xb5ebhf`.
- Pilot verification: roughly 30,012 triangles at LOD0, 3 LODs detected, believable ~2.4 m local footprint, Nanite off by default.
- Important: FBX import created the mesh and a material slot but did **not** automatically wire the external texture maps. Bulk import therefore requires a controlled material/texture pipeline rather than blindly importing every FBX.
- Intended role: quarry rock, slate, gravel, cliff/terrain dressing, perimeter earthwork, and industrial excavation detail. It is supplemental environment dressing, not a replacement for the Art Bully scrapyard identity.

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