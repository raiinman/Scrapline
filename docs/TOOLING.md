# Scrapline — Tooling

## Status

The external Codex-side tools are installed on the development machine. Project-side UEFN activation waits until the Scrapline UEFN project exists and is open.

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
- Project-side Python bridge must be copied into:
  `Plugins/<ScraplinePlugin>/Content/Python/`
- After opening the project in UEFN, start the bridge from the Python console with:
  `import pt`

### UEFN Central Verse Examples

- Local reference library cloned from:
  `https://github.com/uefncentral/uefn-verse-examples`
- Treat this as implementation reference material, not project source.
- Prefer compiler-verified examples when choosing Verse API patterns.

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

When the Scrapline UEFN project is created:

1. Enable **Python Editor Scripting**.
2. Enable **UEFN MCP Toolsets**.
3. Restart UEFN if requested.
4. Copy the Power Tools Python bridge into the project's plugin `Content/Python` folder.
5. Open Scrapline in UEFN.
6. Run `import pt` in UEFN's Python console.
7. Verify `unreal-mcp` is reachable.
8. Verify Power Tools with `uefn_status`; success must return the real level and a nonzero actor count.
9. Only then begin the one-shot build.
