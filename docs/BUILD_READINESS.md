# Scrapline — Build Readiness

## Current State

Scrapline is **ready to move from asset preparation into Verse/final one-shot handoff work**.

The map design, gameplay baseline, terrain specification, toolchain, and production asset pool are locked or verified. The asset manifest is frozen and the intake stop rule has fired.

## Ready

- UEFN project exists and opens correctly.
- Lore is enabled and preserved.
- Root and documentation DOX contracts are present locally and in GitHub.
- Epic UEFN MCP is configured and verified.
- Trashbyrd UEFN Power Tools bridge is installed and verified.
- Omni-Verse is installed, authenticated, and the VS Code workspace is trusted.
- UEFN Central Studio access is available.
- Macro map layout is locked.
- Terrain/environment specification is locked.
- First-alpha FFA gameplay baseline is locked.
- 14 approved Fab referenced-content items are present.
- Existing direct/modifiable Fab content is present under `Content/Fab`.
- African Slate Quarry is curated and verified.
- Scrapline terrain heightmap v1 is staged under `Resources/Terrain/`.
- LookoutTower is removed/blacklisted.
- Final donor curation is complete.
- `ASSET_MANIFEST.md` is **Frozen for One-Shot**.
- Hero landmark is frozen to the Factory crane composition.

## Final Curated Live Imports

### Factory Environment Collection

`/Scrapline/Imported/FactoryCurated/`

Verified live:
- **121 assets**
- **14 StaticMeshes**
- approximately **604 MB**

Includes crane, recycling machine, engine/container, forklift, assembly-line parts, containers, electrical panel, and switchboard.

### Vehicle Variety Pack Volume 2

`/Scrapline/Imported/VehicleVarietyV2Curated/`

Verified live:
- **71 assets**
- **2 StaticMeshes**

Selected:
- Box Truck
- Campervan

### Garage

`/Scrapline/Imported/GarageSource/`

Verified live:
- **61 assets**
- **12 StaticMeshes**

Selected workshop/structure kit includes garage shell/roof, workbench, shelves, cart, pallet, stairs, railings, industrial light, ventilation, and wheel.

The donor's broken ThirdPerson demo Blueprints were not migrated.

### Modular Industrial Pipe Set

`/Scrapline/Imported/IndustrialPipesSource/`

Verified live:
- **32 assets**
- **28 StaticMeshes**

This is the frozen modular pipe system.

### Warning Signs Decals Vol. 1

`/Scrapline/Imported/WarningSignsSource/`

Verified live:
- **52 assets**
- **12 selected MaterialInstanceConstants**

Only industrial hazard/directional/crash signage was promoted.

## Final UEFN Verification

Latest live checks:

- Project opens successfully.
- Map Check: **0 errors / 0 warnings**.
- Power Tools Project Health: **0 errors / 3 warnings**.
- Health scanner saw approximately **504 files / 2.60 GB**.
- The only warnings are three pre-existing oversized Gas Cylinder / Propane Tank texture files.
- Representative Factory, Vehicle, Garage, Pipe, and Warning Sign assets all load successfully through the UEFN Asset Registry/Power Tools bridge.

## Asset Intake — Closed

No required category remains weak.

Do not import Junkyard, City Street Props, Construction Site, Wasteland, Dark Ruins, or other reserves merely because they are available. They remain reserve sources only.

The intake may reopen only for a specific demonstrated implementation failure.

## Remaining Build Gates

1. Run the prepared UEFN Central Project Generator request.
2. Validate generated Verse with Omni-Verse / Epic compiler tooling.
3. Update the gameplay/device paths and wiring in `ONE_SHOT_PROMPT_DRAFT.md`.
4. Finalize the one-shot prompt against the frozen asset manifest.
5. Run the primary build pass.
6. Test and repair after the primary construction pass unless blocked earlier.

## Do Not Reopen Without a Specific Reason

- overall 140 m x 140 m playable footprint
- 12-player primary FFA target
- 16-player test ceiling
- four overlapping industrial districts plus central kill yard
- 30-elimination / 10-minute alpha baseline
- Factory crane central landmark direction
- frozen production asset pool
- asset-first visual construction rule
- no visible greybox substitute art
- LookoutTower rejection

## Immediate Next Step

**Verse generation and validation.**

The asset hunt is over. Do not spend one-shot time browsing Fab or staging more packs.
