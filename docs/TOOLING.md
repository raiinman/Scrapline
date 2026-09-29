# Scrapline — Tooling

## Status

The Scrapline toolchain is installed, activated, and verified against the live Scrapline editor session. Epic Unreal MCP is responding to real editor reads, Python is enabled, and Trashbyrd Power Tools reports `status=running`, `level_name=Scrapline`, and a nonzero actor count. No Codex build credits were used for this verification.

## Required Build Stack

### Epic UEFN MCP

- Official UEFN MCP server.
- Codex server key: `unreal-mcp`.
- Endpoint: `http://127.0.0.1:8000/mcp`.
- Use it for Verse, Scene Graph entities, Creative devices, and play-session control.
- The Scrapline UEFN project must enable **Python Editor Scripting** and **UEFN MCP Toolsets**.

### Trashbyrd's UEFN Power Tools

- Version installed on the development machine: `0.1.6`.
- Codex server key: `powertools`.
- Use it alongside Epic's MCP, never instead of it.
- Primary value: bulk actor operations, asset/material/texture inspection, project health checks, moderation scans, dependency scans, Niagara inspection, and Verse diagnostics.
- This Scrapline project uses its root plugin layout, so the Python bridge is installed at:
  `Content/Python/`
- `UEFN_PROJECTS_ROOT` is configured to the parent folder that contains Scrapline.
- After restarting UEFN and opening Scrapline, start the bridge from the Python console with:
  `import pt`

### UEFN Central Omni-Verse

- VS Code extension installed: `UEFNCentral.omni-verse` version `0.4.3`.
- Epic's Verse and URC VS Code extensions are also installed.
- Omni-Verse activation has been verified from the VS Code extension log: authentication, API client, sync manager, status bar, fix command, command registration, and URI handler all report OK.
- Use Omni-Verse for compiler-aware Verse fixes, offline diagnostics, Project Brain workspace context, and web-to-VS-Code sync.
- Do not use Omni-Verse to author terrain or environment layout; it is a Verse support tool.
- Keep live-sync auto-apply disabled so incoming web code requires review before it changes local files.

### UEFN Central Verse Examples

- Local reference library cloned from:
  `https://github.com/uefncentral/uefn-verse-examples`
- Treat this as implementation reference material, not project source.
- Prefer compiler-verified examples when choosing Verse API patterns.

### Unreal Engine Donor Staging

- Unreal Engine 5.8 is installed for general donor/staging work.
- Unreal Engine 5.6 is being installed because some Fab sample projects expose creation only for their packaged engine version.
- Donor projects are source libraries only; do not treat their demo maps, Blueprints, cinematics, or project settings as Scrapline content.
- The durable donor/FBX/referenced-content workflow is documented in `ASSET_PIPELINE.md`.

### Built-in UEFN Tools

- Modeling Mode is permitted for collision fixes, UV/LOD cleanup, terrain integration, and small corrections.
- Landscape tools are permitted for terrain shaping and environmental integration.
- Neither may be used to replace the approved asset-first environment with primitive or greybox art.

## One-Shot Rules

- Codex must discover available MCP tools before beginning the primary build.
- Use Epic UEFN MCP for supported first-party editor actions.
- Use Power Tools for bulk inspection/editing and diagnostics where it is stronger.
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
9. **Verified:** Power Tools `uefn_status` returned `level_name=Scrapline` with 12 actors.
10. **Verified:** Omni-Verse 0.4.3 is installed, activated, authenticated, and its sync manager/commands are healthy in the Scrapline VS Code workspace.
11. **Done:** the Scrapline VS Code workspace is trusted and no longer running in Restricted Mode.
12. **Ready:** toolchain activation is no longer a blocker for the one-shot build.