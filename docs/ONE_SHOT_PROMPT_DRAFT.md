# Scrapline — Codex One-Shot Prompt Draft

> **DO NOT RUN YET.** This draft is intentionally blocked until the asset manifest is frozen and the generated Verse package is validated.

## Mission

Build the complete first playable alpha of **Scrapline**, a compact post-apocalyptic industrial scrapyard Free For All arena in UEFN, in one focused implementation pass.

This is not a greybox exercise. The visible environment must be built from verified production assets already available to the Scrapline project.

## Required Reading Order

Before changing anything:

1. `AGENTS.md`
2. `docs/AGENTS.md`
3. `docs/PROJECT_BRIEF.md`
4. `docs/BUILD_READINESS.md`
5. `docs/MAP_DESIGN.md`
6. `docs/TERRAIN_ENVIRONMENT_SPEC.md`
7. `docs/GAMEPLAY_SPEC.md`
8. `docs/ASSET_MANIFEST.md`
9. `docs/ASSET_PIPELINE.md`
10. `docs/TOOLING.md`

Then inspect the live UEFN project and available MCP/Power Tools capabilities before implementation.

## Hard Constraints

- Preserve Lore/version-control history.
- Do not modify unrelated UEFN projects.
- Do not re-add LookoutTower.
- Do not restore OldWest Vol. 6 unless the frozen manifest explicitly approves a specific asset from it.
- No visible primitive-box/greybox substitute environment where a verified production asset exists.
- No new Blender environment modeling during the primary pass.
- Do not install experimental AI/editor bridges during the one-shot.
- Use the frozen asset manifest as the source of truth.
- Use Epic UEFN MCP for supported first-party editor operations.
- Use Power Tools for bulk inspection, placement support, diagnostics, dependency/material/texture checks, and health scans where useful.
- Use Omni-Verse / compiler diagnostics for Verse repair, not guessed APIs.
- Test after the primary construction pass unless a blocking editor/runtime error prevents progress.

## Locked Map Envelope

- Primary mode: 12-player FFA.
- Support ceiling for later testing: 16 players.
- Playable footprint: about 140 m x 140 m.
- Terrain/scenic envelope: about 170 m x 170 m.
- Central kill yard: about 42 m across.
- Outer broken flank route: about 10–14 m wide.
- Long intentional sightlines: about 50–65 m.
- 18–20 spawn candidates.
- Primary useful verticality: ground, +4–6 m mid positions, rare +8–10 m high positions.

## Terrain

Use the staged terrain heightmap as the starting point:

`Resources/Terrain/Scrapline_Terrain_v1_253x253_16bit.png`

Starting import targets:
- 253 x 253.
- X/Y scale about 67.46 cm per quad.
- Z scale about 4.0.
- Preserve the designed shallow central basin, irregular perimeter shoulders, district pads, drainage/service cuts, and service-road gaps.

Adjust import/sculpting only when needed for real asset fit, player movement, collision, and combat readability.

## Districts

Build four overlapping industrial districts around the central kill yard:

- Northwest: Scrap / Wreck Yard.
- Northeast: Loading Yard.
- Southeast: Ruined Workshop.
- Southwest: Machinery / Power Yard.

The result must feel like one evolved industrial site, not four square themed rooms.

## Environment Build Order

1. Inspect and categorize the frozen production asset pool.
2. Import/create Landscape from the staged heightmap.
3. Fit terrain around the four district pads and central basin.
4. Select/place the frozen hero landmark.
5. Place largest district structures first.
6. Establish center access, cross-district links, and broken outer flank route.
7. Build controlled vertical routes and counter-angles.
8. Add hard cover and sightline blockers.
9. Place provisional spawn devices.
10. Add secondary props, debris, utilities, signage, restrained VFX, and atmosphere.
11. Establish final lighting/time-of-day treatment.
12. Wire gameplay devices and validated Verse.
13. Run health/collision/dependency/material/performance checks.
14. Save and perform the DOX closeout.

## Gameplay Baseline

- FFA.
- 12-player primary target.
- One 10-minute round.
- First to 30 eliminations wins.
- Join in progress allowed.
- Building off.
- Harvesting off.
- Stable environment cover; destruction off where practical.
- 100 health / 100 shield.
- Overshield off.
- Sprint, slide, mantle, crouch on.
- Fall damage off.
- Respawn about 3 seconds.
- Spawn immunity about 2 seconds.
- Fixed three-role loadout through editor-configurable devices: shotgun, rifle, SMG/sidearm.
- Infinite reserve ammo acceptable; normal magazines/reloads remain.
- No dropped-item accumulation.
- Target 50-point elimination sustain, isolated so it can be disabled if unreliable.
- Prefer native Tracker/HUD/End Game behavior over unnecessary custom Verse.

## Verse

**BLOCKED UNTIL FINAL HANDOFF:** replace this section with the validated UEFN Central / Omni-Verse package and exact device wiring before running the one-shot.

Verse must stay small, multiplayer-safe, and limited to behavior that benefits from code.

## Asset Manifest

**BLOCKED UNTIL FINAL HANDOFF:** only assets marked approved/frozen in `docs/ASSET_MANIFEST.md` may be treated as guaranteed.

Do not assume that merely owned Fab Library content is available to the live project.

## Completion Standard

The primary pass is complete only when:

- the arena is visibly production-art, not a blockout,
- all four districts and the central yard are recognizable,
- routes and verticality match the locked macro design,
- spawn devices and basic loadout/gameflow are wired,
- validated Verse is integrated,
- the level saves cleanly,
- the project passes the available health/dependency/material checks without known blocking errors.

Do not spend the one-shot polishing trivial micro-details before the complete playable loop exists.

## Final Report

At completion, report:
- what was built,
- any spec deviations and why,
- exact asset families used by district,
- terrain/import adjustments,
- gameplay/Verse wiring,
- remaining warnings,
- what should be tested first in a live session.