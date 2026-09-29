# Scrapline — Pre-Build Refinement

## Status

The asset-acquisition question is closed. Current refinement is selection, physical-fit validation, and implementation guidance only.

The current user hold remains in force: no UEFN Central generation, Verse generation, one-shot generation, synthetic image generation, bulk reserve import, or irreversible map construction.

## Verified live state

- UEFN is open on `Scrapline`; Power Tools heartbeat is healthy.
- The frozen Factory, Vehicle V2, Garage, Industrial Pipes, Warning Signs, African Slate Quarry, direct Fab content, and fourteen referenced Fab records remain available.
- Warehouse Essentials is quarantined because its only live mesh requests five missing material packages (`Materials/_1` through `Materials/_5`). No required role depends on it.
- The selected Warning Sign instances have complete Albedo, Normal, and ORM texture sets and their visual meanings are now recorded in `ASSET_MANIFEST.md`.

## Scrapyard working vocabulary

Use the mounted Post-Apocalyptic Scrapyard pack as the visual glue across all four districts.

Confirmed families include:
- metal catwalk set `SCBK_metal_catwalk_set_01_01_L0` through `_07_L0`
- wooden catwalk set `SCBK_wooden_catwalk_set_01_01_L0` through `_07_L0`, plus three modular wooden platforms
- modular scrapyard metal fences at 128 / 256 / 512 sizes and wire-fence single/double gates
- blue, green, red, and yellow shipping-container variants at 512 / 1024 variants
- `SCBK_old_car_ruin_L0` and `SCBK_old_car_ruin_blue_L0`
- `SCBK_huge_junk_pile_L0` and `SCBK_junk_pile_02_L0`
- reservoir, scrapyard water tower, large spotlight, large/medium silos, powerlines, windmills
- graffiti 01–16, hanging wires, fuse boxes, garbage bins, barrels, cable spool, pallet, tires, corrugated panels, wall/door/window parts, ducts, and pipes

Catwalks are deliberately over-covered. Use metal catwalks as the primary elevated language; wooden catwalks should be rare wreck-yard flavor. Do not turn either family into filler or exceed the locked verticality budget.

## Mounted fallback vocabulary

Deserted Props provides project-mounted fallbacks without reopening imports:
- `SM_ScissorsLift01` / `02`
- `SM_UEFN_SemiTruck_Tractor`, cargo bed, and flat bed
- `SM_CargoCart01`
- roller-machine pieces and forklift
- referenced `Crane/SM_Crane01`
- `Ditch/sm_Ditch`
- fire-equipment, sign/decal, tarp, box, and sparse arid/dead foliage families

Talisman VFX provides the preferred restrained atmosphere: `NS_Dustmotes_01`, falling/burst spark systems, and lingering/rising/spray steam. Deserted VFX stays secondary for larger fire/dust/storm effects.

## Composition rule

Scrapline must read as one accumulated industrial scrapyard, not four asset-pack demo zones. Carry Scrapyard fencing, corrugated metal, junk, wires, graffiti, signs, and repair clutter across district boundaries while keeping the Factory/Garage/Deserted pieces as role-specific structure.

Keep the Factory crane slightly off geometric center and surround it with lower machinery/rubble so the basin and drainage/service cuts remain legible movement lines.

## Source-level fit assurance

Public source documentation reduces collision/scale risk without replacing editor-local measurements:

- Epic's Factory Environment Collection release states the full collection contains over 850 meshes **with LODs and collision** and was intentionally built to feel large-scale.
- Vehicle Variety Pack Volume 2 documentation reports **Collision: Yes** for its four unique vehicles.
- Epic's original UEFN Fab content announcement says the Post-Apocalyptic Scrapyard pack was **collision-ready, optimized for Fortnite budgets, and scaled to Fortnite units**; the current Fab listing also states that its 206 assets are compatible with the Fortnite grid.

These facts support the frozen choices but do not prove exact local dimensions after migration/reference mounting.

## Remaining verification

The only important asset question not yet closed is physical fit: editor-local bounds and collision geometry for the Factory crane, Garage shell, Box Truck, Campervan, primary containers, and selected catwalk modules.

The current read-only bridge command set exposes asset loading/properties but not explicit StaticMesh bounding boxes or collision metrics. Do not invent those dimensions. Verify them in-editor or through a read-only mesh-metrics probe before final placement guidance.

## Intake rule

Do not add City Street, Junkyard, Construction, Wasteland, or other reserve packs merely because they are available. Reopen intake only for a named implementation failure in the frozen pool.
