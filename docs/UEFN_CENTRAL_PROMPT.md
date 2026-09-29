# Scrapline — UEFN Central Project Generator Prompt

## Status

**EXPERIMENT COMPLETED 2026-09-29 — retained for provenance and future gap-specific reuse.**

The agreed authenticated-browser Project Generator experiment was completed after the native control baseline had been validated.

- first attempt `4b6861de-6c4d-5292-9a65-ad6f7eb0ee1d`: failed during planning with no completed output,
- successful attempt `6e9b9891-1848-5b65-8289-50521fc26c9b`: completed, generated five Verse files, and was marked **Not validated** by UEFN Central,
- full output and independent audit: `UEFN_CENTRAL_GENERATOR_RESULT.md`.

The generated architecture did not provide a concrete reliability advantage and introduced compiler/API defects, lifecycle gaps, duplicate score/end authority, extra wiring, and a 16-spawn-pad contradiction. It was rejected without being copied into the live project.

Current native Island Settings and devices cover Scrapline's locked first-alpha gameplay baseline, including 50-point elimination sustain, 30-elimination round end, JIP, respawn/immunity, loadout-on-spawn, and elimination HUD tracking. The live Scrapline project compiles with zero Verse diagnostics after removing the redundant optional siphon file.

## Reuse rule

Do **not** rerun this full request merely to create code for its own sake. Reopen generator work only when `VERSE_GAMEPLAY_INTEGRATION.md` records a demonstrated native-device gap, and ask for the smallest code needed to close that specific gap.

If reopened, do not ask UEFN Central to generate terrain, map geometry, environment art, spawn coordinates, or other frozen construction responsibilities.
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

## Experiment control overlay used on 2026-09-29

The following instructions were appended verbatim to the base prompt above for the completed experiment:

---

Scrapline already has a validated native-device baseline using Island Settings, 19 Player Spawn Pads, one Item Granter, and one Tracker, with zero production custom Verse.

Do not generate Verse merely because this is a Verse generator.

Treat the native baseline as the control case.

Only introduce custom Verse where it provides a concrete reliability, multiplayer-lifecycle, join-in-progress, scoring, loadout, HUD, spawn, or device-wiring advantage over native Creative behavior.

For every custom Verse responsibility you propose, explicitly state:

1. What native device/settings alternative exists.
2. Why the Verse implementation is materially better or more reliable.
3. What @editable references it requires.
4. How player join, leave, respawn, and join-in-progress are handled.
5. Whether any event can be subscribed more than once.
6. What happens if a player leaves while state exists for them.
7. What happens at the 30-elimination win condition and the 10-minute timeout.
8. Whether the implementation creates a second competing scoring or end-game authority.

Prefer the smallest architecture possible.

A one-file solution is preferable to 3–8 files if it safely satisfies the requirements.

Do not make Verse own:

- terrain
- map layout
- spawn coordinates
- asset placement
- environment construction
- lighting
- VFX placement
- asset discovery

At the end include:

NATIVE BASELINE VS GENERATED ARCHITECTURE

Compare the generated solution directly against the native Island Settings + Player Spawn Pad + Item Granter + Tracker implementation and state which architecture you would actually ship for this specific simple FFA.
