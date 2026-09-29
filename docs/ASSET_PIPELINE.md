# Scrapline — Asset Intake Pipeline

## Purpose

Keep asset acquisition predictable and keep Scrapline free of broken, duplicated, or unnecessary content.

## Source Quality Rule

Keep the highest practical source quality when storage and download size are reasonable.

- Fab / Megascans default: **High** source quality.
- Preserve the original downloaded source outside the UEFN project.
- Optimize downward inside UEFN only after visual and memory testing.
- Do not assume every 4K/8K source texture must ship at that resolution.

## Intake Types

### A — UEFN Referenced Content

Use when Fab exposes a normal UEFN add-to-project flow.

Process:
1. Add the asset from Fab while Scrapline is open.
2. Wait for the reference to finish loading before adding another pack.
3. Verify the new `.uref` exists under `References/`.
4. Reopen/scan Scrapline and confirm the content resolves.
5. If the pack causes repeated GameFeature or Verse failures, remove its reference and quarantine it outside the project.

This is the preferred path because it keeps source content read-only and avoids unnecessary duplication.

### B — Exchange Assets (FBX / GLTF / GLB)

Use when Fab supplies mesh files but no UEFN referenced-content package.

Process:
1. Download/export the pack at High source quality.
2. Keep the source package outside the project.
3. Import only useful mesh variants into `/Scrapline/Imported/<Pack>/`.
4. Do not import every supplied LOD FBX as a separate production asset.
5. Import required texture maps.
6. Build/reuse a controlled master material and per-asset instances.
7. Verify scale, materials, collisions, LODs/Nanite, and memory behavior.
8. Save and run a project asset sweep.

African Slate Quarry is the verified reference implementation for this route.

### C — Unreal Engine Donor Projects

Use when a Fab product only exposes **Create Project** / Unreal Engine format.

Process:
1. Create the donor project using the engine version Fab supports.
2. Treat the donor as a source library, not part of Scrapline.
3. Inspect first; never migrate the entire sample blindly.
4. Prefer static meshes, textures, ordinary materials, decals, and simple environment assets.
5. Skip sample levels, gameplay Blueprints, cinematics, project settings, and unrelated systems.
6. Move only selected assets into Scrapline, preserving required dependencies.
7. Validate the migrated content in UEFN before approving it.

Current donor tooling:
- Unreal Engine 5.8 is installed.
- Unreal Engine 5.6 is being installed for donor products that are packaged for 5.6.
- Dark Ruins Megascans Sample is the first planned donor-project test.

## Fab Reliability Rules

The Epic/Fab client has produced `FAB-FAB001` while several downloads were queued at once.

When that occurs:
- stop bulk retries,
- refresh/restart the Epic Games Launcher,
- retry one product at a time,
- skip a troublesome reserve pack rather than blocking the project when an equivalent asset family already exists.

## Project Hygiene

- Do not put downloaded ZIP/FBX source archives inside Scrapline.
- Keep generated Python `__pycache__` directories out of the project; `.loreignore` already excludes them.
- Remove import-created placeholder materials after a verified replacement material is assigned.
- Quarantine rejected `.uref` files outside the project instead of leaving them mounted.
- Run a live asset scan after major intake waves.
- A Power Tools `likely_unused` result is expected before level construction; do not delete production assets merely because nothing references them yet.

## Known Rejections

- **LookoutTower** — do not re-add. It caused repeated GameFeature/Verse loading failures and severe editor thrashing.
- **OldWest Vol. 6** — removed from the active reference set during housekeeping because it is outside the approved Scrapline visual direction. The reference is preserved outside the project if later needed.