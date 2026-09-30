# Fresh-build design specification — Quarry Cut

## Authority and build destination

This is a new design, proposed from the user's explicit clean-rebuild request, with concrete reference geometry and camera coverage. Do not use the failed Scrapline level as a starting level, do not replay its transforms, and do not import its Landscape or old spawn-region geometry. Preserve that map and Lore history.

Create a **new blank level** `Fresh_QuarryCut` in the asset-bearing project, under a clearly separate `FreshBuild/QuarryCut/` namespace. This reuses installed assets without copying bad layout. If project isolation is needed, use UEFN's supported new-project and selective migration workflow; never hand-edit cloud project IDs or clone Lore/URC identity. The old level remains selectable as historical reference. No new shipping UEFN map was created in this preparation task; the saved Blender scene is a visual reference scene.

## Macro layout

Compact industrial salvage arena in an excavated quarry basin, approximately **132×112 m playable ellipse**, inside **230×230 m scenic terrain**. Coordinates use metres, x east, y north, z up, center Transfer Court at (0,0). Target 12-player FFA, ceiling 16 pending real multiplayer evidence. West/East start views describe camera sides, not teams or two fixed FFA spawns.

| Area | Envelope / major anchor | Function and real asset vocabulary |
|---|---|---|
| Transfer Court | x -18..18, y -16..16; crane at (0,0), long axis N–S | Contested low center. Real Factory gantry with original cabin/cable pivots; container-end supports, engine, recycling unit, roller table/forklift. Split central exposure into short exchanges; no full-length elevated crane firing path. |
| Dispatch Pocket | x -58..-28, y -20..24 | West re-entry side; trucks, camper, staggered containers, Scrapyard wreck/plate/junk cover. Two exits toward Transfer Court plus north/south bypasses. Containers screen spawns rather than forming one wall. |
| Receiving Yard | x 28..58, y -14..28 | East re-entry side; truck/forklift/container handling language, pallets, hazard markings. Broad enough for midrange combat with offsets limiting west–east spawn-to-spawn rays. |
| Workshop Terrace | x -24..44, y 20..40; garage shared assembly at (29,28), yaw 180° | North flank higher than drain. Real compact Garage shell/roof, stairs, rails, workbench/cart/shelves; a service court expands its identity. Connect west/north approach to east courtyard; inward opening around (-8,20) and (18,18). |
| Drain Cut | x -46..43, y -38..-20 | South flank lower, rolling eroded trench; wrecks, low quarry breaks, restrained corrugated plates/junk pockets. Inward exits at (-21,-18) and (16,-18), with exposed crossings rather than a protected tunnel. |
| Power Loop | x 19..45, y -26..-8 | Electrical cabinets, Factory machinery and real modular pipe family. Small readable openings; service props never substitute for full-height hard cover. Connect receiving/drain to center. |
| Outer Cut / Spoil Shoulders | outside playable ellipse; ridges primarily 65..100 m from center | Non-playable quarry rock, spoil mounds, erosion/cut breaks and sparse local foliage. Visible from gameplay and from cameras outside looking in. Natural variation frames arena; no continuous accessible high-ground ring. |

Reference placements are in `scene_manifest.json`. They are an art/massing input, **not verified spawn, collision or final placement coordinates**. Camera transforms are fixed reference viewpoints; construction may locally move cover/anchors to solve measured collision/visibility problems, documenting deviation. Do not redesign the macro route network during implementation.

## Terrain and elevation

New analytical heightfield has a low undulating basin, two broad shoulder pads, shallow south drainage depression and much larger outside spoil elevations. It is independent of Scrapline_Terrain_v1. Exact min/max and encoding are in terrain_import.json.

- Keep ordinary playable routes roughly -4..+3 m, smooth walking grades generally ≤10°, short deliberate ramps ≤15°. These are design targets requiring in-editor slope/traversal measurements, not passes from the Blender render.
- Flatten the **footprint** beneath garage, trucks, container stacks and machine anchors while preserving surrounding undulation. Blend edges over 3–6 m; avoid rectangular floating pads or a single giant flat yard.
- Use visible outside cuts/mounds roughly +6..+15 m. Sculpt concave channels, broken shelves and changing slope direction; dress with real ASQ pieces using material foot blends. Keep the outer boundary below the dominant skyline shoulders.
- Block exterior access with a coherent combination of collision/boundary devices and quarry/fence geometry. Barriers must not block intended views or cause invisible snags. No exterior ridge becomes a camping route.
- Limit intentional raised combat decks to +3..+4 m above local grade; each has two ways on/off and only local coverage. Use actual Scrapyard catwalk modules with their supporting collision kit; the currently rendered reference does not contain a final playable catwalk assembly. No routine Garage roof access or playable crane span.

## Combat, spawning and readability

Retain native FFA and narrow Armory gameplay identity. Keep the existing gameplay/economy/UI documents authoritative for their rules, but replace all old frozen coordinate/region constraints with this spec and new measured spawn placement.

- Distribute **19 native spawn pads** across multiple west, east, north and south pockets, never as two opposing teams. Candidate clusters: Dispatch 5, Receiving 5, Workshop margins 4, Drain margins 3, Power margin 2. Final pads must sit on navigable ground and behind real hard cover. Keep pads away from center pressure/roof silhouettes.
- Each pocket gets two distinct exits, cover within approximately 3–6 m and a standing-eye screen toward center. Perform rays from 1.7 m eye height toward major firing points and other spawns. Reject direct pad-to-pad and dominant elevated sightlines, using local offsets instead of building a spawn bunker maze.
- Center should produce 10–25 m engagements with brief 30–45 m glimpses along deliberately broken approaches. Avoid an uninterrupted west–east shooting corridor. Cover gaps and heights should alternate: 0.6–1.1 m crouch pieces, 1.3–1.8 m standing interruption, 2.8–3 m containers/vehicles. Do not claim a junk prop is hard cover without collision validation.
- Flanks offer longer repositions but remain contestable at two inward junctions each. Navigation widths target ≥3 m main lanes, ≥2.5 m secondary routes; 4–6 m around major turning points. Measure collision envelopes, not visible mesh gaps.
- Crane is the central orientation cue; workshop roof is a north silhouette; yellow electrical/pipe signs distinguish southeast; a wreck/dispatch signature distinguishes west. Do not create a tall tower solely to signal a spawn.
- Real mesh bounds matter: crane main mesh 5.685×26.895×4.738 m (full old shared assembly envelope ~5.448 m high), garage assembly ~16.541×9.375×7.970 m. Preserve shared pivots. The reference crane support/cable clearances require native collision confirmation; correct its vertical fit as a group.

## Materials, decals, density, foliage and light

Rust steel, faded grey/blue painted metal, dusty quarry aggregate, worn rubber/vehicles and restrained industrial yellow form the palette. Match existing textures rather than repainting every pack into a synthetic palette. New material instances may unify roughness/dust only after source inspection.

Ground uses a new Landscape instance with validated dirt/gravel base, exposed slate on steep outside cuts, compacted track surfaces at loading/service thresholds and foot blending. First evaluate the restored MW auto material; otherwise create a new native customizable Landscape instance with local quarry textures. Preserve both source options. The Blender preview uses exact local `udlladln` quarry ground Albedo/Normal; those source maps require selective import if not already available in UEFN. They are not an automatically approved shipping material.

Use warning decals on logical equipment faces and route entrances, at readable scale without becoming combat targets. Add small grime/repair markings from verified sources at real material transitions; create missing decals with proper alpha/PBR sources if no local equivalent exists. Keep floor arrows sparse and avoid dense hazard-striping everywhere.

Concentrate salvage/junk, loose barrels, pallets, tires and rubble near equipment feet/perimeter. Target ~60–70% of navigable routes visually clean; clutter must not force players to weave around ankle props. Large SCBK junk/wreck masses are available as supplemental area identity and hard cover only after collision checks. The Blender reference documents this supplemental kit on the asset board rather than fabricating these read-only meshes.

Foliage is sparse dead grass/weeds only on noncombat margins; inspect actual mounted/raw foliage assets before use. If no suitable licensed local foliage resolves, omit it and record that—no invented trees required. Quarry rock/aggregate and salvage carry the perimeter.

Light: readable late-morning daylight with broad skylight, modest warm sun, neutral shadow detail. No thick atmospheric haze, bloom veil or storm/fire spectacle. Talisman dust/steam/sparks are restrained local accents. Preserve daylight and silhouette readability at player height across both sides.

## Creation / migration still required for the shipping build

1. New Landscape and fresh heightmap import; new validated ground material instance and paint/layer info. Evaluate restored MW shader in UEFN; selectively migrate dependencies only after validation. Ground source maps `udlladln` may require selective texture import.
2. If using reference Junkyard barrel variants, import specific FBX/Albedo/Normal/roughness maps and create corresponding UE material instances plus collision. Existing native barrel/propane assets can fill this minor role; do not replace core anchors.
3. Any needed bespoke lane marking or grime decal must have actual local textures/alpha and a decal material before placement. No mandatory new building, crane, workshop, vehicle, fence, pipe or catwalk mesh is needed.
4. Final native catwalk assembly, spawn cover refinements, boundary collision, foliage selection and lighting are implementation tasks. Reference renders do not certify them.

## Evidence limits

All reference views are new Blender compositions made from actual local geometry and source textures. UE custom shader masks/glass/normal handedness can differ from Blender reconstruction; exact native materials on the asset board and in UEFN remain shader authority. These are concept/reference compositions, not screenshots of a finished Fortnite level or proof of gameplay performance. The final gauntlet must capture the real fresh level at the same viewpoints.
