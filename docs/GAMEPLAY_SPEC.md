# Scrapline — Gameplay Specification

## Status

**Feature Freeze v2 locked; Armory implementation validation pending.**

These values are derived from the locked ~140 m × 140 m arena and 12-player density target. Testing may tune economy numbers later, but implementation must use the frozen alpha rules rather than inventing new mechanics.

The gameplay architecture is now **native-authority + narrow custom Armory Verse**. Island Settings remains authoritative for scoring, match end, spawning rules, health/shield, sustain, movement, destruction, and inventory cleanup. `ARMORY_ECONOMY_SPEC.md` authorizes custom Verse only for match-local Scrap, buy/sell UI, catalog/loadout state, Armory phase gating, JIP buy handling, loadout grants, and cleanup. The rejected UEFN Central five-file package remains evidence only.

## Match Structure

- Mode: **Free For All**.
- Primary target: **12 players**.
- Project ceiling: **16 players**.
- Building: **Off**.
- Harvesting: **Off**.
- Environment destruction: **Off where practical** so combat cover and routes remain stable.
- Join in progress: **Allowed / Spawn**.
- Round count: **1**.
- Native round time limit: **10 minutes 45 seconds**.
- Opening Armory phase: **45 seconds**.
- Intended combat window after the opening phase: approximately **10 minutes**.
- Primary win condition: **first player to 30 eliminations**.
- Time-limit fallback: **most eliminations** through the native Round Win Condition.

Keep the alpha focused. Do not add teams, objective modes, persistent wallets, permanent unlock trees, or progression systems.

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
- Players receive the committed Armory loadout for the current life.
- Eliminated inventory is deleted and manual item dropping is disabled so dropped-item accumulation cannot build up.
- Native spawn selection remains untouched; the Armory only reacts after a player has spawned.

## Armory / Loadout Economy

`ARMORY_ECONOMY_SPEC.md` is authoritative for the full economy contract.

Locked alpha summary:
- currency: **Scrap**,
- starting bank: **3,000**,
- bank cap: **5,000**,
- elimination reward: **+150**,
- death recovery: **+1,500**, then **+1,750**, then **+2,000 cap** across consecutive deaths without an elimination,
- any elimination resets that player's recovery tier,
- 45-second global opening buy phase,
- match-local currency only,
- loadout purchase is for one life,
- 100% refund while editing an uncommitted cart,
- no refund after the life begins,
- free fallback sidearm always available,
- next-life loadout may be queued while alive,
- JIP gets a protected first-buy opportunity.

Use one Item Granter named `IG_Armory` with catalog weapons registered in a stable order. Verse grants exact selections with the current Item Granter index API rather than hard-coding seasonal weapon asset IDs.

The three alpha equipment slots are:
1. Primary,
2. Secondary,
3. Sidearm.

Ammo remains:
- Infinite Reserve Ammo: **On**.
- Infinite Magazine Ammo: **Off**.
- Preserve normal magazines and reloads.
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
- Time Limit: **10 minutes 45 seconds total**, including the 45-second non-combat Armory phase.

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

## Production Device Set

Required:
- Island Settings,
- 19 × Player Spawn Pad,
- 1 × Item Granter (`IG_Armory`) containing the active catalog in stable index order,
- 1 × Tracker (`TR_Eliminations`),
- 1 × Elimination Manager (`EM_Economy`) as an economy event source only,
- 1 × Verse creative device (`scrapline_armory_device`).

Not required for match authority:
- End Game device,
- Timer device,
- custom Verse score manager,
- health/shield restoration device.

## Verse Responsibilities

Custom Verse is authorized **only** for the Armory/economy boundary frozen in `ARMORY_ECONOMY_SPEC.md`.

It may own:
- match-local Scrap,
- recovery tiers,
- current/previous/queued loadout state,
- catalog validation,
- buy/sell/refund math,
- Armory UI,
- the 45-second opening buy gate,
- JIP first-buy gating,
- post-spawn loadout granting,
- temporary legitimate shop stasis/visibility/vulnerability protection,
- player UI/state cleanup on leave.

It must not own:
- elimination score,
- 30-elimination victory,
- native match timeout/end,
- spawn coordinates/selection,
- elimination sustain,
- terrain or environment construction.

The rejected UEFN Central five-file manager package remains quarantined and is not a starting point.

## Multiplayer Lifecycle

The Armory lifecycle must:
- initialize all players already present when the Verse device begins,
- subscribe once to playspace PlayerAddedEvent / PlayerRemovedEvent,
- subscribe once to the 19 Player Spawn Pad SpawnedEvent sources,
- use `EM_Economy` Eliminator/Eliminated events instead of per-character respawn-sensitive elimination subscriptions,
- provide protected first-buy handling for JIP,
- remove player UI and match-local economy/loadout state on leave,
- prevent duplicate grants/rewards across repeated death, respawn, JIP, and UI-open cycles.

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
- persistent Scrap wallets or permanent weapon unlocks,
- XP/accolade farming systems,
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
- JIP players receive Tracker + protected first-buy + correct committed loadout.
- Scrap charges/rewards happen exactly once and respect the 0–5,000 bounds.
- Recovery tiers step 1,500 → 1,750 → 2,000 and reset after an elimination.
- Rebuy and queued Next Loadout behave correctly across death/respawn.
- The 45-second opening phase leaves approximately 10 minutes of combat.
- Leaving players clean up Armory state without disturbing native scoring/end conditions.
- No Armory event path can create a second score or end-game authority.

Economy tuning should follow observation; architecture must remain data-driven rather than hard-coding seasonal weapon identities.
