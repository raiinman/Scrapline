# Scrapline — Astra One-Shot Prompt Draft

> **DO NOT RUN YET.** The map/design/asset freeze is complete, but the current pre-build hold remains active and the validated Verse/device package has not yet been integrated into this draft.

## Mission

Build the complete first playable alpha of **Scrapline**, a compact post-apocalyptic industrial scrapyard Free For All arena in UEFN, in one focused implementation pass.

You are implementing a **frozen design**, not designing a new arena.

This is not a greybox exercise. The visible environment must be built from verified production assets already available to Scrapline.

## Authority order

Read these before changing anything:

1. `AGENTS.md`
2. `docs/AGENTS.md`
3. `docs/PROJECT_BRIEF.md`
4. `docs/SPATIAL_CONTRACT.md` — **layout/major-placement authority**
5. `docs/MAP_DESIGN.md`
6. `docs/TERRAIN_ENVIRONMENT_SPEC.md`
7. `docs/ENVIRONMENT_COMPOSITION_BOARD.md`
8. `docs/PHYSICAL_FIT_VERIFICATION.md`
9. `docs/GAMEPLAY_SPEC.md`
10. `docs/ASSET_MANIFEST.md` — **asset-approval authority**
11. `docs/ASSET_PIPELINE.md`
12. `docs/TOOLING.md`
13. `docs/BUILD_READINESS.md`

If softer or older prose conflicts with `SPATIAL_CONTRACT.md`, the spatial contract wins for layout, orientation, route, verticality, and placement tolerance. Do not use ambiguity as permission to redesign.

Then verify the live UEFN project and the available MCP/Power Tools capabilities before implementation.

## Layer 1 — Non-negotiable spatial contract

Do **not** invent or re-select:
- the hero landmark,
- district quadrants,
- major anchor roles,
- central gantry orientation,
- required route connectivity,
- spawn-region distribution,
- catwalk budget,
- Garage roof treatment,
- container-stack ceiling,
- outer-flank structure,
- lighting/time-of-day concept.

The detailed coordinates/tolerances are in `SPATIAL_CONTRACT.md`.

Critical summary:
- playable combat envelope: approximately **140 m × 140 m**,
- scenic/terrain envelope: approximately **170 m × 170 m**,
- center: Central Kill Yard around **(0, 0)**,
- NW: Scrap/Wreck around **(-3800, +3600)**,
- NE: Loading around **(+3900, +3700)**,
- SE: Ruined Workshop around **(+3900, -3800)**,
- SW: Machinery/Power around **(-3800, -3900)**,
- central hero: Factory `SM_Crane01` + cabin + cable shared-pivot assembly,
- gantry target center approximately **(-250, +250)**,
- gantry long axis must read **NW ↔ SE**, approximately through **(-900, +1400)** and **(+400, -900)**,
- Garage assembly target center approximately **(+4000, -3900)** with its primary open/service face toward the northwest/center-side service court,
- metal catwalks are the primary elevated language; no uninterrupted elevated run over roughly **15 m**,
- wooden catwalks are rare Wreck Yard accents only,
- no continuous outer-ring route,
- 19 distributed candidate spawn regions are frozen; final spawn transforms may move only within their allowed local fit tolerance unless a documented safety failure requires otherwise.

Before micro-detailing, verify the spatial-contract acceptance checks.

## Layer 2 — Art/composition freedom

Within the frozen skeleton, use artistic judgment for:
- small cover rotations/offsets,
- approved small Scrapyard clutter variants,
- decals/graffiti,
- restrained VFX,
- fine terrain blending around asset feet,
- natural-looking disorder that does not alter required traversal,
- exposure/lighting tuning within the frozen daylight treatment.

The map should look irregular and accumulated, but its combat skeleton must remain deliberate.

## Hard constraints

- Preserve Lore/version-control history.
- Do not modify unrelated UEFN projects.
- Do not re-add LookoutTower.
- Do not restore OldWest Vol. 6.
- Do not browse/download/import a new environment pack during the primary pass.
- Do not replace a frozen major anchor because another asset is easier to place.
- No visible primitive-box/greybox substitute environment where a verified production asset exists.
- No new Blender environment modeling during the primary pass.
- Do not install experimental AI/editor bridges during the one-shot.
- Use the frozen asset manifest as the source of truth.
- Keep Fab Referenced Content read-only unless a specific implementation failure proves one asset must be modified.
- Use Epic UEFN MCP for supported first-party editor operations.
- Use Power Tools for bulk inspection, placement support, diagnostics, dependency/material/texture checks, and health scans where useful.
- Use Omni-Verse/compiler diagnostics for Verse repair, not guessed APIs.
- Test after the primary construction pass unless a blocking editor/runtime error prevents progress.
- If a frozen major anchor cannot satisfy its documented role, follow the emergency fallback rule in `SPATIAL_CONTRACT.md` and report the deviation. Do not silently redesign.

## Terrain

Use the staged terrain heightmap:

`Resources/Terrain/Scrapline_Terrain_v1_253x253_16bit.png`

Starting import targets:
- 253 × 253,
- X/Y scale about 67.46 cm per quad,
- Z scale about 4.0,
- preserve the designed shallow central basin,
- preserve irregular perimeter shoulders,
- preserve broad district pads,
- preserve drainage/service cuts and service-road gaps.

Adjust terrain only for real asset fit, player movement, collision, and combat readability **without moving frozen major anchors outside the tolerances in `SPATIAL_CONTRACT.md`**.

Do not turn the perimeter into a continuous high-ground ring.

## Frozen district roles

### Northwest — Scrap / Wreck Yard
Use Campervan, abandoned/wrecked cars, junk piles, fencing, rubble, tires, barriers, and Scrapyard glue. Dense but still readable. No repeated vehicle rows.

### Northeast — Loading Yard
Use Box Truck, Factory containers, forklift, pallets/cart, and restrained Scrapyard container variants. Do not create a continuous container wall. Maximum routine container stack: two high.

### Southeast — Ruined Workshop
Use the Garage shell + roof shared assembly as the primary structure, expanded with exterior service/workshop dressing. The roof is not a default traversal route.

### Southwest — Machinery / Power Yard
Use Factory machinery/electrical pieces, engine/container, IndustrialPipesSource, and utility forms. This district owns the strongest normal metal-catwalk route, but ground combat remains dominant.

### Center — Kill Yard
Use the frozen Factory horizontal gantry shared assembly plus lower machinery/rubble/pipe support. Preserve four distinct approach/exit relationships and do not create a safe full-length gantry-top firing lane.

Carry Scrapyard fencing, corrugated metal, junk, wires, graffiti, signs, and repair clutter across boundaries so these do not read as four asset-pack demo rooms.

## Route and sightline constraints

- Every district connects to center, both neighbors, and a broken outer-flank segment.
- Primary lanes: approximately **7–10 m** before cover.
- Secondary routes: approximately **4.5–7 m**.
- Tight believable service/interior connectors: approximately **3–5 m**.
- Do not accidentally pinch a required secondary route below roughly **3 m** of practical traversal width.
- Long intentional sightlines generally terminate around **50–65 m**.
- Every long lane needs a lateral escape.
- No spawn begins with an unobstructed view straight into center.
- No clean full-arena diagonal.
- Do not create dead-end districts or a complete outer ring.

## Verticality

- Ground = dominant combat layer.
- Normal mid band = approximately **+4–6 m**.
- Rare high band = approximately **+8–10 m**.
- Garage roof is near the rare-high band and must remain exposed/challengeable if accessible.
- Double-container stacks reach the upper mid band and count as real elevated combat positions.
- Metal catwalk rise modules naturally reach the normal mid band.
- Maximum uninterrupted elevated run is roughly **15 m / three flat catwalk modules**.
- Do not build a map-spanning catwalk network.
- Do not solve routing problems with new mobility mechanics.

## Lighting

Use the frozen **readable overcast / hazy late-afternoon industrial daylight** direction:
- daytime,
- moderate/soft contrast,
- slightly warm directional light with cooler ambient fill,
- sun broadly from west/southwest at moderate elevation,
- restrained haze,
- no dense fog,
- no heavy orange apocalypse grade,
- no night/neon reinterpretation.

Tune exposure/intensity for player readability.

## Environment build order

1. Read the full authority chain.
2. Verify the required frozen assets resolve in the live project; **do not perform a new asset-selection pass**.
3. Import/create Landscape from the staged heightmap.
4. Establish the basin, shoulders, district pads, drainage cuts, and service-road contours.
5. Place the frozen Factory gantry assembly at its locked anchor/orientation.
6. Place the Garage, Box Truck, Campervan, Factory containers, and major Machinery/Power anchors in their frozen districts.
7. Establish all required center, neighbor, and broken-flank routes.
8. Establish controlled vertical routes within the catwalk/height budget.
9. Run the spatial-contract acceptance check **before** dressing.
10. Add hard cover and sightline blockers while preserving route widths.
11. Place spawn devices inside the frozen candidate regions and validate LOS/cover.
12. Add secondary props, debris, utilities, signs, restrained VFX, and cross-district Scrapyard glue.
13. Apply the frozen daylight treatment and tune readability.
14. Wire gameplay devices and the validated Verse package.
15. Run health/collision/dependency/material/performance checks.
16. Save and perform the DOX closeout.

If the skeleton fails an acceptance check, fix it before proceeding to micro-props, VFX, lighting polish, or gameplay wiring.

## Gameplay baseline

- FFA.
- 12-player primary target; correct up to 16.
- One 10-minute round.
- First to 30 eliminations wins.
- Join in progress allowed.
- Building off.
- Harvesting off.
- Destruction off where practical.
- 100 health / 100 shield.
- Overshield off.
- Sprint, slide, mantle, crouch on.
- Fall damage off.
- Respawn ~3 seconds.
- Spawn immunity ~2 seconds.
- Fixed three-role editor-configurable loadout: shotgun, rifle, SMG/sidearm.
- Infinite reserve ammo acceptable; normal magazines/reloads remain.
- No dropped-item accumulation.
- Target 50-point elimination sustain, isolated so it can be disabled if unreliable.
- Prefer native Tracker/HUD/End Game behavior over unnecessary custom Verse.

## Verse

**BLOCKED UNTIL FINAL HANDOFF:** replace this section with the validated UEFN Central / Omni-Verse package and exact device wiring before running the one-shot.

Verse must stay small, multiplayer-safe, and limited to behavior that benefits from code. It does not own terrain, asset placement, spawn coordinates, environment layout, lighting, or VFX.

## Asset authority

The asset manifest is already frozen.

Only assets marked approved/frozen in `docs/ASSET_MANIFEST.md` may be treated as guaranteed. Mounted referenced-content fallbacks may be used only under the fallback rules in `SPATIAL_CONTRACT.md`.

Do not assume that merely owned Fab Library content belongs in the live project.

## Completion standard

The primary pass is complete only when:
- the arena is visibly production-art, not a blockout,
- all four districts and the central yard occupy their frozen spatial roles,
- the Factory gantry matches the required center/orientation,
- required center/neighbor/flank connectivity exists,
- verticality respects the catwalk/perch budget,
- no unintended dominant Garage-roof or gantry-top position exists,
- spawn devices remain distributed through the frozen regions,
- basic loadout/gameflow is wired,
- validated Verse is integrated,
- the level saves cleanly,
- available health/dependency/material checks show no blocking errors.

Do not spend the one-shot polishing trivial micro-details before the complete playable loop exists.

## Final report

Report:
- what was built,
- every spec deviation and the concrete reason,
- exact asset families used by district,
- terrain/import adjustments,
- any spawn region moved outside tolerance and why,
- any fallback asset used and why,
- gameplay/Verse wiring,
- remaining warnings,
- what should be tested first in a live session.
