# Scrapline — Verse / Gameplay Integration Phase

## Status

**ACTIVE — authorized 2026-09-29.**

The pre-build hold is lifted specifically for gameplay/Verse integration.

Authorized now:
- run the prepared UEFN Central Project Generator request,
- generate the small Verse gameplay package,
- validate/repair Verse with Omni-Verse and Epic compiler tooling,
- determine exact Creative-device requirements,
- document exact @editable/device wiring,
- update the Astra one-shot prompt with validated gameplay integration details.

Still not authorized:
- Astra one-shot environment construction,
- irreversible map construction,
- new asset hunting,
- bulk reserve imports,
- synthetic image generation,
- visible greybox substitution,
- redesign of the frozen spatial contract.

## Governing authorities

Read before gameplay integration:
1. `AGENTS.md`
2. `docs/AGENTS.md`
3. `docs/GAMEPLAY_SPEC.md`
4. `docs/UEFN_CENTRAL_PROMPT.md`
5. `docs/SPATIAL_CONTRACT.md`
6. `docs/ASSET_MANIFEST.md`
7. `docs/PHYSICAL_FIT_VERIFICATION.md`
8. `docs/TOOLING.md`
9. `docs/ONE_SHOT_PROMPT_DRAFT.md`
10. `docs/BUILD_READINESS.md`

Gameplay integration must not reopen map design.

## Target gameplay package

Keep Verse intentionally small and multiplayer-safe.

Required behavior:
- Free For All,
- 12-player target; correct up to 16,
- one 10-minute round,
- first to 30 eliminations wins,
- join in progress,
- 100 health / 100 shield,
- no overshield,
- respawn about 3 seconds,
- spawn immunity about 2 seconds,
- fixed editor-configurable three-role loadout,
- normal magazine/reload behavior,
- no dropped-item accumulation,
- target 50-point elimination sustain if it validates cleanly,
- simple elimination/goal HUD using native devices where possible,
- native spawn devices own actual spawn selection.

Verse must not own:
- terrain,
- asset placement,
- spawn coordinates,
- map layout,
- lighting,
- VFX placement,
- asset discovery,
- environment construction.

## Integration sequence

1. Refresh GitHub branch state and re-read the DOX chain.
2. Verify live Scrapline UEFN, Epic UEFN MCP, Power Tools, Omni-Verse, and VS Code workspace health.
3. Run the prepared `UEFN_CENTRAL_PROMPT.md` request.
4. Save the generated Verse package and editor/device setup instructions.
5. Compile/validate with current UEFN/Verse tooling.
6. Repair only compiler/API/lifecycle issues; do not add new mechanics.
7. Resolve exact required device set and names.
8. Resolve exact @editable references and wiring.
9. Update `ONE_SHOT_PROMPT_DRAFT.md` with the validated Verse package and device wiring.
10. Re-run the Astra contradiction/confusion audit against `SPATIAL_CONTRACT.md`.
11. Update `BUILD_READINESS.md`.
12. Stop before Astra environment construction and report readiness for one-shot authorization.

## Validation requirements

Before gameplay integration can close:
- Verse compiles against the current API/toolchain,
- no guessed/deprecated APIs remain,
- join-in-progress behavior is accounted for,
- player-leave cleanup is accounted for,
- duplicate event subscription risk is addressed,
- elimination/win logic is multiplayer-safe,
- device references are explicit,
- island/editor-owned settings are separated from Verse-owned logic,
- exact device wiring is documented,
- no generated gameplay instruction contradicts the frozen spatial contract,
- the one-shot prompt no longer contains a gameplay placeholder.

## Exit gate

This phase ends only when:
- the gameplay package is validated,
- `ONE_SHOT_PROMPT_DRAFT.md` contains the real package/wiring instead of a blocked placeholder,
- the final contradiction/confusion check passes,
- the repository is clean and documented.

Only then may the user authorize Astra's one-shot construction pass.