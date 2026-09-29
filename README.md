# Scrapline

Scrapline is a compact post-apocalyptic free-for-all map for Unreal Editor for Fortnite (UEFN), built from a deliberately curated Fab/UEFN production-asset pool.

## Project Goal

Build a polished, immediately playable FFA arena in one focused implementation pass. The environment should feel authored from real production assets rather than greybox geometry.

## Core Direction

- Mode: Free For All
- Platform: UEFN / Fortnite
- Theme: dense post-apocalyptic scrapyard / industrial wasteland
- Target feel: fast combat, short downtime, strong landmarks, layered routes, controlled verticality
- Construction rule: prefer approved UEFN/Fab assets over primitive placeholder geometry or newly modeled substitutes

## Current Stage

**Design/asset freeze complete; Astra spatial contract hardened; pre-build hold active.**

The macro map design, spatial skeleton, terrain specification, first-alpha gameplay baseline, implementation toolchain, and production environment kit are locked or verified. The grounded real-asset visual pass and read-only physical-fit verification are complete. The Astra confusion audit removed stale design flexibility and `SPATIAL_CONTRACT.md` now freezes major anchors, orientation, routes, verticality, spawn regions, and lighting intent.

No map-design or asset-fit blocker remains. UEFN Central generation, Verse generation, the one-shot build, synthetic image generation, bulk reserve import, and irreversible map construction remain paused until the hold is explicitly lifted.

## Documentation

- `docs/PROJECT_BRIEF.md` — product intent and non-negotiable build rules
- `docs/ASSET_MANIFEST.md` — **frozen** approved asset sources and implementation-visible paths
- `docs/ASSET_GAP_MATRIX.md` — final required-family coverage and closed intake decision
- `docs/SPATIAL_CONTRACT.md` — **frozen one-shot spatial skeleton and placement authority**
- `docs/ASTRA_CONFUSION_AUDIT.md` — ambiguity attack/closeout for the Astra handoff
- `docs/ENVIRONMENT_COMPOSITION_BOARD.md` — district-level real-asset art/composition guidance
- `docs/REAL_ASSET_VISUAL_STUDIES.md` — grounded visual-study findings and read-only referenced-content rule
- `docs/PHYSICAL_FIT_VERIFICATION.md` — verified local bounds, collision, LOD/Nanite, gameplay fit, and restrictions
- `docs/MAP_DESIGN.md` — locked macro combat-space and layout direction
- `docs/TERRAIN_ENVIRONMENT_SPEC.md` — implementation-facing terrain and environment plan
- `docs/GAMEPLAY_SPEC.md` — first-alpha FFA gameplay baseline
- `docs/UEFN_CENTRAL_PROMPT.md` — prepared Verse Project Generator request, currently on hold
- `docs/TOOLING.md` — approved Codex/UEFN build toolchain and activation checklist
- `docs/ASSET_PIPELINE.md` — referenced/FBX/donor-project intake workflow and safety rules
- `docs/FAB_LIBRARY_AUDIT.md` — 160-product ownership audit and final intake disposition
- `docs/ASSET_RECOVERY.md` — recovered Fab payloads and repaired UE 5.6 staging workflow
- `docs/BUILD_READINESS.md` — current pre-build readiness snapshot
- `docs/ONE_SHOT_PROMPT_DRAFT.md` — finalize after the hold is lifted and generation/validation is permitted
- `AGENTS.md` — repository-wide DOX contract
