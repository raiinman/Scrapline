# Scrapline — Tooling

## Status

The Scrapline toolchain is installed and verified against the live asset-bearing project. Epic Unreal MCP responds to editor reads, Python is enabled, and Power Tools returns the actual active level and actor count. For the fresh run, verify `Fresh_QuarryCut`; historical verification against `Scrapline` does not establish the current target.

## Required Build Stack

### Epic UEFN MCP

- Official UEFN MCP server.
- Codex server key: `unreal-mcp`.
- Endpoint: `http://127.0.0.1:8000/mcp`.
- Use it for Verse, Scene Graph entities, Creative devices, and play-session control.
- The Scrapline UEFN project must enable **Python Editor Scripting** and **UEFN MCP Toolsets**.

### Trashbyrd's UEFN Power Tools — Required Construction Layer

- Canonical upstream repository: `https://github.com/Corsair-Studios/trashbyrds-uefn-power-tools/tree/main`.
- Upstream describes Power Tools as an MCP server + live in-editor Python bridge for UEFN inspection/editing **at scale** and explicitly supports running beside Epic's official UEFN MCP.
- Version installed on the development machine: `0.1.6`.
- Codex server key: `powertools`.
- The current server exposes **30 `uefn_*` MCP tools**; always call `uefn_list_commands` at session start rather than relying on a stale hand-maintained tool list.
- Power Tools is **required during the GPT-6.1 Sol one-shot build** and is a general live UEFN control/inspection layer, not a bulk-only helper or post-build diagnostic.

Mandatory startup verification:
1. UEFN must be open on Scrapline.
2. Start/restart the bridge with `import pt`, or when necessary: `import importlib, uefn_bridge; importlib.reload(uefn_bridge)`.
3. Call `uefn_status`. A client-side “connected” indicator is not proof; required success is a real level name and nonzero actor count.
4. Call `uefn_list_commands` and use that returned command surface as authoritative for the current bridge.
5. Call `uefn_get_level_info` before construction so GPT-6.1 Sol knows the real level/device baseline.

Use Power Tools wherever it is the strongest supported path, not only for bulk work:
- status, level stats, device audit, property inspection, actor selection/manipulation, placement, duplication, transforms, and readback,
- `uefn_list_assets` / `uefn_inspect_asset` / `uefn_asset_sweep` for frozen-kit discovery and verification,
- `uefn_spawn_actor`, `uefn_duplicate_actor`, and `uefn_set_transform` for environment construction when reliable for the target actor,
- `uefn_batch_location`, `uefn_batch_get`, and dry-run-first `uefn_batch_set` for efficient multi-actor work,
- `uefn_list_devices`, `uefn_run_audit`, and `uefn_tag_inspect` for device/tag inventory and Armory verification,
- dependency, material, texture, Niagara, dead-asset, health, and moderation/IP inspection throughout construction and repair,
- verification/readback after important mutations, not just at final closeout.

The currently observed Power Tools panel also exposes Device Audit, Material & Texture Browser, Niagara Inspector, Dependency Viewer, Project Health, IP / Moderation Scan, Verse Tag Inspector, Level Stats, MCP Bridge, Dead Asset Sweep, Property Inspector, and Build-Mode Cleanup. Use these capabilities when they are actually exposed to the active control path; do not invent an MCP command that `uefn_list_commands` does not report.

Division of labor:
- **Power Tools:** first-choice general live UEFN status/inspection/control where supported, including actor/property/device/tag operations, construction/readback, level stats, and asset/dependency/material/texture/Niagara/health/dead-asset/moderation workflows.
- **Epic `unreal-mcp`:** supported first-party and specialized editor operations, Scene Graph/Creative/Verse device tooling, UMG/MVVM tooling, play sessions, live Verse `BuildAll`, and authoritative editor validation.
- Run both. Do not replace or rename the existing `unreal-mcp` config when using `powertools`.

Coordinate rule:
- Power Tools may report both traditional **XYZ** and UEFN **Left-Up-Forward (LUF)** locations. Never feed values from one convention into an operation expecting the other. For major Scrapline anchors, read back the actual world transform after placement before propagating duplicates.
- Epic ActorTools transform writes in this editor have reset omitted rotation/scale to identity despite their documented preservation behavior. Supply complete location/rotation/scale, read back and save.
- Native Landscape import gizmos are editor helpers, not external actor assets; save actual Landscape/proxies individually or save the level.

This Scrapline project uses its existing live Python bridge location at `Content/Python/`; do not relocate the working bridge during the one-shot. `UEFN_PROJECTS_ROOT` is already configured for this nonstandard project location.

Upstream installation/reference docs are `README.md` and `INSTALL.md` in the canonical repository above. Do not update/reinstall Power Tools mid-build merely because upstream exists; only do so for a demonstrated blocker, then re-verify `uefn_status` before continuing.
### UEFN Central Omni-Verse

- VS Code extension installed: `UEFNCentral.omni-verse` version `0.4.3`.
- Epic's Verse and URC VS Code extensions are also installed.
- Omni-Verse activation has been verified from the VS Code extension log: authentication, API client, sync manager, status bar, fix command, command registration, and URI handler all report OK.
- Use Omni-Verse for compiler-aware Verse fixes, offline diagnostics, Project Brain workspace context, and web-to-VS-Code sync.
- Do not use Omni-Verse to author terrain or environment layout; it is a Verse support tool.
- Keep live-sync auto-apply disabled so incoming web code requires review before it changes local files.
- The authenticated browser Project Generator experiment was completed on 2026-09-29. Its successful five-file result was marked **Not validated** and is quarantined in `UEFN_CENTRAL_GENERATOR_RESULT.md`; it is not approved production code or a replacement for live UEFN validation.

### UEFN Central Verse Examples

- Local reference library cloned from:
  `https://github.com/uefncentral/uefn-verse-examples`
- Treat this as implementation reference material, not project source.
- Prefer compiler-verified examples when choosing Verse API patterns.

### Unreal Engine Donor Staging

- Unreal Engine 5.8 is installed for general donor/staging work.
- Unreal Engine 5.6 and ScrapStage56 are installed and have been used for read-only native asset inspection and supported selective migration.
- Donor projects are source libraries only; do not treat their demo maps, Blueprints, cinematics, or project settings as Scrapline content.
- The durable donor/FBX/referenced-content workflow is documented in `ASSET_PIPELINE.md`.

### Built-in UEFN Tools

- Modeling Mode is permitted for collision fixes, UV/LOD cleanup, terrain integration, and small corrections.
- Landscape tools are permitted for terrain shaping and environmental integration.
- Neither may be used to replace the approved asset-first environment with primitive or greybox art.

## Red-Team Tool Reliability Findings — 2026-09-30

Current Epic UEFN MCP documentation lists two relevant known issues:
- Python toolsets currently expose **XYZ** transform format while UEFN uses **Left-Up-Forward (LUF)** conventions; agent-side coordinate translation can multiply spatial errors.
- MCP tool calls can hitch or hang the editor.

Scrapline one-shot safeguards:
- treat `SPATIAL_CONTRACT.md` numeric coordinates as authority and **read back the resulting world transform after every major-anchor/assembly placement before dressing**,
- visually verify the gantry, Garage, major district anchors, and route-facing orientation before propagating secondary props,
- use short, bounded MCP calls and checkpoint durable state instead of launching duplicate operations after a transport timeout,
- if a UEFN MCP Verse write reports failure while the live source is otherwise writable, do not assume the requested edit occurred and do not repeat blindly; inspect the actual live project file, use an approved local edit path if necessary, then immediately run `ValkyrieToolset.VerseToolset.BuildAll`,
- mirror Verse to GitHub only after the live compiler accepts the same source.

During the 2026-09-30 red team, Verse reads/builds worked while MCP `Replace` returned a write failure on the live source. The local source was writable; surgical local edits followed by live `BuildAll` produced zero diagnostics. Treat MCP write success/failure as a tool result that requires readback, not as proof of source state.

## GPT-6.1 Sol Long-Run Resilience

Treat model response timeouts, temporary/low-compute or capacity messages, stream interruptions, Power Tools/Epic MCP polling timeouts, and long editor operations that outlive the client wait as **recoverable events**.

Recovery order:
1. Do not assume the last editor mutation failed.
2. Inspect current live state through Power Tools, Epic operation/session status, UEFN logs, or the actual source file.
3. If the mutation completed, continue.
4. If it did not complete, retry the same bounded operation once after responsiveness returns.
5. If the same path repeatedly fails, use the documented alternate reliable tool/path instead of spinning.
6. Never duplicate cooks, imports, actor batches, device sets, session launches, or source edits because a transport/model timeout occurred.
7. Resume from `BUILD_RUN_STATE.md` plus current live state after an interruption.

Efficiency defaults:
- intended model profile: **GPT-6.1 Sol, Standard speed, Medium reasoning** when those controls are available,
- escalate reasoning only for a concrete difficult subproblem, then return to the efficient default,
- avoid repeated full-document rereads and repeated tool discovery,
- update `BUILD_RUN_STATE.md` at phase boundaries and around expensive/long operations, not after every prop,
- keep enough allowance for the repair, multiplayer, memory, and validation pass.

## One-Shot Rules

- GPT-6.1 Sol must discover both MCP surfaces before beginning the primary build: Epic toolsets and Power Tools `uefn_list_commands`.
- Power Tools is a preferred general construction/control/inspection layer wherever its current commands fit the task; this includes single-object and diagnostic work, not only repetitive/batch operations.
- Use Epic UEFN MCP for first-party/specialized editor actions, Verse/device/session/UI tooling, and authoritative compile/validation work.
- Do not duplicate work manually when an installed tool can perform it reliably.
- Do not install additional experimental UEFN AI bridges during the one-shot unless a blocking capability gap is demonstrated.
- Preserve enough credits for a repair pass after the primary build.

## Project Activation Checklist

Current state:

1. **Done:** Python Editor Scripting is enabled in `Scrapline.uefnproject`.
2. **Done:** UEFN MCP Toolsets are enabled in `Scrapline.uefnproject`.
3. **Done:** Power Tools Python bridge is installed in `Content/Python`.
4. **Done:** Codex has global `unreal-mcp` and `powertools` server entries.
5. **Done:** `UEFN_PROJECTS_ROOT` is configured for this project location.
6. **Done:** UEFN was restarted and Scrapline reopened with the project settings active.
7. **Done:** the project startup script started the Power Tools bridge automatically.
8. **Verified:** Epic Unreal MCP successfully returned the live Scrapline viewport camera transform.
9. **Verified 2026-09-30 immediately before GPT-6.1 Sol handoff:** Power Tools `uefn_status` returned `status=running`, `level_name=Scrapline`, `actor_count=16`; `uefn_get_level_info` returned 16 total actors / 5 Creative devices; `uefn_list_commands` exposed 30 live commands; `uefn_health_scan` completed against the real Scrapline project.
10. **Verified:** Omni-Verse 0.4.3 is installed, activated, authenticated, and its sync manager/commands are healthy in the Scrapline VS Code workspace.
11. **Done:** the Scrapline VS Code workspace is trusted and no longer running in Restricted Mode.
12. **Ready:** toolchain activation is no longer a blocker for the one-shot build.
