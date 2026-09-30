# Scrapline — Pre-Build Refinement

## Status

The overnight refinement phase is complete. It closed the asset-acquisition, visual-selection, and physical-fit questions and produced implementation guidance for the frozen design.

The pre-build hold documented during this phase was lifted on 2026-09-29 for gameplay integration and the agreed UEFN Central comparison; those later phases are now complete. This historical refinement record does **not** authorize Astra construction, synthetic image generation, bulk reserve import, or irreversible map construction.

## Verified live state

- UEFN is open on `Scrapline`; Power Tools heartbeat is healthy.
- The frozen Factory, Vehicle V2, Garage, Industrial Pipes, Warning Signs, African Slate Quarry, direct Fab content, and fourteen referenced Fab records remain available.
- Warehouse Essentials is quarantined because its only live mesh requests five missing material packages (`Materials/_1` through `Materials/_5`). No required role depends on it.
- The selected Warning Sign instances have complete Albedo, Normal, and ORM texture sets and their visual meanings are recorded in `ASSET_MANIFEST.md`.
- Read-only badges on Fab Referenced Content are expected source-lock behavior. Referenced assets remain valid production content for placement.

## Real-asset visual evidence

The grounded visual-reference pass now includes:
- exact staged renders for the complete frozen Factory set,
- exact staged renders for the approved Garage set,
- exact staged renders for Box Truck, Campervan, and representative Industrial Pipes,
- direct PNG exports of all 12 selected Warning Sign albedos,
- live UEFN Static Mesh Editor captures of representative Scrapyard referenced content,
- live UEFN Static Mesh Editor captures of representative Deserted Props content,
- Talisman / Deserted VFX exact Niagara inventory plus live browser captures and official source media,
- four temporary unsaved district composition studies assembled from real staged assets,
- a consolidated grounded Scrapline concept/reference board.

The durable findings are recorded in `REAL_ASSET_VISUAL_STUDIES.md`.

### Important silhouette correction

The Factory hero crane is a long horizontal industrial gantry/bridge assembly, not a tall skyline construction crane.

Its crane, cabin, and cable pieces must preserve their original shared pivots. The center composition should use the gantry's long horizontal silhouette to frame movement across the basin rather than treating it as a vertical tower landmark.

The mounted Deserted Props crane is also a horizontal gantry form, making it a true silhouette fallback rather than a different crane archetype.

### Garage assembly correction

`SM_Garage_1` and `SM_Garage_1_roof` are a shared assembly. Preserve their original relative pivots before grounding or placing them.

The shell is compact. The southeast district should expand outward with service clutter, stairs, railings, signage, exterior cover, and Scrapyard visual glue instead of expecting the building itself to fill the district.

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

Representative live read-only captures now verify the actual appearance of the old car ruin, huge junk pile, a metal catwalk module, modular wire fence, shipping container, guardpost/tower, old tower, reservoir, water pump, and corrugated plates.

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

Representative live read-only captures now verify the actual appearance of industrial platforms, both scissor lifts, cable reel, crane, and ditch/service-cut vocabulary.

## VFX

Talisman VFX is the preferred restrained atmosphere.

Live Niagara inventory confirms the mounted Talisman prefix `/8716e818-4e40-0b9d-eb87-09b5bf75e877/` contains:
- `NS_Dustmotes_01`
- five spark systems
- seven steam systems

Deserted VFX remains secondary spectacle. Live Niagara inventory confirms prefix `/e5d3bf01-4066-5552-582e-f1bb6bc58bd7/` contains:
- `N_LandscapeStorm`
- `NS_AA_Fire`
- `NS_AA_Fire_constant`
- `NS_AnitiAircraftExplosions`
- `NS_JetFlyByDust`

Use Deserted fire/dust/storm spectacle only for a specific composition need. Scrapline should feel abandoned and dangerous, not actively exploding everywhere.

## Composition rule

Scrapline must read as one accumulated industrial scrapyard, not four asset-pack demo zones. Carry Scrapyard fencing, corrugated metal, junk, wires, graffiti, signs, and repair clutter across district boundaries while keeping the Factory/Garage/Deserted pieces as role-specific structure.

Keep the Factory gantry slightly off geometric center and surround it with lower machinery/rubble so the basin and drainage/service cuts remain legible movement lines.

## Referenced-content handling

Referenced Content is production-usable even when the source editor is read-only.

Do not bulk-promote the 206-asset Scrapyard pack or other referenced packs merely to make them editable. Promote only a specific asset when implementation proves that Scrapline must alter material, collision, Nanite/static-mesh settings, geometry, or another source property.

## Source-level fit assurance

Public source documentation reduces collision/scale risk without replacing editor-local measurements:

- Epic's Factory Environment Collection release states the full collection contains over 850 meshes **with LODs and collision** and was intentionally built to feel large-scale.
- Vehicle Variety Pack Volume 2 documentation reports **Collision: Yes** for its four unique vehicles.
- Epic's original UEFN Fab content announcement says the Post-Apocalyptic Scrapyard pack was **collision-ready, optimized for Fortnite budgets, and scaled to Fortnite units**; the current Fab listing also states that its 206 assets are compatible with the Fortnite grid.

These facts support the frozen choices but do not prove exact local dimensions after migration/reference mounting.

## Physical-fit verification — closed

Read-only local-bound/collision probes are complete for the Factory crane assembly, Garage assembly, Box Truck, Campervan, Factory containers, and representative metal/wooden Scrapyard catwalk modules.

Key outcomes:
- live UEFN and UE 5.6 staging measurements matched exactly for all curated imported finalists,
- the Factory crane remains the primary hero at a shared-pivot envelope of approximately **5.685 × 26.895 × 5.448 m**,
- the Garage remains the compact workshop shell at approximately **16.541 × 9.375 × 7.970 m**,
- vehicles and containers fit their intended full-cover roles but must not be used as accidental narrow-route plugs,
- metal catwalk rise modules naturally reach the +4–6 m traversal band; long chained elevated runs remain restricted,
- wooden catwalks remain rare Wreck Yard accents,
- no referenced-content promotion is required.

See `PHYSICAL_FIT_VERIFICATION.md` for exact bounds, collision primitive counts, LOD/Nanite notes, and gameplay implications.

## Intake rule

Do not add City Street, Junkyard, Construction, Wasteland, or other reserve packs merely because they are available. Reopen intake only for a named implementation failure in the frozen pool.
