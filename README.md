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

**Design/asset/gameplay handoff frozen; GPT-6.1 Sol construction explicitly authorized. Active prompt: `docs/SOL61_ONE_SHOT_PROMPT.md`.**

The macro map design, spatial skeleton, terrain specification, first-alpha gameplay baseline, implementation toolchain, production environment kit, grounded real-asset visual pass, physical-fit verification, and gameplay-device package are locked or verified. `SPATIAL_CONTRACT.md` freezes major anchors, orientation, routes, verticality, spawn regions, and lighting intent.

The native gameplay package remains the control for spawn selection, scoring, match end, sustain, movement, and destruction. Feature Freeze v2 adds a narrow compile-clean Armory Verse layer plus the `WBP_ScraplineArmory` UMG scaffold for match-local Scrap, adaptive per-life loadouts, JIP buy handling, and a scalable seasonal catalog. Final Armory visual polish and full lifecycle/multiplayer acceptance testing are explicitly deferred to Astra during the real construction/post-build pass. The rejected UEFN Central five-file package remains evidence only. Astra does not start automatically; explicit user authorization is required.

## Documentation

- `docs/PROJECT_BRIEF.md` — product intent and non-negotiable build rules
- `docs/ASSET_MANIFEST.md` — **frozen** approved asset sources and implementation-visible paths
- `docs/ASSET_GAP_MATRIX.md` — final required-family coverage and closed intake decision
- `docs/VERSE_GAMEPLAY_INTEGRATION.md` — **native authority + Armory Verse integration contract, device wiring, and compiler record**
- `docs/ARMORY_ECONOMY_SPEC.md` — frozen Scrap economy and lifecycle contract
- `docs/ARMORY_UI_SPEC.md` — approved scalable Armory UX and Astra presentation task
- `docs/SPATIAL_CONTRACT.md` — **frozen one-shot spatial skeleton and placement authority**
- `docs/ASTRA_CONFUSION_AUDIT.md` — ambiguity attack/closeout for the Astra handoff
- `docs/ENVIRONMENT_COMPOSITION_BOARD.md` — district-level real-asset art/composition guidance
- `docs/REAL_ASSET_VISUAL_STUDIES.md` — grounded visual-study findings and read-only referenced-content rule
- `docs/PHYSICAL_FIT_VERIFICATION.md` — verified local bounds, collision, LOD/Nanite, gameplay fit, and restrictions
- `docs/MAP_DESIGN.md` — locked macro combat-space and layout direction
- `docs/TERRAIN_ENVIRONMENT_SPEC.md` — implementation-facing terrain and environment plan
- `docs/GAMEPLAY_SPEC.md` — first-alpha FFA gameplay baseline
- `docs/UEFN_CENTRAL_GENERATOR_RESULT.md` — full completed Project Generator capture, independent audit, and rejection decision
- `docs/UEFN_CENTRAL_PROMPT.md` — exact generator request/control overlay retained for provenance and future gap-specific reuse
- `docs/TOOLING.md` — approved Codex/UEFN build toolchain and activation checklist
- `docs/ASSET_PIPELINE.md` — referenced/FBX/donor-project intake workflow and safety rules
- `docs/FAB_LIBRARY_AUDIT.md` — 160-product ownership audit and final intake disposition
- `docs/ASSET_RECOVERY.md` — recovered Fab payloads and repaired UE 5.6 staging workflow
- `docs/BUILD_READINESS.md` — current pre-Astra readiness snapshot
- `docs/ONE_SHOT_PROMPT_DRAFT.md` — hardened Astra handoff, ready for explicit one-shot authorization
- `AGENTS.md` — repository-wide DOX contract
