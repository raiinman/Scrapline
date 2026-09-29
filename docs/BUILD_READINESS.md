# Scrapline — Build Readiness

## Current State

Scrapline is in **final pre-build preparation**.

The map design, gameplay baseline, terrain specification, toolchain, and first production-asset wave are established. The priority UE-only Fab retry wave has now completed successfully. The remaining work is selective asset curation/migration, live-project verification/freeze, Verse generation, and the final Codex one-shot handoff.

## Ready

- UEFN project exists and opens correctly.
- Lore is enabled and preserved.
- Root and documentation DOX contracts are present locally and in GitHub.
- Epic UEFN MCP is configured and verified.
- Trashbyrd UEFN Power Tools is installed and verified.
- Omni-Verse is installed, authenticated, and the VS Code workspace is trusted.
- UEFN Central Studio access is available.
- Macro map layout is locked.
- Terrain/environment specification is locked.
- First-alpha FFA gameplay baseline is locked.
- 14 approved Fab referenced-content items are present in the project reference set.
- Direct/modifiable Fab content is present under `Content/Fab`.
- African Slate Quarry High-quality source is preserved and an 18-mesh / 18-material / 72-texture curated production subset is imported and individually verified.
- Scrapline terrain heightmap v1 is generated and staged under `Resources/Terrain/` for import review.
- LookoutTower has been removed and blacklisted.
- Generated Python cache and the obsolete pilot import material have been cleaned up.
- The repaired UE 5.6 ScrapStage56 receiver successfully completed the priority retry wave for MW Landscape, Modular Industrial Pipes, Warning Signs, Garage, and City Street Props.

## Current Local Modifiable Asset Packs

Verified under `Content/Fab` in the live Scrapline project:

- Abandoned Junk Car — 9 project files, about 57.9 MB.
- Gas Cylinder 03 / Propane Tank — 5 project files, about 308.6 MB.
- Industrial Rubble — 5 project files, about 4.9 MB.
- Rubble Pack — 5 project files, about 6.3 MB.
- Warehouse Essentials Pack — 21 project files, about 52.7 MB.

Before Quarry curation, Power Tools saw 58 project assets. After curation, the project contains **166 Content .uasset files / about 586.2 MB of Content**. A full post-curation Power Tools asset sweep exceeded the bridge's 30-second response window, so final verification used targeted live checks for all 18 Quarry meshes plus filesystem/package counts. Several production assets may still appear unused until level construction begins; that is not a cleanup signal.

## ScrapStage56 Intake State

The repaired staging receiver currently contains approximately **13.54 GB / 1,956 uassets** across these verified families:

- Wasteland Props — 268 uassets.
- MW Landscape Auto Material — 97 uassets.
- Modular Industrial Pipe Set — 42 uassets.
- Warning Signs Decals Vol. 1 — 243 uassets.
- Garage — 557 uassets.
- City Street Props — 749 uassets.

These assets are **staged donors**, not automatically approved live Scrapline content. Only selectively migrated and verified assets count toward the final manifest.

C: had approximately **33.25 GB free** at the latest verification. Avoid additional bulk UE-only downloads until the staged material has been curated and temporary bulk content can be cleared.

## In Progress

- Full Fab library audit complete: 160 owned products / 77 3D.
- Recovery work is complete for the original stalled intake wave.
- Final curation remains for the highest-value donor/source pools: Junkyard, Factory Environment Collection, recovered Construction Site Vol. 2, Wasteland Props, Vehicle Variety Pack Volume 2, Garage, Industrial Pipes, Warning Signs, and selective City Street Props.
- The live Scrapline project still needs a final project-visible asset scan after curation.

## Remaining Build Gates

1. Curate/migrate the strongest pieces needed for vehicles/wrecks, heavy machinery/power, loading/warehouse architecture, pipes, signage, workshop dressing, and hero-landmark candidates.
2. Re-scan the final live Scrapline project-visible asset pool.
3. Select the central hero landmark.
4. Mark `ASSET_MANIFEST.md` **Frozen for One-Shot**.
5. Run the prepared UEFN Central Project Generator prompt.
6. Validate generated Verse with Omni-Verse / Epic compiler tooling.
7. Finalize the existing `ONE_SHOT_PROMPT_DRAFT.md` with the frozen asset paths and validated Verse/device wiring.
8. Run the primary build pass.
9. Test and repair only after the primary construction pass unless blocked.

## Do Not Reopen Without a Specific Reason

- overall 140 m x 140 m playable footprint,
- 12-player primary FFA target,
- 16-player test ceiling,
- four overlapping industrial districts plus central kill yard,
- 30-elimination / 10-minute alpha baseline,
- asset-first visual construction rule,
- no visible greybox substitute art,
- LookoutTower rejection.

## Immediate Next Step

**Stop broad Fab downloading and curate what is already real on disk.**

Highest-leverage curation order:
1. Factory Environment Collection — machinery/crane/hero candidates.
2. Junkyard — salvage/wreckage expansion.
3. Garage — workshop/service-area dressing.
4. Recovered Construction Site VOL. 2 — tools, ladders, benches, machine props.
5. Modular Industrial Pipe Set — coherent pipe vocabulary.
6. Warning Signs Decals — authored signage polish.
7. Wasteland Props — rusty filler and small industrial dressing.
8. Vehicle Variety Pack Volume 2 — select only the strongest wreck/vehicle silhouettes.
9. City Street Props — cherry-pick utility/sign/barrier pieces; do not migrate all 749 assets.
10. Selective Unfinished Building / Old Mine / Dark Ruins / Derelict Corridor / Post Apocalypse Kitbash sources.

After that, re-scan live UEFN, select the hero landmark, freeze the manifest, and stop asset acquisition.
