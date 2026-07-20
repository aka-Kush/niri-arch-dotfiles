pragma Singleton

import QtQuick

QtObject {
    // Generated with Iris.
    readonly property color base00: "{bg}"
    readonly property color base01: "{surface}"
    readonly property color base02: "{surface}"
    readonly property color base03: "{surface}"
    readonly property color base04: "{dim}"
    readonly property color base05: "{dim}"
    readonly property color base06: "{fg}"
    readonly property color base07: "{fg}"
    readonly property color base08: "{red}"
    readonly property color base09: "{yellow}"
    readonly property color base0A: "{yellow}"
    readonly property color base0B: "{green}"
    readonly property color base0C: "{color6}"
    readonly property color base0D: "{accent}"
    readonly property color base0E: "{color5}"
    readonly property color base0F: "{red}"

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
