# Concept / reference index — fresh Quarry Cut

All images below are new real-geometry Blender compositions from actual local UAssets/source FBX and textures. No image generation was used. Native capture board 23 controls exact shader appearance. These are reference views, not final Fortnite gameplay/collision evidence.

## Required camera set

| ID / image | Coverage | Eye position in metres |
|---|---|---|
| 01_establishing.png | High oblique / complete basin | [-91, -98, 84] |
| 02_near_overhead.png | Near overhead / lane network | [0, -15, 125] |
| 03_dispatch_spawn.png | West dispatch start toward center | [-55, 0, -0.8641142528624932] |
| 04_receiving_spawn.png | East receiving start toward center | [55, 7, 1.6157985445448848] |
| 05_center_west.png | Center from west / machinery rhythm | [-20, -3, -0.9077295311507012] |
| 06_center_east.png | Center from opposing east angle | [23, -1, -0.1] |
| 07_workshop_inward.png | North workshop flank toward center | [21, 34, 0.5715565974442127] |
| 08_workshop_back.png | North flank back toward dispatch | [-8, 28, -0.7965165510871894] |
| 09_drain_inward.png | South drain flank toward center | [-21, -29, -1.1398027906674166] |
| 10_drain_back.png | South flank back toward receiving | [16, -28, -1.7017713119980782] |
| 11_exterior_west.png | Exterior cut shoulder facing inward | [-93, -47, 9.480690353280005] |
| 12_exterior_east.png | Exterior spoil mound facing inward | [88, 45, 10.251082980486082] |
| 13_exterior_north.png | Outer ridge framing entire arena | [-15, 93, 12.877170036446277] |
| 14_low_loading.png | Low gameplay / staggered hard cover | [-36, 6, -1.284251676781554] |
| 15_low_power.png | Low gameplay / machinery and pipes | [37, -21, 0.18884347412956592] |
| 16_low_workshop.png | Low gameplay / workshop service court | [22, 17, 1.5887979239264614] |

## Review boards

- 20_whole_map_and_starts.jpg — establishing / overhead / both start sides.
- 21_combat_and_flanks.jpg — opposing center, north/south flank inward and reverse.
- 22_terrain_and_gameplay.jpg — three exterior views facing inward plus low gameplay views.
- 23_asset_material_board.jpg — exact new UEFN asset captures and local texture swatches tied to named areas.
- 24_direction_comparison.jpg — A Quarry Cut, B Split Terrace, C Compact Transfer; A is the concrete handoff direction.

## Source and use rules

- Factory/Garage/Vehicle/Pipes geometry exported directly from installed ScrapStage56 curated UAssets. Shader reconstruction uses exported texture parameters and native slots; Unreal custom mask/glass behavior can differ. Native assets win on appearance.
- ASQ geometry/textures and Junkyard barrel variants use intact FabLibrary sources. Exact source file paths and placements are recorded in scene_manifest.json. D: quarry copies with empty/zero-byte files were excluded.
- SCBK read-only meshes appear in exact native asset evidence, not invented substitutes in Blender. Final fresh UEFN construction must add measured SCBK salvage/fence/catwalk kit according to DESIGN_SPEC.
- Asset identity/material binding CSVs distinguish live project assets from source-only barrel/ground import requirements.
- 06_center_east camera was moved out of a container after visual review. Final manifest contains corrected coordinates.
- Portable scene: QuarryCut_reference.blend. It is reference art, not a UEFN world to migrate wholesale.
- New terrain: QuarryCut_253_16bit.png and terrain_import.json. No old heightmap was reused.
- Gallery: gallery.html in the local outputs package. Repo visual images live in Resources/FreshBuild/QuarryCut.

## Visible refinement still assigned to construction

Reference establishes macro kit, angle coverage and outside terrain shape. Final UEFN must refine anchor footprints, native material masks, perimeter fences/boundary, SCBK salvage density, catwalk support/escape routes, decals/foliage and measured spawn cover. A complete camera set does not certify those passes.
