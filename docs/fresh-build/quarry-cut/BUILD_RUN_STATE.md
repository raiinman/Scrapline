# Fresh-build run state

Phase: native primary construction in progress. Final gameplay, material and multiplayer acceptance NOT TESTED.

## Active authority and recovery
- Checkout C:/Users/mikea/OneDrive/Documents/ChatGPT/Scrapline-QuarryCut; child branch codex/quarry-cut-implementation-20260930, based on origin/fresh-build/quarry-cut-20260930 at7a988b5. Last pushed5d772a7; current evidence awaits the next checkpoint.
- Original checkout's pre-existing changes and historical /Scrapline/Scrapline level/.lore remain untouched.
- Actual project C:/Users/mikea/Documents/Codex/2026-09-27/i-want-to-1-shot-a-3/outputs/Scrapline/Scrapline.uefnproject; cloud06b62c9c-a34d-4c11-beea-80cb4e5d9e60.
- Active native World Partition level /Scrapline/FreshBuild/QuarryCut/Fresh_QuarryCut. Epic unreal-mcp and required Power Tools responding; latest live count383, including native editor helper. Power Tools30-command discovery completed.
- All required references01–16/boards20–23 plus SCBK supplemental12 actually opened. Native asset silhouettes/materials override Blender shader reconstruction.
- Inspect live state before timeout retries; deterministic names and readbacks prevent duplicate imports/placements/cooks.

## Saved construction
- QC_A001..080 real anchors, shared crane/garage pivots retained. A037 moved(-40,-30.5,-2.45)m and footprint fitted; A018 rail moved(18.4,27.5,-.03762)m yaw90 for Workshop spawn clearance.
- Native Landscape253²,16components/4streaming proxies, XY91.269841cm,Z8, corner(-11500,-11500,0), FlipYfalse. Original and first Footprints inputs retained. CURRENT AccessFit height input SHA8f6e3a6a1c5e3b62f399b285ceb5d9ec951540ccf5a4039f5169dabd0dc5108a; includes31 heavy footprints/moved037 and both stair footprint planes. All5 original native Landscape GUIDs preserved/readback and saved.
- Representative northfeet=-274.75/-275.05cm, eastfeet=-144.93/-144.75cm. Whole playable ellipse slopes95th11.10deg/99th17.71deg/max30.28deg: these are NOT a whole-arena grade pass. Measured route paths max14.10deg; short ramp classification/runtime walks still required.
- MW master dependency closure migrated through native AssetTools from preserved ScrapStage56, excluding requested demo maps/helper Blueprints. Live master shader fails Missing Material Function/MakeMaterialAttributes on PCD3D_SM6. Source/migrated subset preserved.
- Authorized fallback MI_QuarryCut_Ground parent MI_Scrapline_Yard: intact C:udlladln Albedo/Normal imported4K, ASQ cliff maps; base300cm scale, grass disabled on all5Landscape actors. Base packed SRM inherited native Apollo dirt: source-specific PBR and texture-memory review pending.
- Native Layer1_LayerInfo created in Fresh_QuarryCut_sharedassets, layerName Layer1/blendMethod None. CompactedTracks253²8-bit mask SHAec55860447387418df2d8f6f5f7f07af6a07facf531d46c747ec626e581c516b imported into Layer1 ONLY (height/visibility/otherlayers unchecked); same alignment/orientation. Native viewport shows traveled-ground paths, all5Landscape GUIDs unchanged/saved. Layer1 uses native Asteria Mud D/N/S,300cm scale,.35 normals,zero height contribution,tint(.35,.40,.47). Source-specific PBR review remains pending.
- QC_D001..036 real SCBK dressing; D015wreck moved(35.5,35.5,.6964)m/yaw125; D029junk moved(50.35,5.59,-.2019)m/yaw12. Outside D001..006 lowered with81 terrain footprint samples, minimum sampled grade-30cm; full transforms saved. Visual seam inspection still required.
- QC_R001..048 real quarry footing, uniform1.2/1.7; QC_F001..080 real512cm wire fence tangent ellipse66x56m/pitched endpoints/20cm burial. Native perimeter collision/continuity still requires runtime traversal.
- QC_T001..006 real stair/landing/stair assemblies, north(0,31)m/east(53,-21)m; bases-275/-145cm, two accesses each,2.56m landing, deck3.974m above grade. T001 renamed NorthAccessA. Native terrain feet fitted; pawn walks pending.
- QC_Screen001..035 real SCBK convex metal cover, uniform.6 except019 .65/026 .8/033 .7. All saved. Recent cover changes are native readbacks in clearance evidence; earlier placement plans are superseded where transforms differ.
- QC_B001..024 thin clear native barriers around ellipse67x57m; nobulletblocking/Always. B025Garage roof blocker at(29,28,5)m,17.15x9.98x19.2m; B026Crane span at(0,0,4.3)m,6.14x28.16x19.2m. Saved/readback; editor preview bounds do not certify runtime barrier collision.
- QC_P001..020 verified SCBK barrels/tires added at existing anchor feet, outside route envelopes and >4.5m plus radius from pads; full transforms saved. Signage/decals and sparse foliage remain to finish.
- QC_L001_LateMorning: Fixed11,sun8,warm-neutral,sky2.2white,fog.002; overrideSky gradient blend.55 with low(.48,.65,.79),mid(.25,.46,.73),high(.10,.23,.46). Native eye view inspected blue readable sky. enableDuringPhaseAlways; derived skydome field is read-only. Final opposing readability views pending.

## Gameplay integration
- Exactly19new native pads: Dispatch5/Receiving5/Workshop4/Drain3/Power2. Always/Anyteam/Anyclass/priority1/islandstarttrue/hidden/enemy preference10m, native random selection. Current transforms refreshed in NATIVE_GAMEPLAY_STATE; initial placement/ray records marked superseded.
- Latest moved pad centers metres:03(-45,16),06(50.5,-20),08(59.5,18),11(-32.5,25.5),13(15,34.5),14(38,39.5),15(-44.9,-33). Ground+5cm; standing eyes +165cm from pad pivot.
- Island effective native settings:16FFA,1round,roundTimeLimit10.75,30elims,3srespawn/2simmunity,unlimited,JIPSpawnImmediately,100/100,noovershield,50sustain,nobuild/destruction,reserveinfinite/finite magazines,nodrops/delete,movementon,nativeFallDamageV2false. UI MaximumEquipmentSlots3. Legacy timeLimit300/maxItemSlots5/bLimitfalse do not prove effective runtime values; runtime clock/inventory required.
- Fresh IG_Armory/EM_Economy/IT_Armory/TR_Eliminations/QC_Armory saved and unique native Verse tag components verified. No Timer/EndGame second authority.
- Seven IG itemListData slots0..6 registered sequentially, KeepAll/Always/TriggeringPlayer/NeverDrop/noautogrant/timer. Cached itemList/itemsToSpawn empty in Create; indexed runtime grants NOT TESTED.
- TR30Eliminations/Detailed/Individual/DoNothing/noPersistence/start/JIP. IT Custom14ToggleInventory/consume/showHUDtrue/AddRegistered.
- EM effective Target Type Tag query ANY(Creative.EliminationManager.EnemyType.Player), token stream[0,1,1,1,0]; native Details Players Only. Deprecated target Type enum AllTypes is not effective target selector. valid On Self Eliminationfalse, no reward items.
- Accepted live Content/Verse source is more advanced than Git mirror; includes EconomyFlushQueued and UI.WBP_ScraplineArmoryArt. Preserve it; inspect before edits/mirroring. Production Art widget54widgets inspected; actual final presentation and BuildAll/widget compile still pending.
- Session NOW Disconnected by current native status/UI. No fresh cook/push/start has been performed. Do not assume earlier historical Fortnite session contains this world.

## Measured evidence and limits
- NATIVE_ASSET_AUDIT and NATIVE_DETAIL_AUDIT: exact mounted paths/material slots/native bounds/simple hulls; decorative cable excluded from cover. Mounted LOD accessor0 is not runtime certification.
- Ten connected conservative0.5m route models found at3m main/2.5m secondary widths; endpoint relocation up to4m allowed. Native131route samples×32radial traces=4192 noobstructions BEFORE latest screen/spawn/detail changes; refresh final paths/samples after dressing.
- Current native spawn audit BEFORE foot-details: all171pad-pair rays occluded; all19pads→6tested center/deck points occluded. Immediate125cm radius at45/110cm above pad grade clear. This does not certify all raised positions or12-player safety.
- Conservative two-exit model passes16pads; remaining03/05/14 checked by native1m local grids±9m, radial125cm at45/110cm heights and ≤15deg heightfield grades. Two distinct path headings≥60deg by5m/8m found;58pathnode samples after latest cover had zero hits. Native pawn traversal remains NOT TESTED. All exit evidence must be refreshed if cover/terrain changes affect it.
- Required4–6m turning spaces, full elevated firing sampling, native route/deck walks, memory/profiling, multiplayer/JIP/economy matrix, validator/cook and final16camera captures remain incomplete.
- No final screenshots/Lore checkpoint produced yet. New native passes remain construction evidence.

## Tool contracts and immediate next work
- ActorTools.set_actor_transform unexpectedly resets omitted rotation/scale to identity despite schema prose. ALWAYS send complete location/rotation/scale, read back, save. Affected earlier writes restored from recorded native transforms.
- Classic device property names can contain spaces; discover exact keys. Never aggregate ToyOptions/playerOptionData writes. Direct effective native/UI values outrank legacy aliases.
- Native Landscape editor gizmo is not an external actor; save only actual Landscape/proxies individually or save level.
1. Finish logical industrial signage/decals, optional verified sparse margin foliage, source-specific PBR/texture-memory review; inspect feet/material joins/neutral lighting from reference cameras. Current native UI Landscape Import with Layer1 only; Message Log modal may be open.
2. Refresh final geometry/routes/spawn/exit/turn/raised-point measurements after detail pass, correct local failures; organize native folders.
3. Inspect accepted source/production UMG, live BuildAll/widget compile; complete primary construction, save/checkpoint.
4. Native MapCheck/validation, fresh cook/session launch, actual Fortnite traversal/gameplay/Armory matrix and available multiplayer/memory tests; explicit NOT TESTED for unavailable evidence.
5. Save actual native camera IDs01–16 incl3exterior, acceptance/punch list, DOX/local Lore and meaningful fresh-branch GitHub checkpoints. No main merge/publication/messages/automations.
