# Scrapline — Armory UI Specification

## Status

**APPROVED UX DIRECTION — FINAL PRESENTATION DEFERRED TO ASTRA CONSTRUCTION.**

This document owns the presentation/navigation contract for the Scrapline Armory. It does not change the economy rules in `ARMORY_ECONOMY_SPEC.md` or the gameplay authority split in `VERSE_GAMEPLAY_INTEGRATION.md`.

The earlier pure-Verse shop is a **functional test harness only**. It proved the economy, catalog, countdown, indexed grants, and next-loadout interaction path, but its default Fortnite button styling is not production presentation.

### Execution disposition

The current ChatGPT/remote-editor mode is **not the authority for final Armory visual implementation**. It successfully established the mechanic, UMG/Verse event bridge, paged browser architecture, and compile-clean scaffold, but repeated UEFN editor/validation/session friction made continued visual iteration inefficient.

**Astra owns final Armory presentation during the primary level-construction pass.**

Astra may:
- keep and repair the existing `WBP_ScraplineArmory` scaffold, or
- rebuild that widget cleanly if doing so is faster/safer.

Astra must preserve the approved UX contract in this document and the economy/lifecycle contract in `ARMORY_ECONOMY_SPEC.md`. It must not replace the Armory with the earlier oversized pure-Verse/debug menu.

## Reference synthesis

The approved interface combines:
- **VALORANT:** fast category readability and buy-phase clarity,
- **Insurgency: Sandstorm:** scalable browsing for a large weapon catalog,
- **Apex Arenas:** match-local weapon economy and price as a balance lever,
- **THE FINALS:** between-life adaptation / next-loadout thinking,
- **Warzone:** shortcuts and reduced friction for very large arsenals,
- **CS2:** buy-phase pacing, economy philosophy, refund/rebuy expectations.

Do **not** visually clone any single game.

## Core navigation model

Catalog categories and equipped slots are different concepts.

### Catalog categories

Initial category bar:
- FEATURED
- PISTOLS
- SMGs
- SHOTGUNS
- ARs
- MARKSMAN
- SNIPERS
- SPECIAL

The backend may contain many more weapons than one page can display.

Each category:
- pages or scrolls through a compact grid,
- shows approximately 6–8 weapon cards at once,
- does not require drilling through nested menus,
- preserves current cart/loadout state while navigating.

### Equipped loadout

The loadout/cart region shows the player's actual three weapon slots:
- Primary,
- Secondary,
- Sidearm.

Category names must never be used as synonyms for inventory slots.

## Full catalog vs active rotation

The architecture supports a large full Fortnite weapon catalog.

A catalog entry may be:
- Core,
- Featured,
- Rotating,
- Limited/Seasonal,
- Vaulted/Disabled.

The player-facing shop only renders enabled entries.

Featured is the fast lane for new players and seasonal promotion; it is not a separate inventory type.

## Screen composition

Production presentation uses `WBP_ScraplineArmory` in UMG.

### Header
- SCRAPLINE // ARMORY
- current Scrap balance
- buy/adaptation timer when applicable
- context label: OPENING BUY / NEXT LOADOUT / JIP / RESPAWN BUY

### Category/navigation bar
- compact horizontal tabs
- clear active category state
- no giant Fortnite pill buttons

### Weapon browser
- compact rectangular cards
- weapon silhouette/image is the visual focal point
- weapon name
- Scrap price
- clear affordable / unaffordable / selected / featured / disabled states
- thin borders and flat panels
- no oversized centered status copy

### Loadout/cart rail
Always visible:
- Primary
- Secondary
- Sidearm
- loadout total
- projected Scrap remaining
- queued-next-loadout state when editing during life

### Quick actions
- Ready / Deploy / Save Next Loadout
- Re-buy Previous
- Clear
- Favorites / Recent can be added later without changing the core browser

## Visual language

- compact tactical storefront, not Fortnite default UI
- dark charcoal / near-black translucent surfaces
- dirty white text
- Scrapline accent may use restrained industrial green/olive plus cool weapon-state blue
- flat rectangular tiles
- thin separators/borders
- world/player remains readable behind the panel
- native HUD is hidden while the Armory owns full input focus and restored on close

Avoid:
- huge black full-screen rectangles,
- oversized rounded white buttons,
- giant centered paragraphs,
- one-column scrolling lists,
- forcing the entire Fortnite arsenal onto one page.

## Scale target

Design at 1920×1080 first.

The primary Armory panel should occupy roughly 60–70% of screen width and 65–75% of screen height, leaving visible world context.

Controller navigation must remain practical.

## Economy-state presentation

Opening phase:
- show current Scrap and countdown,
- cart edits are refundable until commitment,
- Ready may close the browser but does not release combat early.

Alive / Next Loadout:
- explicitly label **NEXT LOADOUT**,
- show **CHARGED ON NEXT SPAWN**,
- editing never changes current-life weapons.

Death/JIP:
- show the hard decision timer,
- surface Re-buy prominently,
- fall back safely if time expires.

## Implementation boundary

- UMG owns appearance/layout.
- Verse owns economy/catalog/lifecycle state.
- Do not migrate score, match-end, spawn selection, or environment ownership into the widget.
- Use Verse fields / MVVM or generated widget interfaces where the current UEFN compiler/toolchain supports them.
- Keep the pure-Verse UI only as a temporary debug/fallback harness until the UMG widget is validated in-game.

## Acceptance gate

The production Armory UI is an **Astra build/post-build acceptance item**, not a pre-Astra blocker. It is not accepted until:
1. `WBP_ScraplineArmory` compiles.
2. Verse can open/close it for one player without affecting others.
3. Scrap, timer, category, weapon-card, loadout, and projected-balance state update correctly.
4. weapon selections reach the existing Armory economy logic.
5. Ready / Re-buy / Next Loadout interactions work with mouse/controller.
6. no default Fortnite pill-button presentation dominates the production screen.
7. JIP and respawn shop contexts render correctly.
8. native HUD restoration is clean after the Armory closes.

## Implementation checkpoint — 2026-09-30

Current live UEFN state:
- production widget asset exists at `/Scrapline/UI/WBP_ScraplineArmory`,
- the widget uses **21 UMG Custom Buttons**: 8 category tabs, 8 reusable weapon-card hit targets, Prev/Next, Ready, Re-buy, and Clear,
- the weapon browser is paged at **8 cards per page** so the backend catalog can grow without expanding the widget tree,
- the right-side loadout rail remains separate from catalog categories,
- generated Verse `event(tuple())` fields now exist for every category/card/action control,
- Custom Button `OnButtonClicked` events are bound through UMG MVVM to those Verse events,
- `scrapline_armory_device.verse` instantiates `UI.WBP_ScraplineArmory{}` and subscribes to the generated events,
- Verse owns all dynamic text/state (Scrap, timer, category state, card names/prices, selected/affordable state, loadout rail, pagination),
- the Verse text overlay is explicitly layered above the UMG presentation shell,
- live `ValkyrieToolset.VerseToolset.BuildAll` currently returns **0 diagnostics**.

Validation lesson:
- setting `UIFrameworkCustomButtonWidget.DefaultContentWidgetClass = None` is **not allowed** by UEFN validation,
- production styling must preserve Epic's default content class,
- the accepted approach is to keep the required Custom Button content, make the button itself visually transparent, and render Scrapline's flat card/image surface beneath it,
- the failed `WBP_EventProbe` experiment that created a restricted K2 Blueprint node was deleted.

The last live play-session refresh was blocked by an expired Epic Connect token (`EOS_EpicConnect_TokenIsNoLongerValid`). A later UEFN relaunch refreshed authentication, but the Home-panel/session workflow remained inefficient in this control mode.

**Disposition:** stop iterating the final UMG presentation here. The current widget/event bridge is a scaffold and evidence package for Astra. Astra must finish the visual implementation and run the acceptance gate above as part of the real level build.

