# Documentation DOX

## Purpose

Own durable design, asset, planning, and build-specification documentation for Scrapline.

## Ownership

This folder owns:
- project briefs and design intent
- approved asset records
- owned Fab library audits, staging priorities, asset recovery state, and asset-family coverage / intake-stop decisions
- map-layout and combat-flow specifications
- future one-shot build instructions and implementation handoff documents
- build toolchain and editor-integration requirements
- asset intake / donor-project workflow documentation
- one-shot readiness and build-gate status
- blocked/final implementation handoff prompt documentation
- UEFN Central generator experiment capture, audit, and native-vs-generated disposition
- Armory / match-economy design, catalog contract, lifecycle rules, UMG presentation contract, and implementation validation
- documentation pointers into the committed real-source visual authority under `Resources/Reference/RealAssets/`

The root `AGENTS.md` owns repository-wide rules.

## Local Contracts

- Documentation must separate confirmed decisions from ideas still under consideration.
- External assets must include their source URL and intended role before they are treated as approved.
- Do not claim an asset is available in the UEFN project until it has been confirmed by the user or implementation tooling.
- Fab Referenced Content may remain read-only when Scrapline only needs to place/use it. Do not duplicate or promote a referenced pack just to make it editable; promote only a specific asset that implementation proves must be modified.
- The final one-shot build specification must use the frozen asset manifest rather than silently inventing replacement geometry.
- The active Sol one-shot must require visual inspection of the committed real-source boards/contact sheets before environment construction. Written composition guidance does not replace opening the actual reference images.
- Keep implementation-facing instructions concrete enough that another agent can execute without reconstructing prior chat context.
- The approved one-shot toolchain is documented in `TOOLING.md`; do not silently replace or remove an installed integration.
- `SPATIAL_CONTRACT.md` is the implementation authority for macro layout, major anchor placement/orientation, route connectivity, verticality limits, spawn-region distribution, and lighting concept. Softer older prose must not override it.
- Before final one-shot approval, run the confusion audit (`ASTRA_CONFUSION_AUDIT.md`, historical filename) and remove or narrow stale wording that asks the implementation model to re-select a frozen design decision.
- For the locked first alpha, native gameplay authority remains in `VERSE_GAMEPLAY_INTEGRATION.md`, while `ARMORY_ECONOMY_SPEC.md` now owns the authorized match-economy extension. Keep Island Settings authoritative for score, 30-elimination victory, timeout, respawn rules, sustain, and spawn selection. Custom Verse may own only the Armory responsibilities listed in `ARMORY_ECONOMY_SPEC.md`. The completed UEFN Central five-file result in `UEFN_CENTRAL_GENERATOR_RESULT.md` remains quarantined evidence and must not be revived as the implementation architecture.

## Work Guidance

- Prefer concise operational documents over brainstorming transcripts.
- When a design decision changes, update the owning document instead of appending contradictory history.
- Mark unapproved candidates clearly.
- `SOL61_ONE_SHOT_PROMPT.md` is the active authorized execution prompt; `ASTRA_ONE_SHOT_PROMPT.md` is superseded historical handoff material.
- `BUILD_RUN_STATE.md` is the concise recovery ledger for resuming long runs after transient interruptions.

## Verification

- Before a build handoff, verify that every required asset is either already present in the project or explicitly listed as a prerequisite.
- Verify that the final build document does not depend on unapproved placeholder or custom-modeled environment geometry.
- Verify that every visual file named by the active Sol visual-preflight gate exists on the active GitHub branch and is governed by `Resources/AGENTS.md`.
- Before implementation, verify Epic UEFN MCP and Power Tools are reachable from the active GPT-6.1 Sol execution environment in the actual Scrapline UEFN project.
- The Armory uses a narrow custom Verse surface. The handoff baseline passed live UEFN `ValkyrieToolset.VerseToolset.BuildAll` before construction authorization; final UMG presentation and the full lifecycle/economy multiplayer matrix are GPT-6.1 Sol construction/post-build acceptance work. Standalone digest/LSP or generator validation is not authoritative.

## Child DOX Index

No child DOX documents yet.