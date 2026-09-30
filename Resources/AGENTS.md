# Resources DOX

## Purpose

Own non-code build resources that must travel with the Scrapline repository so an implementation worker does not have to reconstruct them from a machine-local workspace.

## Ownership

This folder owns:
- approved real-source visual reference boards and contact sheets,
- frozen terrain input files,
- provenance/index files that explain how those resources may be used.
- construction placement plans and live verification exports, distinguished from pending requested settings.

## Local Contracts

- `Reference/RealAssets/` is visual authority for art direction, asset silhouette, district composition language, material/color vocabulary, clutter density, VFX restraint, and approved signage.
- Old Reference/RealAssets boards describe asset appearance/history. FreshBuild/QuarryCut and docs/fresh-build/quarry-cut/DESIGN_SPEC.md own the new reference/layout package; old SPATIAL_CONTRACT does not constrain the fresh rebuild.
- Composition studies are exploratory arrangements built from approved real assets. They are not final map layout.
- Official Fab gallery images are pack-level context only. Exact UAsset/contact-sheet evidence outranks pack marketing media for asset-specific decisions.
- Synthetic/generated lookalikes are not part of this authority set.
- Placement plans are audit evidence, not replay scripts. Effective live readbacks outrank requested values; superseded transforms must be identified rather than silently treated as verified.
- Terrain/Scrapline_Terrain_v1_253x253_16bit.png is historical. FreshBuild/QuarryCut/QuarryCut_253_16bit.png plus terrain_import.json are the fresh inputs.

## Work Guidance

- Before environment construction, inspect the committed visual index and the mandatory boards named in `docs/fresh-build/quarry-cut/SOL61_GAUNTLET.md`.
- Actually open the images; do not infer their content from filenames or prose summaries alone.
- Fresh DESIGN_SPEC controls layout and retained gameplay contracts control behavior; report material visual conflicts.
- Keep this folder lean. Commit curated reference boards and required build inputs, not every redundant raw staging screenshot.

## Verification

- Confirm every mandatory visual named by the active one-shot prompt exists in GitHub on the active branch.
- Confirm the fresh terrain input and any measured refinement derivatives exist and match their documented hashes.
- Confirm no generated/synthetic concept art is introduced as visual authority.

## Child DOX Index

- `FreshBuild/QuarryCut/AGENTS.md` — owns the new real-asset camera renders, boards, native evidence and independent terrain inputs.

