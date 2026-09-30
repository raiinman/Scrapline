# Resources DOX

## Purpose

Own non-code build resources that must travel with the Scrapline repository so an implementation worker does not have to reconstruct them from a machine-local workspace.

## Ownership

This folder owns:
- approved real-source visual reference boards and contact sheets,
- frozen terrain input files,
- provenance/index files that explain how those resources may be used.

## Local Contracts

- `Reference/RealAssets/` is visual authority for art direction, asset silhouette, district composition language, material/color vocabulary, clutter density, VFX restraint, and approved signage.
- Visual references do **not** override `docs/SPATIAL_CONTRACT.md` for coordinates, routes, spawn regions, major-anchor transforms, verticality, or gameplay geometry.
- Composition studies are exploratory arrangements built from approved real assets. They are not final map layout.
- Official Fab gallery images are pack-level context only. Exact UAsset/contact-sheet evidence outranks pack marketing media for asset-specific decisions.
- Synthetic/generated lookalikes are not part of this authority set.
- `Terrain/Scrapline_Terrain_v1_253x253_16bit.png` is the frozen terrain heightmap input referenced by the active one-shot prompt.

## Work Guidance

- Before environment construction, inspect the committed visual index and the mandatory boards named in `docs/SOL61_ONE_SHOT_PROMPT.md`.
- Actually open the images; do not infer their content from filenames or prose summaries alone.
- If an image conflicts with a frozen written spatial/gameplay contract, the written contract wins and the conflict must be reported.
- Keep this folder lean. Commit curated reference boards and required build inputs, not every redundant raw staging screenshot.

## Verification

- Confirm every mandatory visual named by the active one-shot prompt exists in GitHub on the active branch.
- Confirm the frozen terrain heightmap exists and matches the documented path.
- Confirm no generated/synthetic concept art is introduced as visual authority.

## Child DOX Index

No child DOX documents yet.
