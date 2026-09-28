# Scrapline

Scrapline is a compact post-apocalyptic free-for-all map for Unreal Editor for Fortnite (UEFN), built from curated Fab assets.

## Project Goal

Build a polished, immediately playable FFA arena in one focused implementation pass. The environment should feel authored from real production assets rather than greybox geometry.

## Core Direction

- Mode: Free For All
- Platform: UEFN / Fortnite
- Theme: dense post-apocalyptic scrapyard / industrial wasteland
- Target feel: fast combat, short downtime, strong landmarks, layered routes, controlled verticality
- Construction rule: prefer approved UEFN/Fab assets over primitive placeholder geometry or newly modeled substitutes

## Current Stage

Pre-production specification is nearly complete.

The macro map design and first-alpha gameplay baseline are locked, the UEFN/Codex toolchain is verified live, and the remaining pre-build work is to expose the claimed Fab asset pool to Scrapline, freeze the usable asset manifest, and assemble the final one-shot Codex build prompt.

## Documentation

- `docs/PROJECT_BRIEF.md` — product intent and non-negotiable build rules
- `docs/ASSET_MANIFEST.md` — approved asset sources and intended usage
- `docs/MAP_DESIGN.md` — locked macro combat-space and layout direction
- `docs/TERRAIN_ENVIRONMENT_SPEC.md` — implementation-facing terrain and environment plan
- `docs/GAMEPLAY_SPEC.md` — first-alpha FFA gameplay baseline
- `docs/UEFN_CENTRAL_PROMPT.md` — prepared Verse Project Generator request
- `docs/TOOLING.md` — approved Codex/UEFN build toolchain and activation checklist
- `AGENTS.md` — repository-wide DOX contract