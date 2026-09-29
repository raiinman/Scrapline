# Scrapline — Build Readiness

## Current State

Scrapline is in **final pre-build preparation**.

The map design, gameplay baseline, terrain specification, toolchain, and first production-asset wave are established. The remaining work is asset curation/freeze, Verse generation, and the final Codex one-shot handoff.

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

## Current Local Modifiable Asset Packs

Verified under `Content/Fab`:

- Abandoned Junk Car — 9 project files, about 57.9 MB.
- Gas Cylinder 03 / Propane Tank — 5 project files, about 308.6 MB.
- Industrial Rubble — 5 project files, about 4.9 MB.
- Rubble Pack — 5 project files, about 6.3 MB.
- Warehouse Essentials Pack — 21 project files, about 52.7 MB.

Before Quarry curation, Power Tools saw 58 project assets. After curation, the project contains **166 Content .uasset files / about 586.2 MB of Content**. A full post-curation Power Tools asset sweep exceeded the bridge's 30-second response window, so final verification used targeted live checks for all 18 Quarry meshes plus filesystem/package counts. Several production assets may still appear unused until level construction begins; that is not a cleanup signal.

## In Progress

- Full Fab library audit complete: 160 owned products / 77 3D.
- Asset recovery pass complete for the stalled intake wave: Wasteland is recovered as a UE donor, Construction Site Vol. 1/2 source is extracted, and `ScrapStage56` is repaired as a local one-pack-at-a-time staging project.
- Final staging wave is defined in `FAB_LIBRARY_AUDIT.md`; manifest-only UE products are tracked in `ASSET_RECOVERY.md` and must not be counted as downloaded until real payload files exist.

## Remaining Build Gates

1. Fill any weak asset families: vehicles/wrecks, heavy machinery/power, loading/warehouse architecture, pipes, signage, and hero landmark candidates.
2. Re-scan the final project-visible asset pool.
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

Run the **final staging wave** from `FAB_LIBRARY_AUDIT.md` rather than continuing broad asset hunting.

Start with the highest-leverage content that is already real on disk:
1. Junkyard.
2. Factory Environment Collection.
3. Recovered Construction Site VOL. 2 FBX source.
4. Wasteland Props recovered donor.
5. Vehicle Variety Pack Volume 2.
6. Selective Unfinished Building / Old Mine / Dark Ruins / Derelict Corridor / Post Apocalypse Kitbash sources.

After Epic Online Services is stable, retry only the missing UE-only payloads through `ScrapStage56` one pack at a time:
7. MW Landscape Auto Material.
8. Modular Industrial Pipe Set.
9. Warning Signs Decals Vol. 1.
10. Garage.
11. City Street Props only if the live gap still justifies its size.

Then re-scan live UEFN, select the hero landmark, freeze the manifest, and stop asset acquisition.