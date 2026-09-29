# Scrapline — Verse / Gameplay Integration Phase

## Status

**COMPLETE — native-first gameplay integration validated 2026-09-29.**

The pre-build hold was lifted for this phase. The gameplay baseline is now resolved without production custom Verse because current native UEFN settings/devices cover the full locked first-alpha requirement more reliably.

A local optional siphon Verse candidate was compiler-valid in the live Scrapline project, but it was removed after current Epic settings confirmed that `Health Granted on Elimination = 50` provides the exact required health-then-shield sustain behavior. The project was compiled again after removal with zero live Verse diagnostics.

Astra environment construction is still **not authorized**. This phase only closes the gameplay-integration gate.

## Governing authorities

Read before gameplay implementation:
1. `AGENTS.md`
2. `docs/AGENTS.md`
3. `docs/GAMEPLAY_SPEC.md`
4. this document
5. `docs/SPATIAL_CONTRACT.md`
6. `docs/ASSET_MANIFEST.md`
7. `docs/PHYSICAL_FIT_VERIFICATION.md`
8. `docs/TOOLING.md`
9. `docs/ONE_SHOT_PROMPT_DRAFT.md`
10. `docs/BUILD_READINESS.md`

Gameplay integration must not reopen map design. `SPATIAL_CONTRACT.md` remains the placement authority.

## Production architecture

### Custom Verse

**None for the first alpha.**

There are:
- no production `.verse` files,
- no Verse creative_device actor to place,
- no `@editable` references to wire,
- no per-player Verse state,
- no player-added/player-removed subscriptions,
- no custom elimination subscription,
- no custom win/end-game code.

Do not reintroduce the removed siphon device, an End Game bridge, or a custom FFA manager unless a specific live playtest proves the native path inadequate.

### Required native gameplay objects

Use exactly these gameplay elements for the baseline:
- **Island Settings** — match, player, spawn, elimination sustain, inventory, movement, destruction, and win conditions.
- **19 × Player Spawn Pad** — one in each frozen candidate spawn region; native placement/selection owns actual spawning.
- **1 × Item Granter**, rename to `IG_Loadout` — fixed three-weapon loadout on every spawn/respawn/JIP spawn.
- **1 × Tracker**, rename to `TR_Eliminations` — individual 0/30 elimination HUD progress.

Not required for the baseline:
- End Game device,
- Elimination Manager device,
- HUD Message device,
- Class Designer,
- Team Settings & Inventory,
- health/shield restoration device,
- Verse creative_device.

Live UEFN device catalog paths verified 2026-09-29:
- Player Spawn Pad: `/CRD_PlayerSpawn/ItemDefinitions/PID_Device_PlayerSpawnPad.PID_Device_PlayerSpawnPad`
- Item Granter: `/CreativeCoreDevices/SetupAssets/PID_Device_ItemGranter.PID_Device_ItemGranter`
- Tracker: `/CreativeCoreDevices/SetupAssets/PID_Device_Tracker.PID_Device_Tracker`

## Exact Island Settings baseline

### Structure / round
- Max Players: **16**. Scrapline's intended fill target remains 12.
- Teams: **Free for All**.
- Total Rounds: **1**.
- Time Limit: **10 Minutes**.
- Eliminations to End: **30**.
- Round Win Condition: **Eliminations**.
- Last Standing Ends Game: **Off**.

This gives immediate round end at 30 eliminations and uses most eliminations as the 10-minute fallback.

### Spawning
- Spawn Location: **Spawn Pads**.
- Spawn Pad Selection: **Random**.
- Respawn Type: **Individual**.
- Respawn Time: **3 Seconds**.
- Override Spawn Immunity Time: **Yes**.
- Spawn Immunity Time: **2 Seconds**.
- Only Allow Respawn if Spawn Pads Found: **On**.
- Spawn Limit: **Infinite**.
- Join in Progress: **Spawn**.

Do not implement custom spawn coordinates or selection logic. Final transforms stay inside the 19 frozen regions and their documented local-fit tolerances.

### Health / shields / movement
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
- Preserve normal crouch input; do not override/disable crouching.

### Inventory / building / destruction
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

Normal magazines and reload timing therefore remain intact while reserve ammunition is unlimited.

### Elimination sustain / HUD
- Health Granted on Elimination: **50**.
- Wood/Stone/Metal/Gold Granted on Elimination: **0**.
- Max Trackers on HUD: **1**.
- Show Elimination Feed: **Yes**.

Epic's current Island Settings behavior awards elimination health above max health as shield, so this implements the requested 50-point total sustain without custom code.

## Exact Item Granter setup — `IG_Loadout`

Register exactly three current Fortnite weapons in this order:
1. shotgun-class weapon,
2. rifle-class weapon,
3. SMG- or sidearm-class weapon.

Do not hard-code seasonal weapon asset IDs in Verse or documentation.

Set:
- Enabled on Game Start: **Yes**.
- Receiving Players: **Triggering Player**.
- On Grant Action: **Clear Items**.
- Grant: **All Items**.
- Grant Condition: **Always**.
- Equip Granted Item: **Yes / First Item**.
- Drop Items at Player Location: **Never**.

Island Settings owns reserve ammo. Leave the weapons' normal magazine/reload behavior intact.

## Exact Tracker setup — `TR_Eliminations`

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

The Tracker is HUD feedback only. Island Settings owns the authoritative 30-elimination end condition, avoiding two competing round-end paths.

## Exact direct-event wiring

For **each of the 19 Player Spawn Pads**:
- source event: **On Player Spawned**
- target device: **IG_Loadout**
- target function: **Grant Item**

The player who spawned is the instigator, so `Receiving Players = Triggering Player` grants only that player's three-weapon loadout.

No other gameplay event binding is required for the locked baseline.

## Multiplayer lifecycle / JIP / player leave

The native-only architecture accounts for lifecycle without custom state:
- existing players receive `TR_Eliminations` at game start,
- JIP players are spawned by Island Settings and assigned `TR_Eliminations`,
- every initial spawn, respawn, and JIP spawn fires the Player Spawn Pad event that grants the loadout,
- elimination score and 30-elimination round end are native,
- 50-point sustain is native,
- departing players leave no Verse state, subscriptions, maps, tasks, or callbacks to clean up,
- duplicate Verse subscription risk is zero.

## Validation record

2026-09-29 live Scrapline UEFN:
- Epic UEFN MCP `ValkyrieToolset.VerseToolset.BuildAll` with the optional siphon candidate present: **0 diagnostics**.
- Optional siphon candidate removed as redundant.
- `BuildAll` run again with no custom Verse files: **0 diagnostics**.
- Current live DeviceToolset catalog confirmed Player Spawn Pad, Item Granter, and Tracker device assets.
- Current Epic documentation confirmed native 50-point elimination sustain, JIP spawn, respawn/immunity settings, 30-elimination end condition, Tracker JIP assignment, Item Granter behavior, and Player Spawn Pad → Item Granter spawn wiring.

A separate headless `verse-lsp` probe produced thousands of errors in Epic-generated digest files and cascading import errors despite the live UEFN build succeeding. That noisy digest result is not treated as the build authority for this project state.

## UEFN Central Project Generator disposition

The prepared Project Generator request was evaluated during this phase. Current Project Generator access is an authenticated web flow, while the installed Omni-Verse 0.4.3 integration exposes repair/sync commands rather than a headless Project Generator command. No stored credential was extracted or exposed to bypass that boundary.

No generated custom package is required after the native-device resolution above. `UEFN_CENTRAL_PROMPT.md` is retained as a future fallback if a later feature proves a real custom-logic need.

## Phase exit

**PASS.**

- Verse/toolchain validation: pass.
- Production custom Verse requirement: none.
- Multiplayer/JIP/leave lifecycle: accounted for natively.
- Exact native devices and wiring: resolved.
- `@editable` wiring: none.
- One-shot gameplay placeholder: must be replaced by this validated native package.
- Final contradiction/confusion audit: required before Astra authorization.
- Astra construction remains gated pending explicit user authorization.
