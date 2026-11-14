#!/usr/bin/env bash
# Build the NiDUS Welcome Hub payload from the current static-bridge sources.
# Run from the repository root under Linux/WSL:
#   bash framework/build.sh Builds/nidus-release/<new-run-id>
# The output path must be new and under Builds/. No source-tree output is used.
set -euo pipefail

ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
REL_OUT="${1:?Usage: bash framework/build.sh Builds/nidus-release/<new-run-id>}"
case "$REL_OUT" in
  Builds/*) ;;
  *) echo "ERROR: output must be a new path under Builds/" >&2; exit 2 ;;
esac
case "/$REL_OUT/" in
  */../*|*//* ) echo "ERROR: output path may not contain traversal or empty components" >&2; exit 2 ;;
esac
OUT="$ROOT/$REL_OUT"
if [ -e "$OUT" ]; then
  echo "ERROR: output already exists: $OUT" >&2
  exit 2
fi

SDK="${PS5_PAYLOAD_SDK:-$HOME/ps5-payload-sdk}"
CC="$SDK/bin/prospero-clang"
[ -x "$CC" ] || { echo "ERROR: payload compiler not found: $CC" >&2; exit 1; }
for f in framework/installer.c framework/wh_detour.h framework/wh_sigs.h \
         framework/bridge_hbc.S framework/bridge579.hbc \
         framework/bundled_store.S framework/bundled-widget-store/config.json \
         framework/bundled-widget-store/widget.js framework/bundled-widget-store/glyph.png \
         framework/bundled-widget-store/store-smoke-icon.png \
         framework/bundled-widget-store/store-smoke-two-icon.png; do
  [ -f "$ROOT/$f" ] || { echo "ERROR: required build input missing: $f" >&2; exit 1; }
done

mkdir -p "$OUT"
LOG="$OUT/build.log"
(
  cd "$ROOT"
  echo "Compiler: $CC"
  "$CC" -Wall -g -o "$OUT/wh_bridge.elf" \
    framework/installer.c framework/bridge_hbc.S framework/bundled_store.S
  test -s "$OUT/wh_bridge.elf"
  sha256sum "$OUT/wh_bridge.elf" > "$OUT/SHA256SUMS"
  echo "Built $OUT/wh_bridge.elf ($(stat -c %s "$OUT/wh_bridge.elf") bytes)"
) 2>&1 | tee "$LOG"

