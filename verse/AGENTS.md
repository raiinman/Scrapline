# Verse Source DOX

## Purpose

Own reviewable text mirrors of Scrapline's custom Verse source.

## Ownership

This folder owns:
- production/candidate Verse source mirrored from the live Scrapline UEFN project,
- source-level implementation notes that belong beside that code.

Gameplay behavior and acceptance criteria remain owned by `docs/ARMORY_ECONOMY_SPEC.md`, `docs/GAMEPLAY_SPEC.md`, and `docs/VERSE_GAMEPLAY_INTEGRATION.md`.

## Local Contracts

- The live Scrapline UEFN compiler is the build authority.
- Edit/compile the live UEFN source first through the approved toolchain, then synchronize the verified text mirror here.
- Do not treat a GitHub-only Verse edit as compiler-validated.
- Keep the first-alpha Armory implementation as small as practical; prefer one production file unless a concrete compiler/lifecycle/UI reason requires a helper.
- Do not introduce score, winner, match-timeout, spawn-selection, terrain, layout, lighting, VFX, or environment authority into Armory Verse.

## Work Guidance

- Keep code readable and explicit around lifecycle, currency charges/rewards, and cleanup.
- Preserve editor-configurable catalog data rather than hard-coding seasonal Fortnite asset identifiers.

## Verification

- Run live `ValkyrieToolset.VerseToolset.BuildAll` after meaningful Verse changes.
- Record runtime/lifecycle validation in the owning gameplay documentation.

## Child DOX Index

No child DOX documents.
