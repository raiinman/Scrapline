# Scrapline — UEFN Central Project Generator Prompt

## Use

Paste the prompt below into UEFN Central's **Project Generator** after the Scrapline environment/device plan is ready.

Do not ask UEFN Central to generate terrain, map geometry, or environment art. Its job is the small, robust Verse/gameplay layer.

## Prompt

Build a production-quality but intentionally small Verse gameplay package for a UEFN project named **Scrapline**.

Scrapline is a compact post-apocalyptic industrial scrapyard **Free For All** arena. The environment and spawn locations are built separately in UEFN. Generate only the gameplay Verse architecture and a precise editor setup guide.

Target the **current UEFN / Verse API** available to your validator. Do not use deprecated, guessed, or undocumented APIs. Prefer native Creative devices over custom Verse whenever devices already solve a requirement reliably.

### Match rules

- Free For All.
- Designed for 12 players; must remain correct up to 16.
- One 10-minute round.
- First player to 30 eliminations wins immediately.
- If the timer expires first, use the highest elimination score through the simplest reliable UEFN-native end-condition path.
- Join in progress is allowed.
- Building off.
- Harvesting off.
- Environment destruction should remain disabled through island/editor settings, not custom Verse.
### Player rules

- 100 health.
- 100 shield.
- No overshield.
- Sprint, slide, mantle, and crouch enabled through island/editor settings.
- Fall damage off.
- Respawn delay about 3 seconds.
- Spawn immunity about 2 seconds.
- Native Player Spawn devices handle actual spawn placement and enemy-range safety; do not build a custom spawn-selection algorithm.

### Loadout

The exact weapons must remain editor-configurable.

Use editable Item Granter device references or another current supported native device workflow rather than hard-coding seasonal weapon asset identifiers.

Target three roles:
1. shotgun-class close-range weapon,
2. rifle-class medium-range weapon,
3. SMG/sidearm-class weapon.

Players receive the full standard loadout on spawn/respawn.

Use infinite reserve ammo if that is best configured through island/device settings, but preserve normal reload/magazine behavior.

Disable dropped-item accumulation through native settings where possible.

### Elimination sustain

On an elimination, restore a total of 50 health/shield points to the eliminator, capped at the normal 100 health + 100 shield maximum.

Prefer a current supported device or Verse implementation that validates cleanly. Keep this isolated so it can be disabled without affecting the rest of the game if needed.
### Score and HUD

- Each elimination adds 1.
- Death has no score penalty.
- Goal is 30 eliminations.
- Prefer native Tracker / HUD / scoreboard systems.
- Only add Verse HUD code if native devices cannot provide the required current-score / target-score information cleanly.
- No elaborate custom UI or animation.

### Architecture requirements

Keep the codebase as small as practical.

Do not create 8 files just because the generator supports it. Use multiple files only where they materially improve clarity or lifecycle safety.

A likely architecture is:
- one main Scrapline FFA manager creative_device,
- an optional small player-state/helper file only if actually necessary,
- an optional HUD/helper file only if native Tracker/HUD devices are insufficient.

The system must:
- handle players already present when the device starts,
- handle players joining later,
- handle players leaving,
- avoid duplicate event subscriptions,
- clean up per-player state,
- correctly track eliminations in multiplayer,
- trigger a configured End Game device or current equivalent at 30 eliminations,
- avoid persistent storage and external services.

Expose required devices as @editable references with clear names.
### Editor-owned responsibilities

Do NOT put these in Verse:
- terrain or Landscape generation,
- asset placement,
- spawn-pad coordinates,
- environment art,
- weapon asset discovery,
- lighting,
- VFX placement,
- matchmaking services,
- persistence,
- XP/accolade farming.

### Deliverables

1. All required .verse files.
2. Code that passes your current compiler/API validation.
3. A short architecture explanation.
4. A device checklist naming every Creative device that must be placed.
5. Exact @editable wiring instructions.
6. Island/Experience Settings that should be configured manually rather than in Verse.
7. A first-test checklist for 1-player, 2-player, and join-in-progress testing.
8. Clearly label any requirement that the current API cannot implement reliably and give the simplest native-device alternative.

Optimize for reliability, simplicity, multiplayer correctness, and easy integration by Codex through Epic UEFN MCP.

Do not invent additional game mechanics.