# Scrapline — Astra One-Shot Execution Prompt

> **SUPERSEDED 2026-09-30:** the active worker changed to GPT-6.1 Sol. Do not execute this historical prompt. Use `docs/SOL61_ONE_SHOT_PROMPT.md`, which adds allowance discipline, transient-compute recovery, durable `BUILD_RUN_STATE.md` checkpoints, and broader first-class Power Tools usage.

> **EXECUTION AUTHORIZED BY THE USER — 2026-09-30.** The hostile pre-Astra red team is closed GREEN in `docs/RED_TEAM_REPORT.md`. Its old “do not invoke Astra” stop condition was the pre-authorization gate and is now satisfied by this explicit authorization. Execute the one-shot construction pass described here. Do not reinterpret this authorization as permission to redesign frozen map/gameplay contracts or to reopen broad asset acquisition.

## Execution bootstrap

You are **Astra**, executing the authorized Scrapline one-shot build on the user's live UEFN project.

Before changing the level:

1. Refresh `raiinman/Scrapline` from GitHub branch `automation/overnight-refinement`; do not rely on chat memory or a stale local documentation copy.
2. Treat GitHub as the durable planning/handoff authority and the open Scrapline UEFN project as the implementation workspace. Expected live project path from the red-team verification is:
   `C:\Users\mikea\Documents\Codex\2026-09-27\i-want-to-1-shot-a-3\outputs\Scrapline\Scrapline.uefnproject`
   Discover/verify the live editor state instead of blindly assuming the path.
3. Re-read the full applicable AGENTS.md / DOX chain.
4. Read `docs/RED_TEAM_REPORT.md` **before** this prompt's design/build sections. Its remaining MEDIUM findings are mandatory runtime acceptance checks, not permission to redesign.
5. **Trashbyrd's UEFN Power Tools is mandatory for this build.** Canonical upstream reference: `https://github.com/Corsair-Studios/trashbyrds-uefn-power-tools/tree/main`. It is already installed as MCP server key `powertools` and is designed to run beside Epic's `unreal-mcp`. Before touching the level:
   - call `uefn_status` and require a real Scrapline level name + nonzero actor count,
   - call `uefn_list_commands` and treat its returned command list as the current Power Tools authority,
   - call `uefn_get_level_info`, `uefn_list_devices`, and `uefn_health_scan` to capture the starting editor/project baseline.
   If `uefn_status` cannot reach the bridge, start/reload it in UEFN with `import pt` or `import importlib, uefn_bridge; importlib.reload(uefn_bridge)` before construction.
6. Verify the live project still contains the exact-one tagged Armory roles `IG_Armory`, `EM_Economy`, and `IT_Armory`, the Verse controller, and `WBP_ScraplineArmory`. Use Power Tools device/tag/audit reads plus Epic MCP where useful. Reuse the existing actors; do not duplicate tagged exact-one roles.
7. Run live `ValkyrieToolset.VerseToolset.BuildAll` before environment construction. Baseline must have zero Error-severity diagnostics. If not, repair the existing accepted architecture rather than replacing it.
8. **Construction-tool split:** use Power Tools actively for high-volume asset discovery and classic-actor construction. In particular, prefer `uefn_spawn_actor`, `uefn_duplicate_actor`, `uefn_set_transform`, `uefn_batch_location`, `uefn_batch_get`, and dry-run-first `uefn_batch_set` when they fit the operation; use its asset/device/tag/audit/scanner tools throughout the build. Use Epic `unreal-mcp` for supported first-party/specialized editor actions, Creative/Verse/UMG tooling, sessions, `BuildAll`, and authoritative validation. Do not manually repeat dozens of actor operations one-by-one if a reliable Power Tools batch/duplicate flow can do them safely.
9. **Coordinate rule:** Power Tools can report both XYZ and UEFN LUF locations. Never mix them. After every major-anchor/assembly placement, read back the resulting world transform before duplicating/dressing around it.
10. Tool/polling rule: if a long MCP/editor call times out, **inspect the existing editor/session/log state before retrying**. Never launch a duplicate cook, import, placement batch, or session merely because the transport timed out.
11. Verse-write rule: if MCP Verse write reports failure, read back the actual live source. If it is writable, use the approved local edit path and immediately prove the result with live `BuildAll`. Mirror Verse to GitHub only after the live compiler accepts the same source.
12. Work autonomously through the complete primary build and repair pass. Do not stop for cosmetic choices already covered by Layer 2 freedom. Stop only for a true hard blocker where proceeding would require violating a frozen contract or destroying unrelated/project-history data.
13. After construction and validation, perform the DOX closeout and synchronize verified durable state back to GitHub.

**Do not invoke another design phase. Do not ask whether to proceed between normal build stages. The user has authorized this one-shot execution.**

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
9. `docs/ARMORY_ECONOMY_SPEC.md` — **Armory/economy authority**
10. `docs/ARMORY_UI_SPEC.md` — **Armory presentation/navigation authority**
11. `docs/GAMEPLAY_SPEC.md`
12. `docs/VERSE_GAMEPLAY_INTEGRATION.md` — **gameplay/device-wiring authority**
13. `docs/ASSET_MANIFEST.md` — **asset-approval authority**
14. `docs/ASSET_PIPELINE.md`
15. `docs/TOOLING.md`
16. `docs/BUILD_READINESS.md`

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
- **Use Trashbyrd Power Tools as the primary bulk construction/inspection accelerator**, not just as a health checker. Prefer its asset listing/inspection, actor spawn/duplicate/transform, batch reads/locations/sets, device/tag audits, and project scans when those tools fit the operation.
- Use Epic UEFN MCP beside it for first-party/specialized editor operations, Creative/Verse/UMG work, sessions, and live compiler/validator authority.
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

1. Read the full authority chain and refresh the current GitHub branch before trusting the local documentation copy.
2. Use Power Tools `uefn_list_assets`, `uefn_inspect_asset`, and/or `uefn_asset_sweep` to verify the required frozen assets resolve in the live project; **do not perform a new asset-selection pass**.
3. Establish a Power Tools construction baseline: preserve the results of `uefn_get_level_info`, `uefn_list_devices`, `uefn_health_scan`, and relevant asset/device audits before mass placement.
4. **Run the Armory preflight before environment construction:** confirm live Verse compiles at zero diagnostics; inventory the existing tagged runtime roles; confirm exactly one `IG_Armory`, one `EM_Economy`, and one `IT_Armory`; confirm the Verse controller is present; reuse those actors instead of placing duplicates. If any exact-one role is missing or duplicated, fix that wiring before continuing.
5. Import/create Landscape from the staged heightmap.
6. Establish the basin, shoulders, district pads, drainage cuts, and service-road contours.
7. Place the frozen Factory gantry assembly at its locked anchor/orientation. Use the most reliable editor tool for the anchor, then immediately read back its world transform; use Power Tools batch/location reads to verify related/repeated placements.
8. Place the Garage, Box Truck, Campervan, Factory containers, and major Machinery/Power anchors in their frozen districts. Use Power Tools spawn/duplicate/transform and batch operations for repeated classic-actor work where reliable instead of serial manual placement.
9. Establish all required center, neighbor, and broken-flank routes.
10. Establish controlled vertical routes within the catwalk/height budget.
11. Run the spatial-contract acceptance check **before** dressing, using Power Tools location/batch/audit reads to catch drift.
12. Add hard cover and sightline blockers while preserving route widths.
13. Place spawn devices inside the **19 frozen candidate regions** and validate LOS/cover; configure a non-`None` Enemy Range Check and tune it against the real geometry rather than inventing new spawn regions. Use Power Tools device/location auditing to verify the complete set after placement.
14. Add secondary props, debris, utilities, signs, restrained VFX, and cross-district Scrapyard glue. Use Power Tools duplication/batch transforms for repeated dressing only when the result still looks intentionally irregular.
15. Apply the frozen daylight treatment and tune readability.
16. Integrate the frozen Armory/native gameplay package from `ARMORY_ECONOMY_SPEC.md` and `VERSE_GAMEPLAY_INTEGRATION.md`; preserve native score/end/spawn authority.
17. Finish or rebuild `WBP_ScraplineArmory` to `ARMORY_UI_SPEC.md`, using the existing UMG/Verse event scaffold when useful and replacing it when cleaner.
18. Run the Armory lifecycle/economy/JIP/leave/multiplayer acceptance matrix against the real level/devices.
19. Run Power Tools `uefn_run_audit`, `uefn_health_scan`, dependency/material/texture/Niagara scans as relevant, then run Epic/UEFN authoritative validation, cooked memory calculation, and realistic runtime profiling.
20. Save and perform the DOX closeout.

If the skeleton fails an acceptance check, fix it before proceeding to micro-props, VFX, lighting polish, or gameplay wiring.

## Gameplay — Feature Freeze v2

Use the compile-clean Armory scaffold as the implementation baseline, but treat final UMG presentation and runtime acceptance as part of this Astra pass. The final implementation must match the frozen authority/economy contracts in `ARMORY_ECONOMY_SPEC.md`, `ARMORY_UI_SPEC.md`, and `VERSE_GAMEPLAY_INTEGRATION.md`.

Locked player-facing target:
- FFA.
- 12-player primary target; correct up to 16.
- **45-second opening Armory phase**.
- Native round clock **10:45**, leaving approximately 10 minutes of combat.
- First to 30 eliminations wins through native Island Settings.
- Join in progress allowed.
- Building/harvesting/destruction off as already specified.
- 100 health / 100 shield; overshield off.
- Sprint, slide, mantle, crouch on; fall damage off.
- Native ~3-second respawn and ~2-second immunity remain.
- Native **Health Granted on Elimination = 50** remains.
- Infinite Reserve Ammo on; Infinite Magazine Ammo off.
- Eliminated items delete; manual item dropping remains disabled.

### Armory economy

`ARMORY_ECONOMY_SPEC.md` is authoritative.

Alpha economy:
- currency: **Scrap**,
- starting bank: **3,000**,
- bank cap: **5,000**,
- elimination reward: **+150**,
- death recovery: **1,500 → 1,750 → 2,000 cap** across consecutive deaths without an elimination,
- any elimination resets that player's recovery tier,
- purchases are for one life,
- an uncommitted cart refunds 100%,
- committed life purchases are non-refundable,
- a free fallback sidearm is always available,
- players may queue a Next Loadout while alive,
- JIP receives a protected first-buy opportunity.

The catalog must remain editor-configurable/data-driven so seasonal weapons, price changes, featured rotations, and future reward hooks do not require rewriting the economy state machine.

### Production authority split

Native UEFN owns:
- score,
- 30-elimination victory,
- round timeout,
- spawn coordinates/selection,
- health/shield and 50-point sustain,
- respawn rules,
- movement/destruction/ammo/drop rules.

The narrow Armory Verse may own only:
- Scrap balances and recovery tiers,
- catalog/loadout/cart state,
- buy/sell/refund math,
- Armory UI,
- 45-second opening buy gate,
- JIP first-buy gate,
- temporary legitimate shop protection,
- granting committed catalog items,
- player UI/state cleanup.

Do not create a custom FFA score manager, End Game path, match Timer authority, spawn solver, or custom siphon.

### Candidate gameplay objects

The currently frozen candidate architecture is:
- Island Settings,
- **19 × Player Spawn Pad**,
- **1 × `TR_Eliminations` Tracker** for HUD only,
- **1 × `IG_Armory` Item Granter** containing catalog weapons in stable index order,
- **1 × `EM_Economy` Elimination Manager** used only as the eliminator-income event source,
- **1 × `IT_Armory` Input Trigger** used only for Armory open/reopen input,
- **1 × `scrapline_armory_device` Verse device**.

`IG_Armory` should grant exact selected items by registered index. `EM_Economy` must not drop reward items and must keep **Valid On Self Elimination = Off**. Victim recovery/shop state comes from the per-player `fort_character.EliminatedEvent()` watcher, not `EM_Economy.EliminatedEvent`. `TR_Eliminations` must not increment manually or end the round.

The old fixed `IG_Loadout` + direct Spawn Pad → Grant Item path is retired only after the Armory implementation validates.

### Astra Armory completion task

The current Armory logic/event scaffold is a starting point, not a visual-finish requirement.

During this build Astra must:
- preserve Island Settings as sole score/end authority and native Player Spawn Pads as sole spawn-selection authority,
- **reuse the existing tagged `IG_Armory`, `EM_Economy`, and `IT_Armory` actors; do not create a second tagged copy of any exact-one role,**
- verify the live first-release `IG_Armory` still contains exactly 7 registered items at indices 0..6 and keep Verse `RegisteredItemCount = 7` synchronized with that device before testing,
- keep production `EM_Economy` **Valid On Self Elimination = Off**; verify the one-per-player death watcher handles self/manual/environmental deaths with recovery/protected-buy and that none of those deaths earn +150 Scrap or reset recovery,
- test simultaneous/trade eliminations for one eliminator reward per qualifying kill, one victim death payment per eliminated player, and deterministic recovery-tier behavior,
- verify native ~2-second spawn immunity is not shortened by Armory stasis/vulnerability release,
- keep the narrow Armory Verse ownership boundary,
- finish or rebuild `WBP_ScraplineArmory` to the approved scalable browser in `ARMORY_UI_SPEC.md`,
- use category tabs + an approximately 8-card paged weapon browser + a separate loadout/cart rail,
- avoid the earlier oversized pure-Verse/debug menu and avoid dominant default Fortnite pill-button presentation,
- preserve UEFN validation requirements; do not use restricted K2 Blueprint graph content,
- if Custom Button styling is constrained, keep Epic's required content class and use validator-safe transparent hitboxes over Scrapline-owned flat card surfaces,
- validate mouse/controller interaction, Ready, Re-buy, Clear, category/page navigation, Next Loadout, JIP, respawn, self/manual/environmental death, leave cleanup, duplicate watchers/subscriptions, protected-shop input deadlines, and economy bounds,
- compile accepted Verse with live Epic UEFN at zero diagnostics,
- document exact final catalog Item Granter indexes and editor wiring.

The rejected UEFN Central five-file package remains comparison evidence only and must not be imported.

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
- gameplay/economy wiring matches the frozen Armory/native authority contract,
- `WBP_ScraplineArmory` meets `ARMORY_UI_SPEC.md` and passes the required in-game interaction checks,
- the Armory lifecycle/economy/multiplayer acceptance matrix passes,
- accepted Armory Verse code compiles with zero live UEFN diagnostics,
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
