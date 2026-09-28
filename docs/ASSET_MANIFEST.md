# Scrapline — Asset Manifest

## Status

Asset research is substantially complete, but the manifest is **not frozen** because most claimed Fab content is still only in the user's Fab Library and has not yet been added to the Scrapline UEFN project.

Only assets verified by the live Scrapline project may be treated as implementation-ready.

## Live Scrapline Asset Audit

Power Tools scanned the live Scrapline project after the macro/gameplay design was locked.

Current /Scrapline asset registry result:
- **14 total project assets**.
- The current project contains the base world, HLOD layer, Island Settings, grid planes, two Player Spawn devices, Verse digest, and project metadata.
- **No curated Fab environment pack is currently present in Scrapline.**
- Project-only asset sweep reported no imported environment assets to audit.

This means the Fab Library work succeeded as acquisition, but **Library ownership is not the same thing as project availability**.

## Visual Authority

### Post-Apocalyptic Scrapyard Pack

- Source: Fab
- URL: https://www.fab.com/listings/c584020d-fcae-453d-b496-fce46d90c97b
- Status: **Approved visual authority / claimed in Fab Library / not yet verified in Scrapline project**
- Role: primary environment kit
- Intended use: scrapyard architecture, rusted industrial structures, cover, elevation pieces, junkyard dressing, and large visual anchors.

Everything else must visually belong beside this pack.
## Immediate Easy-Import Queue

These are the first Fab items to add directly to the **Scrapline** project because they were selected specifically for UEFN/referenced-content use during research.

1. **Post-Apocalyptic Scrapyard Pack** — core architecture and identity.
2. **Deserted: Domination Props** — containers, barrels, boxes, industrial filler.
3. **Deserted: Domination VFX** — restrained dust/fire/industrial atmosphere.
4. **Talisman VFX** — steam, sparks, dust-type effects where stylistically appropriate.
5. **Metal Barricade** — lane shaping / cover.
6. **Concrete Rubble Pile** — large destruction/cover piece.
7. **Cement Rubble** — smaller rubble dressing.
8. **Broken Concrete Slab** — ground/destruction variation.
9. **Industrial Junkyard Crate Metal** — scrapyard detail.
10. **Industrial Junkyard Propane Tank** — industrial detail.
11. **Rusty Electrical Box** — utility/electrical dressing.
12. **Mine Cart** — salvage/industrial prop.
13. **Metal Manhole Cover** — ground detail.

After these are added, run another live asset scan before adding more complexity.

## Claimed Fab Reserve Pool

The user also claimed many larger free/bulk Fab packs during research, including factory, warehouse, junkyard, street-prop, construction, vehicle, rubble, garage, abandoned-building, and city-sample collections.

These reserve packs are useful, but several are Unreal Engine/FBX-style packages rather than direct UEFN referenced content.

Rule:
- **Do not block the first one-shot on migrating every reserve pack.**
- Use the direct/easy-import queue first.
- Add reserve packs only when they import cleanly and materially fill a design gap.
## Required Asset Families Before Freeze

The one-shot needs enough verified in-project choices for:

- primary rusty scrapyard architecture,
- wrecks / vehicle forms,
- fencing and barriers,
- containers / loading-yard props,
- heavy machinery / power infrastructure,
- concrete/rubble,
- utility/electrical props,
- signage/detail,
- restrained ambient VFX,
- one strong industrial centerpiece class.

The exact hero asset remains unlocked until the live asset inventory can compare real candidates.

## Freeze Procedure

Before the Codex one-shot:

1. Add the immediate easy-import queue to Scrapline.
2. Re-run Power Tools asset inventory tools.
3. Confirm usable asset families and their actual content-browser paths.
4. Record the strongest project-visible families here.
5. Add reserve packs only if a required family is still weak.
6. Select the central hero landmark from assets actually present.
7. Mark this manifest **Frozen for One-Shot**.

## Hard Rule

Codex must not silently replace a missing environment family with visible primitive geometry.

If a required production asset is absent, it must either:
- select another verified production asset already present,
- use a built-in Fortnite/UEFN production asset that fits the style,
- or report the specific missing dependency rather than fabricating a greybox substitute.