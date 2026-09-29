# Scrapline — Build Readiness

## Current State

Scrapline is **design-frozen, asset-complete, physical-fit verified, with Feature Freeze v2 gameplay validation reopened**.

The map design, spatial contract, terrain specification, toolchain, production asset pool, real-asset reference pass, physical-fit gate, and original UEFN Central comparison remain locked or verified. The asset manifest is frozen and the intake stop rule has fired.

The user has added the Scrapline Armory / match economy before construction. Its design is frozen in `ARMORY_ECONOMY_SPEC.md`, but the new custom Armory Verse/device package has **not yet passed live UEFN validation**. The previous native-only build remains the control case; it is no longer the final gameplay package.

Astra one-shot construction is blocked until the Armory implementation validates and the final contradiction/confusion audit returns to PASS.

## Ready

- UEFN project exists and opens correctly.
- Lore is enabled and preserved.
- Root and documentation DOX contracts are present locally and in GitHub.
- Epic UEFN MCP is configured and verified.
- Trashbyrd UEFN Power Tools bridge is installed and verified.
- Omni-Verse is installed, authenticated, and the VS Code workspace is trusted.
- UEFN Central Project Generator was run through the authenticated browser as agreed. Its successful five-file result was marked **Not validated**, fully captured in `UEFN_CENTRAL_GENERATOR_RESULT.md`, and rejected after comparison with the native control. It remains quarantined and is not the Armory implementation base.
- Macro map layout is locked.
- `SPATIAL_CONTRACT.md` freezes major anchor positions/orientations, route topology, verticality/catwalk limits, spawn-region distribution, outer-flank behavior, and the daylight concept.
- `ASTRA_CONFUSION_AUDIT.md` preserves the passed spatial/design ambiguity audit but is temporarily reopened for gameplay because Feature Freeze v2 changed the loadout/economy architecture.
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
- The original native gameplay wiring remains a validated control in `VERSE_GAMEPLAY_INTEGRATION.md`. The Armory replacement wiring is frozen in design but still pending live UEFN validation before it can become final.
- Current live device catalog confirmed Player Spawn Pad, Item Granter, and Tracker identities.
- Optional local siphon Verse candidate was removed after native `Health Granted on Elimination = 50` was validated as the simpler supported path.
- UEFN Central run `6e9b9891-1848-5b65-8289-50521fc26c9b` completed but was marked **Not validated**; its five generated files were audited and quarantined rather than staged into Scrapline.
- Feature Freeze v2 Armory core candidate now exists as one Verse file and passes live `ValkyrieToolset.VerseToolset.BuildAll` with **0 diagnostics** after repairing initial effect-context errors. UI/cart interaction and runtime device wiring/tests remain pending.

## Asset Intake — Closed

No required category remains weak.

Do not import Junkyard, City Street Props, Construction Site, Wasteland, Dark Ruins, or other reserves merely because they are available. They remain reserve sources only.

The intake may reopen only for a specific demonstrated implementation failure.

## Gameplay Integration — Reopened for Armory

The original native control is validated, but Feature Freeze v2 intentionally reopened gameplay integration.

Frozen candidate architecture:
- Island Settings owns native scoring, first-to-30 victory, 10:45 total round clock, spawning rules, health/shields, movement, destruction, ammo/drop behavior, and 50-point elimination sustain.
- 19 Player Spawn Pads continue to own native spawn selection.
- one `TR_Eliminations` Tracker remains HUD-only.
- one `IG_Armory` Item Granter backs the editor-configurable weapon catalog.
- one `EM_Economy` Elimination Manager provides eliminator/eliminated events only.
- one `scrapline_armory_device` custom Verse layer owns only the Armory/economy boundary from `ARMORY_ECONOMY_SPEC.md`.
- no End Game device or match-authority Timer is introduced.

Still gated:
- Armory live compiler/runtime validation,
- exact first-release catalog/index lock,
- post-Armory contradiction/confusion closeout,
- Astra one-shot environment construction,
- irreversible map construction,
- new asset acquisition or bulk reserve import,
- synthetic image generation,
- redesign of the frozen spatial contract.

## Remaining Build Gates

### Pre-Astra gate
1. Implement the smallest Armory candidate.
2. Live UEFN `ValkyrieToolset.VerseToolset.BuildAll`: **must pass with zero accepted-code diagnostics**.
3. Run the critical economy/lifecycle matrix in `ARMORY_ECONOMY_SPEC.md`.
4. Lock exact catalog Item Granter indexes and editor wiring.
5. Update the one-shot prompt with verified reality.
6. Final contradiction/confusion closeout: **must return to PASS**.
7. Stop and obtain explicit user authorization for the one-shot.

### After explicit Astra one-shot authorization
1. Run the primary construction pass.
2. Test and repair after the primary construction pass unless blocked earlier.

## Do Not Reopen Without a Specific Reason

- overall 140 m x 140 m playable footprint
- 12-player primary FFA target
- 16-player test ceiling
- four overlapping industrial districts plus central kill yard
- 30-elimination / approximately 10-minute combat baseline, preceded by the frozen 45-second Armory phase
- Factory crane central landmark direction
- frozen production asset pool
- asset-first visual construction rule
- no visible greybox substitute art
- controlled verticality budget
- LookoutTower rejection

## Immediate Next Step

**STOP before Astra construction.**

Implement and live-validate the frozen Armory/economy package first. The Astra one-shot is not authorization-ready again until that gate and the final confusion audit pass.
