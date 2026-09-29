# DOX framework

- DOX is highly performant AGENTS.md hierarchy installed here
- Agent must follow DOX instructions across any edits

## Core Contract

- AGENTS.md files are binding work contracts for their subtrees
- Work products, source materials, instructions, records, assets, and durable docs must stay understandable from the nearest applicable AGENTS.md plus every parent AGENTS.md above it

## Read Before Editing

1. Read the root AGENTS.md
2. Identify every file or folder you expect to touch
3. Walk from the repository root to each target path
4. Read every AGENTS.md found along each route
5. If a parent AGENTS.md lists a child AGENTS.md whose scope contains the path, read that child and continue from there
6. Use the nearest AGENTS.md as the local contract and parent docs for repo-wide rules
7. If docs conflict, the closer doc controls local work details, but no child doc may weaken DOX

Do not rely on memory. Re-read the applicable DOX chain in the current session before editing.

## Update After Editing

Every meaningful change requires a DOX pass before the task is done.

Update the closest owning AGENTS.md when a change affects:

- purpose, scope, ownership, or responsibilities
- durable structure, contracts, workflows, or operating rules
- required inputs, outputs, permissions, constraints, side effects, or artifacts
- user preferences about behavior, communication, process, organization, or quality
- AGENTS.md creation, deletion, move, rename, or index contents

Update parent docs when parent-level structure, ownership, workflow, or child index changes. Update child docs when parent changes alter local rules. Remove stale or contradictory text immediately. Small edits that do not change behavior or contracts may leave docs unchanged, but the DOX pass still must happen.

## Hierarchy

- Root AGENTS.md is the DOX rail: project-wide instructions, global preferences, durable workflow rules, and the top-level Child DOX Index
- Child AGENTS.md files own domain-specific instructions and their own Child DOX Index
- Each parent explains what its direct children cover and what stays owned by the parent
- The closer a doc is to the work, the more specific and practical it must be

## Child Doc Shape

- Create a child AGENTS.md when a folder becomes a durable boundary with its own purpose, rules, responsibilities, workflow, materials, or quality standards
- Work Guidance must reflect the current standards of the project or user instructions; if there are no specific standards or instructions yet, leave it empty
- Verification must reflect an existing check; if no verification framework exists yet, leave it empty and update it when one exists

Default section order:
- Purpose
- Ownership
- Local Contracts
- Work Guidance
- Verification
- Child DOX Index

## Style

- Keep docs concise, current, and operational
- Document stable contracts, not diary entries
- Put broad rules in parent docs and concrete details in child docs
- Prefer direct bullets with explicit names
- Do not duplicate rules across many files unless each scope needs a local version
- Delete stale notes instead of explaining history
- Trim obvious statements, repeated rules, misplaced detail, and warnings for risks that no longer exist

## Closeout

1. Re-check changed paths against the DOX chain
2. Update nearest owning docs and any affected parents or children
3. Refresh every affected Child DOX Index
4. Remove stale or contradictory text
5. Run existing verification when relevant
6. Report any docs intentionally left unchanged and why

## User Preferences

When the user requests a durable behavior change, record it here or in the relevant child AGENTS.md

## Scrapline UEFN Execution Contract

- This local UEFN project is the implementation workspace for Scrapline.
- Before implementation, read this file, `docs/AGENTS.md`, `docs/PROJECT_BRIEF.md`, `docs/BUILD_READINESS.md`, `docs/FAB_LIBRARY_AUDIT.md`, `docs/ASSET_MANIFEST.md`, `docs/ASSET_PIPELINE.md`, `docs/MAP_DESIGN.md`, and `docs/TOOLING.md`.
- Treat the approved Fab/library content as the environment construction kit. Inspect available assets before creating substitutes.
- Do not build the visible environment from primitive cubes, blank greybox geometry, or newly modeled stand-ins when a suitable approved asset exists.
- Terrain generation is allowed and expected. Use UEFN Landscape tools, generated heightmaps, splines, or other supported terrain workflows when appropriate.
- Use Epic's `unreal-mcp` first for supported first-party editor operations and `powertools` for bulk inspection, editing, diagnostics, dependency/material/texture checks, and Verse diagnostics.
- Preserve Lore revision control. Do not delete or reset `.lore`, replace project history, or modify unrelated UEFN projects.
- The primary implementation goal is a complete playable FFA in one focused build pass. Avoid exploratory rebuild loops and unnecessary tool calls.
- Testing belongs after the primary construction pass unless a blocking editor/runtime error prevents meaningful progress.
- Do not install additional experimental AI/editor bridges during the one-shot unless a demonstrated capability gap requires one.
- Keep terrain, gameplay devices, Verse, asset placement, lighting, and final polish coherent with the Scrapline design documents.
- Run the DOX closeout after meaningful changes and keep durable documentation synchronized with implemented reality.

## Child DOX Index

- `docs/AGENTS.md` — owns durable design, asset, planning, and implementation-handoff documentation under `docs/`.
- `README.md` remains governed by this root contract.