# Scrapline — Project Brief

## Status

Pre-production / brainstorming.

No final one-shot Codex build prompt has been approved yet.

## Objective

Create a simple, polished Free For All map in UEFN using a deliberately curated set of real Fab/UEFN assets.

The project is intentionally testing an asset-first one-shot workflow: research and lock the environment kit first, then give Codex a sufficiently complete specification to assemble the playable map without falling back to blank boxes or improvised placeholder art.

## Core Experience

Scrapline should be:
- compact
- immediately readable
- fast to re-enter after spawning
- dense enough to create frequent fights
- open enough to support multiple routes and weapons
- vertically layered without allowing one dominant camping position
- visually coherent as a post-apocalyptic scrapyard / industrial combat zone

## Initial Player-Space Direction

Working target: approximately 8–16 players.

The exact player count remains open until the final map dimensions, spawn count, and combat pacing are locked.

## Non-Negotiable Construction Rule

The final environment should be composed from approved production assets already available to the UEFN project.

Do not use primitive cubes, blank Blender meshes, generic greybox stand-ins, or newly modeled substitute environment pieces when a suitable approved asset exists.

Temporary technical helpers may be used only when required by UEFN gameplay/device logic and should not become visible environment art.

## Workflow

1. Research free UEFN-compatible Fab content.
2. Curate and approve the asset kit.
3. Freeze the asset manifest.
4. Lock map layout, flow, spawn philosophy, verticality, and gameplay rules.
5. Write a single implementation specification for Codex.
6. Execute the one-shot build.
7. Test only after the primary build pass is complete unless a blocking editor/runtime failure requires earlier validation.

## Current Known Asset

The user already has the **Post-Apocalyptic Scrapyard Pack** added to the UEFN editor:

https://www.fab.com/listings/c584020d-fcae-453d-b496-fce46d90c97b

This is the current visual foundation for Scrapline.

## Open Decisions

- exact map footprint
- final supported player count
- weapon/loadout rules
- respawn behavior
- score / win condition
- final lighting and time-of-day treatment
- approved supplemental Fab assets
- centerpiece landmark
- exact number and placement strategy for spawn points
