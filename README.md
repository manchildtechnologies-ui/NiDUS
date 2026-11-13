# PS5 Welcome Hub custom widgets — project root




## WelcomeHubActivator prerequisite


The PS5 Welcome Hub must be active before custom widgets can run. If it is not already active, install and run [WelcomeHubActivator](https://github.com/ghost1372/WelcomeHubActivator) by [@ghost1372](https://github.com/ghost1372), available from the [WelcomeHubActivator Releases page](https://github.com/ghost1372/WelcomeHubActivator/releases). WelcomeHubActivator enables the Hub; this project adds custom-widget support on top of it.


A huge thank you to [@geodox](https://github.com/geodox) for the excellent original [PS5 Welcome Hub Widgets project](https://github.com/geodox/ps5-wh-widgets), its bridge and SDK, and for making this community work possible. This fork builds on that foundation.


## How this fork differs


This community-maintained fork is developed separately from geodox's upstream project. It retains the original widget framework and adds static-bridge compatibility work plus bridge-backed Options-menu actions, including ZIP management for Weather. Firmware support is tracked for each bridge build; this is not an official upstream release.


The fork is preparing to include **Calculator**, **Tetris**, **Weather**, and **Widget Store** widgets. Calculator is a D-pad-controlled four-function calculator; Tetris is a falling-block puzzle; Weather shows current conditions and a five-day forecast with saved ZIP codes; Widget Store browses the community widget catalog.


![Calculator, Tetris, Weather and Widget Store running in the PS5 Welcome Hub](img/welcomehub-showcase-20261113.jpg)


## Welcome Hub




The Welcome Hub is a customizable panel on the PS5 home screen, added in a 2024 system software update. It shows a grid of widgets — battery, trophies, storage, friends, recently played and more — that the user can rearrange, resize and toggle from an "Edit Widgets" screen. Sony ships a fixed set of widgets; this project lets you add your own alongside them.




## Widgets




The Welcome Hub is built with **React Native**, so a widget is just a **React view** — a component built from native primitives like `View`, `Text` and `Image`, not HTML/CSS. There is no DOM, no `div`, no `window`.




The SDK hands your widget everything it needs through a single handle, `globalThis.__wh`: React and the RN primitives, the hub's own stock-styled `Title`/`Label` components, icon and font helpers, and your parsed `config.json`. The framework wraps each widget in an error boundary (a bad render only breaks that one tile), gives it native focus and resizing, and shows it in the Edit Widgets list with your title, icon and description.




For the full API, sizes, styling rules and the stock-look components, see **[docs/sdk/](docs/sdk/README.md)**.




## Widgets in development


The following original widgets are planned for inclusion in this fork:


- **Calculator** — four-function calculator controlled with the D-pad.
- **Tetris** — a small falling-block puzzle.
- **Weather** — current conditions and a five-day forecast, with saved ZIP-code management through the compatible bridge's Options menu.
- **Widget Store** — browse the community catalog and install widgets.


## Upstream Sample Widgets


The upstream Hello Hub and Payload Monitor examples remain available in [sample-widgets/](sample-widgets/) and the [Releases](releases) page.


### Hello Hub


A minimal reference widget: a live, ticking clock that demonstrates the SDK, hooks, stock text and timers.


### Payload Monitor


Shows running homebrew payloads with their process IDs and memory use, using the local ps5-payload-manager server.


## Building a Widget




A widget is a folder with a `widget.js` (the component) and a `config.json` (its metadata). No build step, no bundler — `widget.js` is plain JavaScript evaluated once when the hub loads, and must be self-contained (no `import` / `require`).
