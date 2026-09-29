# Scrapline — Astra One-Shot Prompt Draft

> **READY FOR USER AUTHORIZATION — DO NOT EXECUTE WITHOUT EXPLICIT AUTHORIZATION.** The map/design/asset freeze and gameplay integration are complete. The first-alpha gameplay layer is validated as native-device only; no production custom Verse is required.

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
10. `docs/VERSE_GAMEPLAY_INTEGRATION.md` — **gameplay/device-wiring authority**
11. `docs/ASSET_MANIFEST.md` — **asset-approval authority**
12. `docs/ASSET_PIPELINE.md`
13. `docs/TOOLING.md`
14. `docs/BUILD_READINESS.md`

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
14. Wire the validated native gameplay package from `VERSE_GAMEPLAY_INTEGRATION.md`; do not add custom Verse unless a specific blocking native-device failure is demonstrated.
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
- Native **Health Granted on Elimination = 50**.
- Use native Island Settings + Tracker + Item Granter + Player Spawn Pads; no End Game device or custom Verse is required for the baseline.

## Validated gameplay / device integration

The locked first-alpha gameplay package is **native-device only**. Do not generate or place a Verse creative_device for the baseline.

### Required gameplay objects

- Island Settings.
- **19 × Player Spawn Pad**, one per frozen candidate spawn region.
- **1 × Item Granter**, rename `IG_Loadout`.
- **1 × Tracker**, rename `TR_Eliminations`.

Current live UEFN catalog identities verified on 2026-09-29:
- Player Spawn Pad: `/CRD_PlayerSpawn/ItemDefinitions/PID_Device_PlayerSpawnPad.PID_Device_PlayerSpawnPad`
- Item Granter: `/CreativeCoreDevices/SetupAssets/PID_Device_ItemGranter.PID_Device_ItemGranter`
- Tracker: `/CreativeCoreDevices/SetupAssets/PID_Device_Tracker.PID_Device_Tracker`

Do **not** add an End Game device, Elimination Manager, health-restoration device, HUD Message device, Class Designer, Team Settings & Inventory device, or custom Verse manager unless a blocking test proves the native baseline cannot work.

### Island Settings

Set:
- Max Players: **16**; intended fill target remains 12.
- Teams: **Free for All**.
- Total Rounds: **1**.
- Time Limit: **10 Minutes**.
- Eliminations to End: **30**.
- Round Win Condition: **Eliminations**.
- Last Standing Ends Game: **Off**.
- Spawn Location: **Spawn Pads**.
- Spawn Pad Selection: **Random**.
- Respawn Type: **Individual**.
- Respawn Time: **3 Seconds**.
- Override Spawn Immunity Time: **Yes**.
- Spawn Immunity Time: **2 Seconds**.
- Only Allow Respawn if Spawn Pads Found: **On**.
- Spawn Limit: **Infinite**.
- Join in Progress: **Spawn**.
- Starting Health Percentage: **100%**.
- Max Health: **100**.
- Allow Health Recharge: **Off**.
- Starting Shield Percentage: **100%**.
- Max Shields: **100**.
- Allow Shield Recharge: **Off**.
- Allow Overshield: **Off**.
- Locomotion Preset: **Custom**.
- Fall Damage: **Off**.
- Allow Mantling: **On**.
- Allow Sprinting: **On**.
- Allow Sliding: **On**.
- Preserve normal crouch input; do not disable it.
- Allow Building: **None**.
- Maximum Building Resources: **0**.
- Infinite Building Resources: **Off**.
- Infinite Reserve Ammo: **On**.
- Infinite Magazine Ammo: **Off**.
- Infinite Consumables: **Off**.
- Allow Item Drop: **No**.
- Maximum Equipment Slots: **3**.
- Start with Pickaxe: **No**.
- Eliminated Player's Items: **Delete**.
- Environment Damage: **Off**.
- Structure Damage: **None**.
- Weapon Destruction: **None**.
- Pickaxe Destruction: **None**.
- Health Granted on Elimination: **50**.
- Wood/Stone/Metal/Gold Granted on Elimination: **0**.
- Max Trackers on HUD: **1**.
- Show Elimination Feed: **Yes**.

This native configuration owns authoritative match end, timer fallback, respawn rules, JIP, ammo behavior, drop cleanup, destruction rules, and the 50-point health-then-shield elimination sustain.

### `IG_Loadout`

Register exactly three current Fortnite weapons in this order:
1. shotgun-class,
2. rifle-class,
3. SMG- or sidearm-class.

Set:
- Enabled on Game Start: **Yes**.
- Receiving Players: **Triggering Player**.
- On Grant Action: **Clear Items**.
- Grant: **All Items**.
- Grant Condition: **Always**.
- Equip Granted Item: **First Item**.
- Drop Items at Player Location: **Never**.

Do not hard-code seasonal weapon asset IDs.

### `TR_Eliminations`

Set:
- Stat to Track: **Eliminations**.
- Target Value: **30**.
- Starting Value: **0**.
- Valid Team: **Any**.
- Assign on Game Start: **On**.
- Assign When Joining in Progress: **On**.
- Sharing: **Individual**.
- Target Team: **Any**.
- Target Class: **Any**.
- When Target Is Reached: **Do Nothing**.
- Show on HUD: **Detailed**.
- Use Persistence: **Off**.

The Tracker is HUD feedback only. Island Settings ends the round; do not create a second end-game path.

### Direct event binding

For **each of the 19 Player Spawn Pads**:
- **On Player Spawned → IG_Loadout / Grant Item**.

The spawning player is the instigator; `Receiving Players = Triggering Player` grants only that player's loadout.

### Verse

**Production custom Verse package: empty.**

There are no `@editable` references and no Verse actor to place. The live Scrapline project was compiled through Epic UEFN MCP after removing the redundant local siphon candidate and returned **zero Verse diagnostics**.

This is intentional. Native devices account for initial players, JIP, player leave, eliminations, HUD progress, win condition, sustain, loadout, and respawns without subscription/state cleanup risk.

Verse must not own terrain, asset placement, spawn coordinates, environment layout, lighting, VFX, or any other environment-construction responsibility.

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
- basic loadout/gameflow is wired exactly as specified above,
- live Verse build remains clean with no production custom Verse files,
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
