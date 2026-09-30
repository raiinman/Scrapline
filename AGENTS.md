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

- Before resuming Scrapline work in a new or continued session, refresh the current repository state from GitHub instead of relying on chat memory alone.
- Treat the GitHub `main` branch as the durable source of truth for Scrapline planning/status documentation, and sync meaningful verified project-state changes back to the repository.
- When the user requests another durable behavior change, record it here or in the relevant child AGENTS.md
- Feature Freeze v2 added the Scrapline Armory / match economy before construction. The spatial/asset freeze remains intact. The previously validated native gameplay package remains the control for spawning, scoring, match end, sustain, movement, and destruction; a narrowly scoped custom Verse layer is authorized only for the Armory responsibilities in `docs/ARMORY_ECONOMY_SPEC.md`. The hostile pre-construction red team closed GREEN, and on **2026-09-30 the user explicitly authorized the one-shot construction pass**. The active worker is **GPT-6.1 Sol** and `docs/SOL61_ONE_SHOT_PROMPT.md` is the execution prompt; `docs/ASTRA_ONE_SHOT_PROMPT.md` is superseded historical handoff material. Final Armory UMG presentation plus lifecycle/multiplayer acceptance testing are assigned to that construction/post-build pass. Broad asset acquisition, synthetic environment generation, bulk reserve import, and redesign of the frozen spatial contract remain closed unless separately authorized.
- Before approving the one-shot handoff, run a contradiction/confusion audit and leave no meaningful macro-layout, major-anchor, route-network, verticality, or time-of-day decision for the implementation model to invent. `docs/SPATIAL_CONTRACT.md` is the placement authority for the frozen one-shot skeleton.

## Scrapline UEFN Execution Contract

- This local UEFN project is the implementation workspace for Scrapline.
- Before implementation, read this file, `docs/AGENTS.md`, `docs/PROJECT_BRIEF.md`, `docs/ARMORY_ECONOMY_SPEC.md`, `docs/ARMORY_UI_SPEC.md`, `docs/VERSE_GAMEPLAY_INTEGRATION.md`, `docs/SPATIAL_CONTRACT.md`, `docs/MAP_DESIGN.md`, `docs/TERRAIN_ENVIRONMENT_SPEC.md`, `docs/ENVIRONMENT_COMPOSITION_BOARD.md`, `docs/PHYSICAL_FIT_VERIFICATION.md`, `docs/GAMEPLAY_SPEC.md`, `docs/BUILD_READINESS.md`, `docs/FAB_LIBRARY_AUDIT.md`, `docs/ASSET_RECOVERY.md`, `docs/ASSET_MANIFEST.md`, `docs/ASSET_PIPELINE.md`, and `docs/TOOLING.md`.
- Treat the approved Fab/library content as the environment construction kit. Inspect available assets before creating substitutes.
- **Committed real visual authority is mandatory before environment construction.** Read `Resources/AGENTS.md`, then inspect `Resources/Reference/RealAssets/REAL_ASSET_VISUAL_INDEX.md` and actually open the mandatory boards/contact sheets named by the active Sol Gauntlet. Do not infer the visual direction from filenames or prose alone. Visuals control silhouette, material/color language, clutter density, district identity, and VFX restraint; `docs/SPATIAL_CONTRACT.md` still controls coordinates, routes, verticality, spawn regions, and gameplay geometry.
- Do not build the visible environment from primitive cubes, blank greybox geometry, or newly modeled stand-ins when a suitable approved asset exists.
- Terrain generation is allowed and expected. Use UEFN Landscape tools, generated heightmaps, splines, or other supported terrain workflows when appropriate.
- **Trashbyrd's UEFN Power Tools is a required first-class UEFN construction/control/inspection layer, not merely an optional diagnostic or bulk helper.** Canonical upstream: `https://github.com/Corsair-Studios/trashbyrds-uefn-power-tools/tree/main`. Run it alongside Epic's `unreal-mcp`. At build startup, prove the live bridge with `uefn_status` and discover the current callable surface with `uefn_list_commands`. Prefer Power Tools whenever it is the safest/fastest supported path for live level status, actors, assets, devices, properties, tags, level stats, dependencies, materials, textures, Niagara, health, dead-asset, moderation/IP, placement, or verification work. Use Epic's `unreal-mcp` where its first-party/specialized Scene Graph, Creative/Verse/UMG, session, `BuildAll`, or validator operations are stronger or uniquely available. Do not manually repeat work that an installed tool can perform reliably.
- **GPT-6.1 Sol long-run resilience:** treat temporary/low-compute messages, model/stream timeouts, MCP transport/polling timeouts, and editor calls that outlive the client wait as recoverable events, not hard blockers. Inspect the live editor/tool/log/source state before retrying; never assume the last mutation failed; never duplicate cooks/imports/batches/sessions because transport timed out. Resume from `docs/BUILD_RUN_STATE.md` plus live state. Stop only for a persistent reproducible blocker or frozen-contract/history risk.
- Preserve Lore revision control. Do not delete or reset `.lore`, replace project history, or modify unrelated UEFN projects.
- The primary implementation goal is a complete playable FFA in one focused build pass. Avoid exploratory rebuild loops and unnecessary tool calls.
- Testing belongs after the primary construction pass unless a blocking editor/runtime error prevents meaningful progress.
- Do not install additional experimental AI/editor bridges during the one-shot unless a demonstrated capability gap requires one.
- Keep terrain, gameplay devices, Verse, asset placement, lighting, and final polish coherent with the Scrapline design documents.
- Run the DOX closeout after meaningful changes and keep durable documentation synchronized with implemented reality.

## Child DOX Index

- `docs/AGENTS.md` — owns durable design, asset, planning, and implementation-handoff documentation under `docs/`.
- `verse/AGENTS.md` — owns reviewable custom Verse source mirrors synchronized from the live Scrapline UEFN project.
- `Resources/AGENTS.md` — owns committed non-code build resources: real visual authority and frozen terrain inputs.
- `README.md` remains governed by this root contract.