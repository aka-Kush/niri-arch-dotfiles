pragma Singleton

import QtQuick

QtObject {
    // Generated with Matugen.
    readonly property color base00: "{{ colors.surface.default.hex }}"
    readonly property color base01: "{{ colors.surface_container_low.default.hex }}"
    readonly property color base02: "{{ colors.surface_container.default.hex }}"
    readonly property color base03: "{{ colors.surface_container_high.default.hex }}"
    readonly property color base04: "{{ colors.outline.default.hex }}"
    readonly property color base05: "{{ colors.on_surface_variant.default.hex }}"
    readonly property color base06: "{{ colors.on_surface.default.hex }}"
    readonly property color base07: "{{ colors.on_surface.default.hex }}"
    readonly property color base08: "{{ colors.error.default.hex }}"
    readonly property color base09: "{{ colors.tertiary.default.hex }}"
    readonly property color base0A: "{{ colors.secondary.default.hex }}"
    readonly property color base0B: "{{ colors.primary.default.hex }}"
    readonly property color base0C: "{{ colors.secondary_fixed_dim.default.hex }}"
    readonly property color base0D: "{{ colors.primary.default.hex }}"
    readonly property color base0E: "{{ colors.tertiary.default.hex }}"
    readonly property color base0F: "{{ colors.error_container.default.hex }}"

    readonly property color bg: base00
    readonly property color bgAlt: base01
    readonly property color surface: base02
    readonly property color surfaceAlt: base03
    readonly property color border: base03
    readonly property color text: base06
    readonly property color textStrong: base07
    readonly property color textMuted: base05
    readonly property color muted: base04
    readonly property color accent: base0D
    readonly property color accentAlt: base0C
    readonly property color warning: base0A
    readonly property color danger: base08

    readonly property string textFontFamily: "Inter"
    readonly property string iconFontFamily: "JetBrainsMono Nerd Font"

    function alpha(colorValue, opacity) {
        const text = String(colorValue);
        const hex = text[0] === "#" ? text.slice(1) : text;
        return "#" + opacity + hex;
    }
}
