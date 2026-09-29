# Scrapline — Gameplay Specification

## Status

**Baseline locked for the first one-shot alpha.**

These values are derived from the locked ~140 m x 140 m arena and 12-player density target. Testing may tune numbers later, but Codex and UEFN Central should build the first playable version to this baseline rather than inventing their own rules.

## Match Structure

- Mode: **Free For All**.
- Primary target: **12 players**.
- Project ceiling: **16 players**.
- Building: **Off**.
- Harvesting: **Off**.
- Environment destruction: **Off where practical** so combat cover and routes remain stable.
- Join in progress: **Allowed**.
- Round count: **1**.
- Match time limit: **10 minutes**.
- Primary win condition: **first player to 30 eliminations**.
- Time-limit fallback: highest elimination score when the timer expires.

Keep the alpha simple. Do not add teams, classes, objectives, economy, persistence, or progression systems.

## Player Baseline

- Health: **100**.
- Shield: **100**.
- Overshield: **Off** for the first alpha.
- Sprinting: **On**.
- Sliding: **On**.
- Mantling: **On**.
- Crouching: **On**.
- Fall damage: **Off** to support fast drops from the limited elevated routes.

## Respawn

- Respawn delay: approximately **3 seconds**.
- Spawn immunity: approximately **2 seconds**.
- Spawn selection should primarily use **18–20 placed Player Spawn devices** and native spawn safety/enemy-range behavior.
- Do not write a complex custom Verse spawn solver unless playtesting proves native spawn behavior inadequate.
- Players should respawn with the full standard loadout.
- No dropped inventory should accumulate around death locations.

## Loadout Philosophy

Use a fixed, readable FFA loadout rather than random weapons in the first alpha.

Target roles:
1. one close-range shotgun-class weapon,
2. one medium-range rifle-class weapon,
3. one SMG or sidearm-class weapon.

Do not hard-code seasonal weapon asset names in Verse.

Use editable Item Granter/device references so the exact current Fortnite weapons can be configured in UEFN without rewriting the gameplay manager.

Ammo:
- infinite reserve ammo is acceptable,
- preserve normal magazine/reload behavior,
- do not use infinite magazine unless testing strongly favors it.

No mobility consumables or healing inventory in the first alpha. The environment and basic movement should define traversal.

## Elimination Sustain

Target a **50-point health/shield restoration on elimination**, capped by the player's normal health + shield maximum.

Prefer a supported native device or current Verse API that compiles cleanly. If this introduces unnecessary complexity, the alpha may temporarily ship without siphon rather than using brittle code.

## Scoring / HUD

- Elimination = **+1 score**.
- Death = no score penalty.
- Goal = **30 eliminations**.
- Show the player's current elimination count and the target score using the simplest reliable native Tracker/HUD approach.
- The scoreboard should prioritize eliminations and deaths.
- Avoid custom animated UI for the alpha.

## Native Devices First

Use Creative devices for stable editor-owned behavior whenever they already solve the problem cleanly.

Expected device categories may include:
- Player Spawn Pads,
- Item Granters,
- Tracker device,
- End Game device,
- HUD Message device if needed,
- health/shield restoration device if useful,
- Island Settings / Experience Settings.

Verse should orchestrate behavior that genuinely benefits from code rather than reimplementing every device.

## Verse Responsibilities

The Verse layer should remain small and multiplayer-safe.

Likely responsibilities:
- subscribe to player join/leave events,
- track or observe eliminations if native Tracker behavior is insufficient,
- trigger the win/end-game condition,
- apply elimination sustain if required,
- coordinate a minimal score HUD if native devices cannot meet the requirement,
- clean up subscriptions/state when players leave.

Do not make Verse responsible for terrain, asset placement, spawn transforms, weapon asset discovery, or environment construction.

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

The first one-shot succeeds if Scrapline is visually strong, immediately readable, and produces reliable repeated FFA fights.

## Validation Targets

After the primary construction pass:

- 12-player target has enough spawn coverage.
- Typical respawn reaches meaningful cover quickly.
- No single roof/perch controls the arena.
- 30 eliminations is achievable within roughly the 10-minute match window by the leading player in an active lobby.
- Close-, medium-, and limited long-range combat all occur.
- Spawn immunity does not become exploitable.
- Elimination sustain improves flow without making the leader effectively unkillable.
- Device/Verse behavior remains correct for join-in-progress and player leave events.

Tune only after these observations exist; do not preemptively add complexity.