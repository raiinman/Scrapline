# Scrapline — Gameplay Specification

## Status

**Baseline locked and gameplay integration validated for the first one-shot alpha.**

These values are derived from the locked ~140 m × 140 m arena and 12-player density target. Testing may tune numbers later, but Astra should build the first playable version to this baseline rather than inventing new rules.

The first-alpha implementation is intentionally **native-device first**. No production custom Verse is required; see `VERSE_GAMEPLAY_INTEGRATION.md` for the exact validated settings and wiring.

## Match Structure

- Mode: **Free For All**.
- Primary target: **12 players**.
- Project ceiling: **16 players**.
- Building: **Off**.
- Harvesting: **Off**.
- Environment destruction: **Off where practical** so combat cover and routes remain stable.
- Join in progress: **Allowed / Spawn**.
- Round count: **1**.
- Match time limit: **10 minutes**.
- Primary win condition: **first player to 30 eliminations**.
- Time-limit fallback: **most eliminations** through the native Round Win Condition.

Keep the alpha simple. Do not add teams, classes, objectives, economy, persistence, or progression systems.

## Player Baseline

- Health: **100**, starting full.
- Shield: **100**, starting full.
- Overshield: **Off**.
- Sprinting: **On**.
- Sliding: **On**.
- Mantling: **On**.
- Crouching: preserve normal Fortnite crouch input.
- Fall damage: **Off**.
- Health recharge: **Off**.
- Shield recharge: **Off**.

## Respawn

- Respawn delay: **3 seconds**.
- Spawn immunity: **2 seconds** with Island Settings override enabled.
- Spawn Location: **Spawn Pads**.
- Spawn Pad Selection: **Random**.
- Respawn Type: **Individual**.
- Spawn Limit: **Infinite**.
- Only Allow Respawn if Spawn Pads Found: **On**.
- Join in Progress: **Spawn**.
- Use **19 placed Player Spawn Pad devices**, one per frozen candidate region.
- Native spawn behavior owns actual selection. Do not write a custom spawn solver.
- Exact pad transforms may move only inside the frozen region/local-fit tolerance unless a documented safety failure requires otherwise.
- Players receive the full standard loadout on every initial spawn, respawn, and JIP spawn.
- Eliminated inventory is deleted and manual item dropping is disabled so dropped-item accumulation cannot build up.

## Loadout

Use one native Item Granter named `IG_Loadout`.

Register exactly three current Fortnite weapons in order:
1. one close-range shotgun-class weapon,
2. one medium-range rifle-class weapon,
3. one SMG- or sidearm-class weapon.

Do not hard-code seasonal weapon asset names in Verse or durable gameplay logic.

`IG_Loadout`:
- Receiving Players: **Triggering Player**.
- On Grant Action: **Clear Items**.
- Grant: **All Items**.
- Grant Condition: **Always**.
- Equip Granted Item: **First Item**.
- Drop Items at Player Location: **Never**.

For every Player Spawn Pad, wire:
**On Player Spawned → IG_Loadout / Grant Item**.

Ammo:
- Infinite Reserve Ammo: **On**.
- Infinite Magazine Ammo: **Off**.
- Preserve normal magazine/reload behavior.
- No mobility consumables or healing inventory in the first alpha.

## Elimination Sustain

Use the native Island Setting:

- **Health Granted on Elimination: 50**.

Current Epic behavior grants health up to max health and then applies any excess to shields, which matches Scrapline's required 50-point total health/shield sustain under the 100 health / 100 shield caps.

Do not add a siphon Verse device or restoration device for the baseline.

## Scoring / HUD

Island Settings owns the authoritative win condition:
- Eliminations to End: **30**.
- Round Win Condition: **Eliminations**.
- Time Limit: **10 minutes**.

Use one Tracker named `TR_Eliminations` for HUD feedback:
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

The Tracker must not also end the round; that would create two competing end-game paths.

The scoreboard should prioritize eliminations and deaths. Avoid custom animated UI for the alpha.

## Native Device Set

Required:
- Island Settings,
- 19 × Player Spawn Pad,
- 1 × Item Granter (`IG_Loadout`),
- 1 × Tracker (`TR_Eliminations`).

Not required:
- End Game device,
- Elimination Manager device,
- HUD Message device,
- Class Designer,
- Team Settings & Inventory,
- health/shield restoration device,
- custom Verse creative_device.

## Verse Responsibilities

**None for the locked first alpha.**

The live Scrapline project compiler passes with no custom Verse files. This is deliberate, not an omission.

Do not add Verse for:
- elimination sustain,
- score tracking,
- match end,
- JIP handling,
- player-leave cleanup,
- loadout granting,
- spawn selection,
- terrain,
- asset placement,
- spawn transforms,
- lighting,
- VFX,
- asset discovery,
- environment construction.

Only reopen custom Verse after a specific playtest demonstrates a requirement that the validated native path cannot satisfy.

## Multiplayer Lifecycle

The native setup accounts for multiplayer lifecycle without custom state:
- game-start players receive the Tracker automatically,
- JIP players spawn and receive the Tracker automatically,
- every spawn event grants the fixed loadout to the spawning player,
- departing players leave no Verse subscriptions/state/tasks to clean up,
- duplicate event-subscription risk is zero.

## Alpha Exclusions

Do not add these during the one-shot unless explicitly reopened later:
- Gun Game progression,
- random loadouts,
- kill streak rewards,
- moving storms,
- capture points,
- NPCs,
- bosses,
- vehicles as gameplay,
- persistent stats,
- XP/accolade farming systems,
- economy/currency,
- custom matchmaking,
- complex power-up rotations,
- bespoke mobility mechanics.

## Validation Targets

After the primary construction pass:
- 12-player target has enough spawn coverage.
- Typical respawn reaches meaningful cover quickly.
- No single roof/perch controls the arena.
- 30 eliminations is achievable within roughly the 10-minute match window by the leading player in an active lobby.
- Close-, medium-, and limited long-range combat all occur.
- Spawn immunity does not become exploitable.
- Native 50-point elimination sustain improves flow without making the leader effectively unkillable.
- JIP players receive Tracker + loadout correctly.
- Leaving players do not disturb active scoring/end conditions.

Tune only after these observations exist; do not preemptively add complexity.
