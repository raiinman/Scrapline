# Scrapline — Real Asset Visual Studies

## Status

The pre-build visual-reference pass is complete enough to guide placement without synthetic concept art.

All studies in this pass are grounded in one of:
- exact staged UAsset renders,
- live UEFN Content Browser or Static Mesh Editor captures,
- recovered/source-pack screenshots,
- official Fab media used only for pack-level context.

Synthetic image generation is excluded.

## Local visual archive

The working visual archive is under `Resources/Reference/RealAssets/` in the current Scrapline output workspace.

Key boards:
- `04_REAL_selected_warning_signs_contact_sheet.jpg`
- `05_REAL_factory_exact_contact_sheet.jpg`
- `06_REAL_garage_exact_contact_sheet.jpg`
- `11_REAL_grounded_Scrapline_concept_board.jpg`
- `12_REAL_scrapyard_referenced_contact_sheet.jpg`
- `13_REAL_desertedprops_referenced_contact_sheet.jpg`
- `14_REAL_vfx_reference_contact_sheet.jpg`
- `15_REAL_grounded_Scrapline_concept_board_v2.jpg`

The four district composition studies live under `Resources/Reference/RealAssets/CompositionStudies/`.

## Verified visual findings

### Factory hero crane

The frozen Factory crane reads as a long horizontal industrial gantry/bridge assembly, not a tall skyline construction crane.

Its cabin and cable pieces must preserve their original shared pivots with `SM_Crane01`. Do not independently ground those pieces.

Center composition must be designed around the gantry's long horizontal silhouette.

### Garage

`SM_Garage_1` and `SM_Garage_1_roof` are a shared assembly. Preserve their original relative pivots before grounding/placing the group.

The real shell is a compact industrial workshop form rather than a broad warehouse. The Ruined Workshop district should therefore expand with exterior service clutter, stairs, railings, workbench/shelf pieces, Scrapline grime, and surrounding cover instead of treating the shell itself as the whole district.

### Scrapyard referenced content

Representative live read-only captures now cover:
- `SCBK_old_car_ruin_L0`
- `SCBK_huge_junk_pile_L0`
- `SCBK_metal_catwalk_set_01_01_L0`
- `SCBK_modular_wire_fence_big`
- `SCBK_shipping_container_b_512`
- `SCBK_scrapyard_tower_guardpost`
- `SCBK_old_tower_L0`
- `SCBK_large_reservoir_01_L0`
- `SCBK_scrapyard_water_pump_01_L0`
- `SCBK_straight_corrugated_plates`

These references confirm that the mounted pack can provide the cross-district rusted visual glue without bulk promotion into editable project content.

### Deserted Props referenced content

Representative live read-only captures now cover:
- `SM_IndustrialPlatform01`
- `SM_IndustrialPlatform05`
- `SM_ScissorsLift01`
- `SM_ScissorsLift02`
- `SM_CableReel`
- `SM_Crane01`
- `sm_Ditch`

The Deserted crane is also a long horizontal gantry form, so it is a genuine silhouette fallback for the Factory crane rather than a different crane archetype.

### VFX

Live Niagara inventory confirms the mounted Talisman prefix `/8716e818-4e40-0b9d-eb87-09b5bf75e877/` contains:
- `NS_Dustmotes_01`
- five spark systems
- seven steam systems

Live Niagara inventory confirms the mounted Deserted VFX prefix `/e5d3bf01-4066-5552-582e-f1bb6bc58bd7/` contains:
- `N_LandscapeStorm`
- `NS_AA_Fire`
- `NS_AA_Fire_constant`
- `NS_AnitiAircraftExplosions`
- `NS_JetFlyByDust`

Talisman remains the default ambient language. Deserted VFX remains secondary spectacle only.

## Read-only referenced-content rule

Fab assets under Referenced Content are production-usable even when their source editors show Read Only.

Do not duplicate or promote an entire referenced pack just to make it editable.

Promote an individual referenced asset into curated editable project content only when implementation proves that Scrapline must modify its material, collision, Nanite/static-mesh settings, geometry, or another source property.

## Physical-fit closeout

The asset-visual question and physical-fit question are both closed.

Read-only live UEFN measurements verified the chosen Factory crane assembly, Garage assembly, Box Truck, Campervan, Factory containers, and representative metal/wooden Scrapyard catwalk modules. Curated imported meshes matched the UE 5.6 staging measurements exactly, so no migration scale drift was found. The full measurements, collision counts, LOD/Nanite notes, gameplay implications, and restrictions are recorded in `PHYSICAL_FIT_VERIFICATION.md`.

No result requires replacing a frozen finalist or promoting a referenced asset. The current pre-build hold remains the only gate before generation/build work resumes.
