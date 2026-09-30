# Scrapline — Physical-Fit Verification

## Status

**VERIFIED — 2026-09-29.**

The physical-fit gate is closed for the frozen finalists below. No production actors were spawned, moved, saved, promoted, or modified during verification.

## Method

- Curated Factory, Garage, Vehicle V2, and Factory container meshes were measured from their local Static Mesh bounds in the live Scrapline UEFN project and independently cross-checked in the UE 5.6 ScrapStage56 donor/staging project.
- Live UEFN and staged measurements matched exactly for all nine curated meshes, so no migration scale drift was found.
- Scrapyard catwalks were measured directly from the selected read-only referenced assets in UEFN. Static Mesh Editor overlays were used to confirm Nanite state and collision primitive counts.
- Dimensions are local axis-aligned bounds at identity scale. World rotation changes the footprint axes but not the asset dimensions.
- Collision counts below are simple-collision primitives. All inspected meshes use the default collision trace mode.

## Locked gameplay yardsticks

- Primary combat lanes: 7–10 m before cover.
- Secondary routes: 4.5–7 m.
- Normal elevated route band: +4–6 m.
- Rare maximum useful perch: +8–10 m.
- Central Kill Yard: approximately 42 m across.

## Curated finalist metrics

| Asset | Local min XYZ (cm) | Local max XYZ (cm) | Size X×Y×Z (m) | Collision | LOD / Nanite | Decision |
| --- | --- | --- | --- | --- | --- | --- |
| Factory SM_Crane01 | -306.679, -1344.734, -158.099 | 261.787, 1344.734, 315.724 | 5.685 × 26.895 × 4.738 | 19 convex | 3 LODs / Nanite off | Keep as primary hero structure; long-axis placement must preserve multiple exits. |
| Factory SM_CraneCabin01 | 48.893, -1130.052, -146.362 | 258.431, -901.680, 119.468 | 2.095 × 2.284 × 2.658 | 1 box | 2 LODs / Nanite off | Keep with shared pivot; do not ground independently. |
| Factory SM_CraneCable01 | -275.173, -1333.286, -229.070 | 80.028, 228.826, 196.741 | 3.552 × 15.621 × 4.258 | **0 simple primitives** | 3 LODs / Nanite off | Visual-only collision behavior; never rely on the cable as blocker, cover, or climbable structure. |
| **Factory crane shared-pivot envelope** | **-306.679, -1344.734, -229.070** | **261.787, 1344.734, 315.724** | **5.685 × 26.895 × 5.448** | 19 convex + 1 box + cable 0 | mixed above | Keep primary. Preserve all three relative pivots. Do not auto-ground the group from the cable's lower bound. |
| Garage SM_Garage_1 | -819.536, -419.536, ~0 | 827.628, 419.536, 499.348 | 16.472 × 8.391 × 4.993 | 7 boxes | 1 LOD / Nanite off | Keep as compact workshop shell. |
| Garage SM_Garage_1_roof | -826.437, -468.768, 504.113 | 826.437, 468.767, 797.032 | 16.529 × 9.375 × 2.929 | 1 convex | 1 LOD / Nanite off | Keep shared with shell; roof top is near the rare-high band. |
| **Garage shared-pivot envelope** | **-826.437, -468.768, ~0** | **827.628, 468.767, 797.032** | **16.541 × 9.375 × 7.970** | 7 boxes + 1 convex | 1 LOD each / Nanite off | Keep primary workshop shell; restrict roof access rather than treating it as routine traversal. |
| SM_BoxTruck_01a | -316.566, -135.505, -0.714 | 230.409, 135.505, 286.668 | 5.470 × 2.710 × 2.874 | 1 convex | 1 LOD / Nanite off | Keep Loading Yard primary vehicle cover; do not rely on fine undercarriage collision. |
| SM_Campervan_01a | -301.467, -129.977, -0.004 | 296.106, 129.977, 287.760 | 5.976 × 2.600 × 2.878 | 1 convex | 1 LOD / Nanite off | Keep Wreck Yard primary vehicle form; use as full cover, not precision parkour geometry. |
| Factory SM_Container01_01 | -140.029, -299.781, 0.143 | 140.029, 299.991, 301.165 | 2.801 × 5.998 × 3.010 | 1 box | 3 LODs / Nanite off | Keep as preferred routine gameplay container because collision is simple and predictable. |
| Factory SM_Container01_02 | -140.029, -299.781, 0.143 | 140.029, 299.781, 301.165 | 2.801 × 5.996 × 3.010 | 1 convex | 2 LODs / Nanite off | Keep as visual variant; same fit, slightly less mechanically simple collision. |

## Read-only Scrapyard catwalk samples

| Referenced asset | Local min XYZ (cm) | Local max XYZ (cm) | Size X×Y×Z (m) | Collision | Live editor state | Fit decision |
| --- | --- | --- | --- | --- | --- | --- |
| SCBK_metal_catwalk_set_01_01_L0 | -256.000, -256.418, 0.000 | 256.446, 256.000, 490.601 | 5.124 × 5.124 × 4.906 | 5 convex | Nanite Enabled | Keep primary stair/rise module; its ~4.9 m rise lands directly in the normal +4–6 m band. |
| SCBK_metal_catwalk_set_01_04_L0 | -256.000, 0.183, 0.000 | 256.000, 256.000, 114.520 | 5.120 × 2.558 × 1.145 | 5 convex | Nanite Enabled | Keep primary flat elevated module; ~2.56 m gross width is suitable for controlled traversal. |
| SCBK_metal_catwalk_set_01_07_L0 | -256.000, 0.183, 0.000 | 256.000, 256.000, 114.520 | 5.120 × 2.558 × 1.145 | 5 convex | Nanite Enabled | Same footprint as 01_04 with a more exposed railing variant; useful where counter-angle exposure is desired. |
| SCBK_wooden_catwalk_set_01_01_L0 | -280.756, -256.000, -1.904 | 275.191, 286.700, 488.729 | 5.559 × 5.427 × 4.906 | 5 convex | Nanite Enabled | Retain only as rare Wreck Yard rise/accent; not small enough to scatter as filler. |
| SCBK_wooden_catwalk_set_01_04_L0 | -265.799, -20.721, -12.679 | 256.005, 264.415, 132.690 | 5.218 × 2.851 × 1.454 | 4 convex | Nanite Enabled | Retain as rare short wooden span; wider/chunkier than metal flat module. |

Referenced catwalk source assets remain read-only by design. No promotion is justified by this fit pass.

## Gameplay implications

### Factory crane

- The 26.895 m long axis consumes about 64% of the 42 m central-yard diameter, so it is a true central composition element, not a prop.
- Its 5.685 m cross-axis can erase most of a 7 m lane if placed broadside. Orient it longitudinally or obliquely and preserve multiple side/underpass exits.
- The shared-pivot envelope is 5.448 m tall, directly inside the normal mid-elevation budget, but the cable extends about 0.71 m below the main crane's lowest bound. **Ground from the structural crane contact, not the lowest cable bound.**
- The main crane's 19 convex hulls mean its supports and body will materially shape movement. Treat upper access as controlled and exposed; do not create a safe 26.9 m elevated firing lane.
- The cable has no simple collision and must stay decorative unless a later implementation need explicitly justifies a collision change.
- Result: **primary choice retained.** Deserted Props crane remains an existing fallback, not a replacement.

### Garage

- The full assembly footprint is only 16.541 × 9.375 m, confirming it is a compact workshop rather than a district-sized warehouse.
- The roof reaches 7.970 m in local height. If players can access the roof, it sits near the rare-high band and must have strong counter-angles and exits.
- Result: **primary shell retained; roof access restricted/intentional.** Build district identity outward with exterior service cover and Scrapyard glue.

### Vehicles

- Both vehicles are roughly 2.6–2.7 m wide and 2.87–2.88 m tall, so each is full standing cover and a meaningful lane blocker.
- A centered vehicle placed broadside in a 4.5 m secondary connector leaves only about 1.8–1.9 m total residual width. Offset/angle them rather than using them as plugs.
- One-convex collision is appropriate for static-cover use but too coarse to assume precise wheel-well, undercarriage, or bumper traversal.
- Result: **both retained.** Use as static cover silhouettes, not precision movement geometry.

### Containers

- Each container is approximately 6.0 × 2.8 × 3.0 m and provides full hard cover.
- Broadside placement across a 4.5 m connector leaves only about 1.7 m total residual width and should be avoided unless the choke is intentional.
- One container roof is a low ~3 m perch. Two stacked containers reach ~6 m, the top of the normal mid-elevation band, so double stacks must be exposed and counterable.
- Result: **both retained; 01_01 preferred for routine cover, 01_02 for variation.**

### Catwalks

- The rise modules span almost exactly 4.9 m vertically, so they naturally connect ground to the approved +4–6 m band without scale adjustment.
- Flat metal modules are ~5.12 m long and ~2.56 m wide. Three chained modules already create ~15.36 m of elevated runway, so long uninterrupted chains carry real perch/sightline risk.
- Wooden modules occupy equal or greater space than the metal family; their rarity remains justified by both visual language and footprint.
- Result: **metal remains primary; wood remains rare accent.** No referenced-content promotion required.

## Final physical-fit decisions

- **No finalist is replaced.** The frozen primary/fallback structure still holds.
- **Factory crane retained** with two restrictions: preserve the shared pivot and prevent a safe full-length upper route. Do not ground from the cable's lower bound.
- **Garage retained** as the Ruined Workshop shell; roof traversal is not a default route.
- **Box Truck and Campervan retained** as static full-cover forms; do not design fine traversal around their one-convex collision.
- **Factory containers retained**; avoid accidental secondary-lane plugs and treat double stacks as deliberate +6 m traversal.
- **Metal catwalk family retained as primary elevated kit**; avoid long chained runways.
- **Wooden catwalk family remains restricted to rare Wreck Yard use.**
- **No Fab Referenced Content promotion is needed for physical fit.**
