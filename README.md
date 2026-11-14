# NiDUS

**Custom widgets for the PlayStation 5 Welcome Hub**

NiDUS is a community-developed extension of the [PS5 Welcome Hub Widgets](https://github.com/geodox/ps5-wh-widgets) project by **[@geodox](https://github.com/geodox)**. It builds upon his original bridge, framework, and SDK, bringing additional widgets and compatibility work to the PS5 Welcome Hub.

![NiDUS widget showcase — PS5 Welcome Hub](img/welcomehub-showcase-20261113.jpg)

> **Built on geodox's work.** A special thank-you to [@geodox](https://github.com/geodox) for creating and sharing the [original PS5 Welcome Hub Widgets project](https://github.com/geodox/ps5-wh-widgets), and for being welcoming and helpful to fellow developers. His foundation made this possible. NiDUS is an independent community fork, not an official upstream release.

## What is NiDUS?

NiDUS adds community-created React Native widgets alongside the PS5's native Welcome Hub widgets. The underlying framework injects a widget loader into the Hub, while a bridge exposes supported native-backed functionality. This repository includes the framework source, example widgets, development tools, and SDK documentation.

The existing project documentation covers these additional widgets and features:

| Widget | Description |
| --- | --- |
| **Widget Store** | Browse the community widget catalog |
| **Weather** | Current conditions, a five-day forecast, and saved ZIP codes |
| **Calculator** | A four-function calculator controlled with the D-pad |
| **Tetris** | A falling-block puzzle game |
| **Hello Hub** | Minimal SDK example with a live clock |
| **Payload Monitor** | View running homebrew payloads with process and memory information |

The README previously described bridge compatibility work, native Options-menu actions, and Weather ZIP management. Firmware and bridge-build compatibility must be checked per release; do not assume a feature is supported on every firmware.

## Screenshots

![Widget Store, Tetris and Calculator](img/20261113_110150_00429265.webp)

![Weather, Widget Store, Tetris and Calculator](img/20261113_110144_00592274.webp)

## Before installing

- A PS5 with a compatible homebrew environment and a working method to load the supported bridge payload is required.
- The Welcome Hub must already be active. If needed, see [WelcomeHubActivator](https://github.com/ghost1372/WelcomeHubActivator) by **[@ghost1372](https://github.com/ghost1372)**.
- Follow instructions for the **specific build and firmware** you intend to use. No NiDUS-branded release assets are currently published in this repository.
- Avoid mixing experimental bridge builds or assuming upstream binaries include NiDUS-specific changes.

### Adding widgets

Once a compatible bridge is installed and running, place each unpacked widget in its own folder on the console:

```text
/data/wh-widgets/
  example-widget/
    config.json
    widget.js
    glyph.png       # optional
```

The folder name should match its widget id. Changes may require a fresh Welcome Hub runtime. See the [SDK getting-started guide](docs/sdk/getting-started.md) for deployment and troubleshooting.

## Build your own

NiDUS inherits a React Native-based widget SDK. Widgets use JavaScript with `React.createElement` and the SDK handle `globalThis.__wh` — **not** web HTML, CSS, or DOM APIs.

- [Widget SDK overview](docs/WIDGET_SDK.md)
- [Getting started](docs/sdk/getting-started.md)
- [API reference](docs/sdk/api.md)
- [Configuration](docs/sdk/config.md)
- [Controller input and focus](docs/sdk/input-and-focus.md)
- [Settings and persistence](docs/sdk/settings.md)
- [Troubleshooting](docs/sdk/troubleshooting.md)
- [Sample widgets](sample-widgets/)

A widget's entry file registers its component using `wh.register(Component)`. See the linked guides for verified examples, supported primitives, and the deployment workflow.

## Source layout

```text
framework/      PS5 bridge and widget loader source
docs/           Widget SDK and development documentation
sample-widgets/ Example widget projects
scripts/        Console and toolchain helper scripts
tools/          Build and packaging utilities
img/            Screenshots and documentation images
repo.json       Existing payload catalog metadata (upstream)
```

## Credits & origins

- **[@geodox](https://github.com/geodox)** — Original [PS5 Welcome Hub Widgets](https://github.com/geodox/ps5-wh-widgets) project, bridge, SDK, and underlying framework. **NiDUS builds directly upon this work.** Thank you for sharing it and for your kindness to the community.
- **[@ghost1372](https://github.com/ghost1372)** — [WelcomeHubActivator](https://github.com/ghost1372/WelcomeHubActivator), which enables the Welcome Hub where required.
- **NiDUS contributors** — Additional widgets, adaptation, packaging, compatibility work, and ongoing community development.

NiDUS is an independent, unofficial community homebrew project. It is not affiliated with or endorsed by Sony Interactive Entertainment, PlayStation, or the original upstream maintainer.

## License

See [LICENSE](LICENSE). The original MIT license and geodox's copyright notice are retained.
