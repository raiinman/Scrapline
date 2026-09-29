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
- African Slate Quarry High-quality source is downloaded and the full FBX + material pilot pipeline is verified.
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

Power Tools currently sees 58 project assets. Several are reported as `likely_unused` only because the level has not been built yet; that is not a cleanup signal at this stage.

## In Progress

- Unreal Engine 5.6 installation for older Fab donor projects.
- Dark Ruins Megascans Sample donor-project creation.
- Selective evaluation of the remaining Fab reserve pool.
- Bulk selection/import of useful African Slate Quarry assets.

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

Finish the UE 5.6 donor setup, inspect Dark Ruins rather than migrating it wholesale, then perform one final asset-family gap check before freezing the manifest.