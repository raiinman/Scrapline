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
- Armory / match-economy design, catalog contract, lifecycle rules, and implementation validation

The root `AGENTS.md` owns repository-wide rules.

## Local Contracts

- Documentation must separate confirmed decisions from ideas still under consideration.
- External assets must include their source URL and intended role before they are treated as approved.
- Do not claim an asset is available in the UEFN project until it has been confirmed by the user or implementation tooling.
- Fab Referenced Content may remain read-only when Scrapline only needs to place/use it. Do not duplicate or promote a referenced pack just to make it editable; promote only a specific asset that implementation proves must be modified.
- The final one-shot build specification must use the frozen asset manifest rather than silently inventing replacement geometry.
- Keep implementation-facing instructions concrete enough that another agent can execute without reconstructing prior chat context.
- The approved one-shot toolchain is documented in `TOOLING.md`; do not silently replace or remove an installed integration.
- `SPATIAL_CONTRACT.md` is the implementation authority for macro layout, major anchor placement/orientation, route connectivity, verticality limits, spawn-region distribution, and lighting concept. Softer older prose must not override it.
- Before final one-shot approval, run the Astra confusion audit and remove or narrow stale wording that asks the implementation model to re-select a frozen design decision.
- For the locked first alpha, native gameplay authority remains in `VERSE_GAMEPLAY_INTEGRATION.md`, while `ARMORY_ECONOMY_SPEC.md` now owns the authorized match-economy extension. Keep Island Settings authoritative for score, 30-elimination victory, timeout, respawn rules, sustain, and spawn selection. Custom Verse may own only the Armory responsibilities listed in `ARMORY_ECONOMY_SPEC.md`. The completed UEFN Central five-file result in `UEFN_CENTRAL_GENERATOR_RESULT.md` remains quarantined evidence and must not be revived as the implementation architecture.

## Work Guidance

- Prefer concise operational documents over brainstorming transcripts.
- When a design decision changes, update the owning document instead of appending contradictory history.
- Mark unapproved candidates clearly.

## Verification

- Before a build handoff, verify that every required asset is either already present in the project or explicitly listed as a prerequisite.
- Verify that the final build document does not depend on unapproved placeholder or custom-modeled environment geometry.
- Before implementation, verify Epic UEFN MCP and Power Tools are reachable from Codex in the actual Scrapline UEFN project.
- The Armory has reopened a narrow custom Verse surface. Any accepted Armory code must pass live UEFN `ValkyrieToolset.VerseToolset.BuildAll` and lifecycle/economy tests before the Astra gate can close; standalone digest/LSP or generator validation is not authoritative.

## Child DOX Index

No child DOX documents yet.