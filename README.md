# PS5 Welcome Hub custom widgets — project root
















## WelcomeHubActivator prerequisite








The PS5 Welcome Hub must be active before custom widgets can run. If it is not already active, install and run [WelcomeHubActivator](https://github.com/ghost1372/WelcomeHubActivator) by [@ghost1372](https://github.com/ghost1372), available from the [WelcomeHubActivator Releases page](https://github.com/ghost1372/WelcomeHubActivator/releases). WelcomeHubActivator enables the Hub; this project adds custom-widget support on top of it.








A huge thank you to [@geodox](https://github.com/geodox) for the excellent original [PS5 Welcome Hub Widgets project](https://github.com/geodox/ps5-wh-widgets), its bridge and SDK, and for making this community work possible. This fork builds on that foundation.








## How this fork differs

A note from the maintainer: I’m new to GitHub and forking projects, and no ill intent was intended by anything here. If anything was done incorrectly or raises a concern, please let me know and I’ll make it right.








This community-maintained fork is developed separately from geodox's upstream project. It retains the original widget framework and adds static-bridge compatibility work plus bridge-backed Options-menu actions, including ZIP management for Weather. Firmware support is tracked for each bridge build; this is not an official upstream release.


Corrections and suggestions are welcome. If anything is inaccurate or could be improved, please open an issue; the project details and documentation can be updated.








The fork is preparing to include **Calculator**, **Tetris**, **Weather**, and **Widget Store** widgets. Calculator is a D-pad-controlled four-function calculator; Tetris is a falling-block puzzle; Weather shows current conditions and a five-day forecast with saved ZIP codes; Widget Store browses the community widget catalog.








![Calculator, Tetris, Weather and Widget Store running in the PS5 Welcome Hub](img/welcomehub-showcase-20261113.jpg)

![Welcome Hub with Weather, Widget Store, Tetris, and Calculator (WebP image)](img/20261113_104112_00611670.webp)








## Welcome Hub
















The Welcome Hub is a customizable panel on the PS5 home screen, added in a 2024 system software update. It shows a grid of widgets — battery, trophies, storage, friends, recently played and more — that the user can rearrange, resize and toggle from an "Edit Widgets" screen. Sony ships a fixed set of widgets; this project lets you add your own alongside them.
















## Widgets
















The Welcome Hub is built with **React Native**, so a widget is just a **React view** — a component built from native primitives like `View`, `Text` and `Image`, not HTML/CSS. There is no DOM, no `div`, no `window`.
