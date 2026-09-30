# Scrapline — Pre-Astra Red Team Report

## Verdict

**GREEN — safe for explicit Astra authorization.**

This is a handoff-readiness verdict, not a claim that the finished island is production-accepted. The hostile audit found real pre-Astra defects, repaired the deterministic ones, synchronized the authority documents, and left only runtime/build-stage checks that the project already assigns to Astra construction/post-build.

No finding required reopening the frozen spatial skeleton, asset manifest, economy values, native score authority, native spawn selection, or native match-end authority.

## Evidence baseline

Verified on 2026-09-30 against `automation/overnight-refinement` and the live Scrapline UEFN project:

- live `ValkyrieToolset.VerseToolset.BuildAll` returned **0 diagnostics** after the final red-team lifecycle fixes,
- live `IG_Armory` contains exactly **7** registered weapons at indexes **0..6**,
- live `IG_Armory` uses Cycle Behavior **Stop**, Grant **Current Item**, On Grant Action **Keep All**, Equip Granted Item **On**, and Drop Items At Player Location **Never**,
- live `EM_Economy` is configured for Any team / Any class and **Valid On Self Elimination = Off**,
- live `IT_Armory` uses **Custom 14 (Toggle Inventory)**, Consume Input **On**, Show On HUD **On**, HUD text **ARMORY {input}**,
- `IG_Armory`, `EM_Economy`, and `IT_Armory` each have their correct generated Verse tag and are exact-one discovery roles,
- a fresh Launch Session flow completed local `EditorAssetValidation` and `ContentSentryValidation`, then proceeded through content cooking; the edit server later shut down because no game client remained connected,
- the authoritative GitHub Verse mirror and live `Content/Verse/scrapline_armory_device.verse` are byte-identical after closeout,
- a fresh branch contradiction sweep found no active stale self-elimination-On, Spawn Pad subscription, or 18–20 spawn-count instruction.

## FATAL findings — closed

### F1 — Required `IT_Armory` role was missing from parts of the handoff

**Evidence:** `scrapline_armory_device.OnBegin` fails closed unless exactly one tagged Item Granter, Elimination Manager, and Input Trigger are discovered.

**Affected:** `docs/GAMEPLAY_SPEC.md`, `docs/VERSE_GAMEPLAY_INTEGRATION.md`, `docs/ARMORY_ECONOMY_SPEC.md`, `docs/ONE_SHOT_PROMPT_DRAFT.md`.

**Failure mode:** Astra could follow an incomplete production-object list, omit `IT_Armory`, and ship an Armory device that returns from `OnBegin` before initializing any player state.

**Smallest correction:** make `IT_Armory` an explicit required exact-one role, document all three tag classes, and instruct Astra to inventory/reuse the existing tagged actors before creating replacements.

**Frozen-design impact:** none; implementation/handoff only.

**Status:** CLOSED.

### F2 — Live UEFN workspace documentation was stale versus GitHub

**Evidence:** the live project root still contained the old native-only `AGENTS.md`/handoff set while the durable branch contained Feature Freeze v2 Armory authority.

**Affected:** live Scrapline project documentation and root `AGENTS.md`.

**Failure mode:** Astra operates on the machine and is required to read local `AGENTS.md` first; it could legally remove/ignore the Armory while still believing it followed the highest-priority local contract.

**Smallest correction:** synchronize the authoritative branch `AGENTS.md`, `README.md`, and all `docs/*.md` into the live UEFN workspace after the red-team edits. Verify the live Verse file matches the GitHub mirror before copying docs.

**Frozen-design impact:** none; authority synchronization only.

**Status:** CLOSED.

## HIGH findings — closed

### H1 — Protected-shop hotkey could bypass the JIP/death hard deadline

**Evidence:** `OnArmoryPressed` previously converted any post-opening state into `ShopReason = 4` / Next Loadout and set `ShopDeadline = 0.0`, even while `HoldForShop` was true.

**Affected:** `verse/scrapline_armory_device.verse`.

**Failure mode:** a protected JIP/death player could erase the 8/12-second deadline, remain held in stasis/protection, and escape the intended fail-safe.

**Smallest correction:** when `HoldForShop` is true, only reopen the existing shop without changing reason/deadline; ignore the hotkey while `NeedsGrant` is true.

**Frozen-design impact:** none; state-machine hardening.

**Verification:** live `BuildAll` 0 diagnostics.

**Status:** CLOSED.

### H2 — Invalid Item Granter index could grant the wrong weapon

**Evidence:** Epic documents that `GrantItemIndex` out-of-range behavior is controlled by Cycle Behavior rather than guaranteed failure. The prior code checked only `ItemIndex >= 0`.

**Affected:** `verse/scrapline_armory_device.verse`, catalog/index docs.

**Failure mode:** stale/seasonal catalog data could map to an out-of-range index and clamp/wrap to another registered weapon.

**Smallest correction:** add `RegisteredItemCount = 7` and reject every entry unless `0 <= ItemIndex < RegisteredItemCount`; keep that count synchronized with the device list.

**Frozen-design impact:** none; data-validation hardening.

**Verification:** live device has exactly 7 items at indexes 0–6; live `BuildAll` 0 diagnostics.

**Status:** CLOSED.

### H3 — Self/manual/environmental deaths could bypass victim economy lifecycle

**Evidence:** live `EM_Economy` has Valid On Self Elimination **Off**. The previous design used `EM_Economy.EliminatedEvent` for victim recovery, so non-qualifying self deaths could miss recovery/shop handling. Turning the device option On would create ambiguity about self-eliminator income.

**Affected:** `verse/scrapline_armory_device.verse`, `GAMEPLAY_SPEC.md`, `VERSE_GAMEPLAY_INTEGRATION.md`, `ARMORY_ECONOMY_SPEC.md`, one-shot prompt.

**Failure mode:** self/manual/environmental respawn could skip recovery/shop state, or a naive setting change could let a self-death award the +150 eliminator reward/reset.

**Smallest correction:** separate responsibilities:
- `EM_Economy.EliminationEvent` = eliminator income only,
- Valid On Self Elimination = Off,
- one long-lived per-player `fort_character.EliminatedEvent()` watcher = victim recovery/shop lifecycle for every death type.

**Frozen-design impact:** none; implementation ownership clarified inside the existing Armory boundary.

**Verification:** live `BuildAll` 0 diagnostics.

**Status:** CLOSED.

### H4 — Gameplay spec contradicted the native-only Spawn Pad ownership rule

**Evidence:** an older lifecycle line instructed the Armory to subscribe to all 19 Player Spawn Pad `SpawnedEvent` sources while the newer integration authority explicitly prohibited Spawn Pad subscriptions.

**Affected:** `docs/GAMEPLAY_SPEC.md`.

**Failure mode:** Astra could add 19 unnecessary bindings and create a second spawn-driven lifecycle path.

**Smallest correction:** remove the stale instruction; Armory waits for the player's active native-spawned `fort_character`.

**Frozen-design impact:** none.

**Status:** CLOSED.

## MEDIUM findings — explicit Astra acceptance obligations

### M1 — Simultaneous/trade elimination ordering is not runtime-proven

The hardened architecture prevents duplicate score/end authority, but Epic does not document cross-player callback ordering tightly enough to prove the recovery-tier result for a true trade from static analysis alone.

**Astra obligation:** run repeated trade/simultaneous elimination tests. Verify one +150 reward per qualifying killer, one death payment per victim, and deterministic recovery-tier state afterward. If event ordering exposes a tier inconsistency, repair the Armory state machine without touching native score/end authority.

### M2 — Final UMG/controller/input acceptance is intentionally unfinished

`WBP_ScraplineArmory` is a validator-aware scaffold, not final presentation.

**Astra obligation:** finish/rebuild to `ARMORY_UI_SPEC.md`; test mouse + controller category/card/page/Ready/Re-buy/Clear/Next Loadout navigation, HUD restoration, and per-player isolation.

### M3 — JIP / 12–16 player / repeated-lifecycle matrix is not pre-Astra runtime-proven

The code compiles and ownership is explicit, but the real level does not yet exist for the full multiplayer matrix.

**Astra obligation:** run opening JIP, combat JIP, leave/rejoin, repeated death/reopen, all 19 spawn regions, 12-player target, and 16-player ceiling smoke tests.

### M4 — Spatial combat safety can only be fully measured after real placement

Physical fit is verified, but actual sightlines, roof/gantry dominance, route pinch, and spawn LOS depend on the completed real-asset layout.

**Astra obligation:** run `SPATIAL_CONTRACT.md` acceptance before dressing and again after hard cover/spawns are placed.

### M5 — Final memory/publishing budget remains unmeasured

Do not infer runtime memory from the approximately 2.60 GB project-file footprint. Current UEFN uses cooked data for memory calculation.

**Astra obligation:** after the finished environment exists, run the official memory calculation/performance pass and Creator Portal/private-version validation as required.

## LOW findings

### L1 — Propane/Gas Cylinder texture health warnings

Three source textures are 8192 × 8192, but they are streamable, mipmapped, and use `LODBias = 3`. The 2026-09-30 Launch Session local validation/content-cook path did not reject them.

Keep them visible during the finished-map memory/publish pass. Do not reopen asset acquisition solely because of this warning.

### L2 — MCP Verse write path is not fully reliable

During the red team, live MCP Verse reads/builds worked, but `VerseToolset.Replace` returned a write failure against a writable source file.

Verified fallback: inspect actual source state, edit through the authorized local filesystem/editor path, then immediately run live `ValkyrieToolset.VerseToolset.BuildAll` and mirror only compiler-accepted source to GitHub.

## Assumptions that survived attack

- Native Island Settings remains the sole score / 30-elimination win / timeout authority.
- Native Player Spawn Pads remain the sole spawn-selection authority.
- `TR_Eliminations` remains HUD feedback only.
- No production End Game device, custom score manager, spawn solver, or match-authority Timer is justified.
- The 45-second opening timer is only an Armory gate; the native 10:45 clock remains authoritative.
- The 19-region spawn distribution, 140 m × 140 m combat envelope, district anchors, gantry/Garage rules, route network, catwalk limits, broken outer flank, and lighting freeze remain internally coherent.
- Physical-fit evidence does not require replacing any frozen finalist.
- Read-only Fab Referenced Content is valid for placement where no asset editing is required.
- The earlier suspected “grant/hold the eliminated character” race does not survive scrutiny after the victim watcher change: the watcher fires on elimination, and Epic's `fort_character.IsActive[]` contract fails for an eliminated character before the grant/hold loops accept it.
- The 6–8 / 8-card paged Armory browser is structurally appropriate for a larger rotating catalog and does not require redesigning the economy.

## Exact code/docs changed by the red team

- `verse/scrapline_armory_device.verse`
- `docs/GAMEPLAY_SPEC.md`
- `docs/VERSE_GAMEPLAY_INTEGRATION.md`
- `docs/ARMORY_ECONOMY_SPEC.md`
- `docs/ONE_SHOT_PROMPT_DRAFT.md`
- `docs/ASSET_MANIFEST.md`
- `docs/BUILD_READINESS.md`
- `docs/ASTRA_CONFUSION_AUDIT.md`
- `docs/TOOLING.md`
- `docs/MAP_DESIGN.md`
- live UEFN workspace documentation synchronized from the durable branch after closeout.

## Exact remaining Astra obligations

1. Preserve the frozen spatial/asset skeleton.
2. Inventory/reuse the existing exact-one tagged `IG_Armory`, `EM_Economy`, and `IT_Armory` roles.
3. Keep `IG_Armory` index count/order synchronized with `RegisteredItemCount` and catalog data.
4. Keep `EM_Economy` Valid On Self Elimination = Off; do not restore victim recovery to `EM_Economy.EliminatedEvent`.
5. Finish/rebuild `WBP_ScraplineArmory` to `ARMORY_UI_SPEC.md` without restricted K2 content or invalid Custom Button content-class edits.
6. Run the full economy/lifecycle matrix including self/manual/environment deaths, protected-shop hotkey behavior, trades/simultaneous eliminations, JIP, leave/rejoin, repeated UI cycles, and affordability fallback.
7. Validate all 19 native spawn pads after real cover/collision exists.
8. Run spatial acceptance before dressing and after gameplay cover/spawns.
9. Run finished-map performance/memory calculation and final publication validation.
10. Keep live Epic `BuildAll` at zero diagnostics for accepted Verse.

## One-shot prompt disposition

`docs/ONE_SHOT_PROMPT_DRAFT.md` is **safe to hand to Astra after explicit user authorization**.

The prompt distinguishes frozen design from implementation freedom, preserves native authority, names the exact Armory roles, carries the red-team lifecycle/index safeguards, and places unresolved runtime checks in the correct construction/post-build phase.

## Stop condition

Red-team closeout complete.

**Do not invoke Astra from this chat. Do not begin construction.**
