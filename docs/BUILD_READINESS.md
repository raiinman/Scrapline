# Scrapline — Build Readiness

## Current State

Scrapline is **design-frozen, asset-complete, physical-fit verified, and gameplay-integration complete**.

The map design, spatial contract, gameplay baseline, terrain specification, toolchain, production asset pool, real-asset reference pass, physical-fit gate, gameplay/device package, and Astra confusion audit are locked or verified. The asset manifest is frozen and the intake stop rule has fired. The first-alpha gameplay implementation is resolved as native-device only and the live UEFN Verse build is clean with no production custom Verse files. Astra one-shot construction remains gated on explicit user authorization.

## Ready

- UEFN project exists and opens correctly.
- Lore is enabled and preserved.
- Root and documentation DOX contracts are present locally and in GitHub.
- Epic UEFN MCP is configured and verified.
- Trashbyrd UEFN Power Tools bridge is installed and verified.
- Omni-Verse is installed, authenticated, and the VS Code workspace is trusted.
- UEFN Central Studio/Omni-Verse tooling was evaluated for the integration phase; the current Project Generator path is authenticated-web only and was not bypassed. Native UEFN devices eliminated the need for generated custom Verse.
- Macro map layout is locked.
- `SPATIAL_CONTRACT.md` freezes major anchor positions/orientations, route topology, verticality/catwalk limits, spawn-region distribution, outer-flank behavior, and the daylight concept.
- `ASTRA_CONFUSION_AUDIT.md` records the ambiguity attack and confirms stale hero/lighting/selection flexibility has been removed from the handoff set.
- Terrain/environment specification is locked.
- First-alpha FFA gameplay baseline is locked.
- 14 approved Fab referenced-content items are present.
- Existing direct/modifiable Fab content is present under `Content/Fab`.
- African Slate Quarry is curated and verified.
- Scrapline terrain heightmap v1 is staged under `Resources/Terrain/`.
- LookoutTower is removed/blacklisted.
- Warehouse Essentials is quarantined and excluded from required coverage.
- Final donor curation is complete.
- `ASSET_MANIFEST.md` is **Frozen for One-Shot**.
- `ENVIRONMENT_COMPOSITION_BOARD.md` maps the frozen kit to district, traversal, and atmosphere roles.
- `REAL_ASSET_VISUAL_STUDIES.md` records the grounded real-asset visual pass and read-only referenced-content rule.
- Exact staged visual captures cover the frozen Factory, Vehicle V2, Garage, Pipe, and Warning Sign choices.
- Representative live UEFN captures cover Scrapyard and Deserted Props referenced-content vocabulary.
- Talisman / Deserted VFX systems are inventoried through live Niagara browse and represented with real-source reference media.
- Hero landmark is frozen to the Factory crane composition, now understood as a long horizontal industrial gantry assembly rather than a tall skyline crane.
- Read-only physical-fit verification is complete for the Factory crane assembly, Garage assembly, Box Truck, Campervan, Factory containers, and representative metal/wood Scrapyard catwalk modules. Live UEFN and UE 5.6 staged measurements matched exactly for the curated imported meshes.

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
- Read-only badges on Fab Referenced Content are expected source-lock behavior, not an asset failure. Those assets remain valid for placement.
- Exact native gameplay wiring is finalized in `VERSE_GAMEPLAY_INTEGRATION.md` and embedded in `ONE_SHOT_PROMPT_DRAFT.md`.
- Current live device catalog confirmed Player Spawn Pad, Item Granter, and Tracker identities.
- Optional local siphon Verse candidate was removed after native `Health Granted on Elimination = 50` was validated as the simpler supported path.

## Asset Intake — Closed

No required category remains weak.

Do not import Junkyard, City Street Props, Construction Site, Wasteland, Dark Ruins, or other reserves merely because they are available. They remain reserve sources only.

The intake may reopen only for a specific demonstrated implementation failure.

## Gameplay Integration — Complete

The work defined in `VERSE_GAMEPLAY_INTEGRATION.md` is complete.

Validated first-alpha architecture:
- Island Settings owns match structure, spawning rules, health/shields, movement, destruction, ammo/drop behavior, 50-point elimination sustain, and the authoritative 30-elimination / 10-minute end conditions.
- 19 native Player Spawn Pads own spawn selection inside the frozen regions.
- one `IG_Loadout` Item Granter grants the fixed three-weapon loadout on every spawn.
- one `TR_Eliminations` Tracker displays individual 0/30 elimination progress and assigns to JIP players.
- production custom Verse: **none**.
- `@editable` wiring: **none**.
- live UEFN `VerseToolset.BuildAll` after removing the redundant siphon candidate: **0 diagnostics**.

Still gated:
- Astra one-shot environment construction,
- irreversible map construction,
- new asset acquisition or bulk reserve import,
- synthetic image generation,
- redesign of the frozen spatial contract.

## Remaining Build Gates

### Pre-Astra gate
1. Final contradiction/confusion closeout against `SPATIAL_CONTRACT.md`: **PASS**.
2. Stop and obtain explicit user authorization for the one-shot.

### After explicit Astra one-shot authorization
1. Run the primary construction pass.
2. Test and repair after the primary construction pass unless blocked earlier.

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
- controlled verticality budget
- LookoutTower rejection

## Immediate Next Step

**STOP before construction.**

Scrapline is ready for explicit user authorization of the Astra one-shot. Do not begin construction automatically.
