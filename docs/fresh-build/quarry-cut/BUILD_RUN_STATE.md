# Fresh-build run state

Phase: native primary construction in progress; terrain, anchors, perimeter, local decks and gameplay placement saved. Final acceptance NOT TESTED.

## Active authority and recovery
- Checkout: C:/Users/mikea/OneDrive/Documents/ChatGPT/Scrapline-QuarryCut; branch codex/quarry-cut-implementation-20260930, based on origin/fresh-build/quarry-cut-20260930 at7a988b5. Last pushed checkpoint6f396b3; next checkpoint follows this ledger.
- Original Scrapline checkout and historical level/.lore retained; pre-existing changes untouched.
- Actual project: C:/Users/mikea/Documents/Codex/2026-09-27/i-want-to-1-shot-a-3/outputs/Scrapline/Scrapline.uefnproject; cloud06b62c9c-a34d-4c11-beea-80cb4e5d9e60.
- Active world: /Scrapline/FreshBuild/QuarryCut/Fresh_QuarryCut; native World Partition. Epic unreal-mcp and Power Tools responding; Power Tools30commands discovered. Never retry mutations solely because transport timed out; inspect deterministic names, saved packages and session state.
- All reference IDs01–16, boards20–23 and supplemental SCBK12 actually inspected. Native yellow crane/rust containers/materials outrank Blender grey/orange reconstruction.

## Saved construction
- QC_A001..080: real reference anchors, preserving shared crane and garage pivots. QC_A037 locally moved to(-40,-30.5,-2.45)m to fit protected Drain pocket; footprint followup pending.
- Landscape: new253x253,16components/4streaming proxies, XY91.269841cm,Z8,corner(-11500,-11500,0). Original fresh heightmap hash42772cfb6c19bd3cd3327f447eb532fb44ee5140ed95e40fd4537c9ff2fed788 preserved.
- Existing native Landscape reimported from QuarryCut_253_Footprints_16bit.png, hash143528677c4f8b6dc1b7108da815b08237f386243b173d62ea6874d423aa1a21.31 measured heavy footprints,6m blends; representative native edge samples verified. Whole-ellipse95th slope10.88deg/99th17.09deg; route-specific grading NOT accepted yet.
- MW master dependency closure migrated through native engine AssetTools from preserved ScrapStage56; no demo maps/Blueprints requested. Live shader fails Missing Material Function/MakeMaterialAttributes. Source and migrated subset retained.
- Authorized fallback: new MI_QuarryCut_Ground parent MI_Scrapline_Yard, local intact udlladln Albedo/Normal imported4K; ASQ xckjajs cliff textures. Base_TextureScale300cm; Base_UseGrassType0; all five Landscape actors bEnableGrass false. Gravel visible/no checker/no dense grass. Paint/track layers and texture-memory pass pending.
- QC_D001..036:6large outside junk masses,10wrecks,20junk foot clusters; saved.
- QC_R001..048: real ASQ footing, uniform1.2/1.7, no elongated axes; Power Tools placement, Epic save.
- QC_F001..080: native SCBK wire fence at ellipse66x56m,512cm panels pitched to terrain endpoints/20cm burial; saved. Continuity/runtime traversal pending.
- QC_T001..006: two real SCBK stair/landing/stair assemblies, north center(0,31)m/east(53,-21)m. Stair direction established by native floor traces. Bases-275/-145cm; platform pivot385.4cm above base plus native floor thickness12cm. Two accesses each,2.56m narrow landing; terrain foot grading and full traversal pending. T001 label still WestAccessA although effective north assembly; rename during cleanup.
- QC_Screen001..028: short reclaimed SCBK solid metal wall screens with native convex collision, uniform .6, Screen019 .65 and Screen026 .8. Saved initially; recent019/026 changes require explicit save.
- QC_B001..024_OuterBoundary:24thin native barrier boxes tangent to ellipse67x57m,3.7x.1x8tiles (18.944m x .512m x30.72m),base-8m,clear material,Always,nobulletblocking. Saved/readback matches. BarrierBounds component scale3.7,.1,8; actor streaming bounds include broad editor preview and are not collision evidence. Runtime continuity and roof/crane barriers pending.

## Gameplay placement/readbacks
- Exactly19new pads: Dispatch5,Receiving5,Workshop4,Drain3,Power2; saved. NATIVE_GAMEPLAY_STATE.json owns actual actor refs/XYZ/settings. All Always,Anyteam/Anyclass,priority1,islandstarttrue,visiblefalse,enemy preference10m. Native random individual selection remains authority.
- Main Island native properties set/read back:16players,FFA,1round,roundTimeLimit10.75,30elims,3srespawn,2simmunity,unlimitedspawns,JIPSpawnImmediately,100/100,noovershield,50sustain,nobuild/destruction,reserveinfinite/magazinefinite,nodrops/deleteitems,movementon. MaximumEquipmentSlots3 required native UI; legacy maxItemSlots5/bLimitfalse and timeLimit300 are not effective UI proof. Runtime clock/inventory checks required.
- New IG_Armory,EM_Economy,IT_Armory,TR_Eliminations,QC_Armory under Gameplay; no Timer/EndGame. Native tag components read back exact unique armory_granter/economy/input tags. Accepted live Verse/UMG source remains source library unchanged.
- IG_Armory seven itemListData entries0..6 registered incrementally (ObjectToolsArrayAdd cannot resize and change existing elements together). New weapon paths in NATIVE_GAMEPLAY_STATE. KeepAll/Always/TriggeringPlayer/NeverDrop/noautogrant/nogranttimer readback. Cached itemList/itemsToSpawn empty in Create; real indexed grants must be tested.
- TR_Eliminations30,Eliminations,Detailed,Individual,DoNothing,noPersistence,assignedstart/JIP readback matches.
- EM validOnSelfEliminationfalse readback; targetType write PlayersOnly reverted to AllTypes—correct through native UI/tag-backed setting before acceptance. No reward items registered.
- IT Custom14ToggleInventory,consume/showHUDtrue,AddRegistered readback matches.
- QC_L001_LateMorning new DaySequence fixed11,sun8,warm-neutral,skylight1.5white,fog.002. Native day/night parameters readback; skydomeEnabledDuringPhase derived read-only None while enableDuringPhaseAlways. Visual sky/readability polish pending.

## Measured evidence and limits
- NATIVE_ASSET_AUDIT.json covers26anchors+14supplements and all18quarry bounds; NATIVE_DETAIL_AUDIT covers9new detail candidates. Used slots resolve and simple hulls read. Cable decorative/no collision. Mounted LOD count0 is accessor limitation, not runtime certification.
- SPAWN_RAY_AUDIT: initial27visible pad-pairs; after25screens all171rays occluded at170cm eyes. Last sweep after026 initially still deck exposures5/north,7/east,13/north.026 now .8,027/028 added; rerun required. Rays/widths/cover distances/exit paths need refresh after terrain changes. Single-player rays do not certify12players.
- Native oblique and exteriorwest viewed, not saved final camera evidence. Required16final native images and threeexteriorviews still pending.
- Power Tools latest count352 before last2screens:276meshes,19pads+19nativeFortPlayerStarts,31devices,Landscape/proxies/internalWP. Inspect current count before edits.
- Existing Fortnite session connected from historical work. No fresh cook/push/start/multiplayer test performed. Do not assume active Fortnite contains fresh world.

## Next required work
1. Save recent screen changes/Island/gameplay; rerun deck and central/other-pad rays, measure two exits/widths and relocate/refine locally as needed.
2. Grade both catwalk feet and moved037 footprint, solve measured route slope pockets, reimport existing Landscape once; resnap affected dressing/pads/screens and rerun evidence.
3. Finish coherent salvage edge density, warning/grime/track transitions, real marginal foliage if licensed native source resolves; neutral daylight polish. Add roof/crane access barriers and verify exterior boundary.
4. Correct EM targetType in editor; verify current effective Island clock/inventory/ToyOptions individually (never aggregate writes). Inspect/reuse final Armory UMG, compile live Verse/widget.
5. Complete primary construction before runtime gauntlet: save,MapCheck/validation, cook/session push fresh target, gameplay/economy/UI matrix/traversal/respawn/JIP, memory/performance where reachable; explicitly NOT TESTED missing multiplayer evidence.
6. Capture/save real native IDs01–16 matching reference transforms, final acceptance/punch list, DOX and GitHub checkpoint. Preserve source libraries/MW/old world/.lore. No main merge/publication/messages/automations.
