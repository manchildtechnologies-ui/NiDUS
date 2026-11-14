.section .rodata
.align 16
.global ws_config_start
.global ws_config_end
.global ws_widget_start
.global ws_widget_end
.global ws_glyph_start
.global ws_glyph_end
.global ws_smoke1_start
.global ws_smoke1_end
.global ws_smoke2_start
.global ws_smoke2_end
ws_config_start:
.incbin "framework/bundled-widget-store/config.json"
ws_config_end:
ws_widget_start:
.incbin "framework/bundled-widget-store/widget.js"
ws_widget_end:
ws_glyph_start:
.incbin "framework/bundled-widget-store/glyph.png"
ws_glyph_end:
ws_smoke1_start:
.incbin "framework/bundled-widget-store/store-smoke-icon.png"
ws_smoke1_end:
ws_smoke2_start:
.incbin "framework/bundled-widget-store/store-smoke-two-icon.png"
ws_smoke2_end:

