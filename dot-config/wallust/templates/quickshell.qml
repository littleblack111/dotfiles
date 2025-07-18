pragma Singleton

import Quickshell
import QtQuick

Singleton {
    property color foreground: "{{foreground}}"
    property color background: "{{background}}"
    property color cursor: "{{cursor}}"
    property color color0: "{{color0}}"
    property color color1: "{{color1}}"
    property color color2: "{{color2}}"
	property color color3: Qt.rgba({{color3 | red}}/255, {{color3 | green}}/255, {{color3 | blue}}/255, 0.15)
	property color color4: Qt.rgba({{color4 | red}}/255, {{color4 | green}}/255, {{color4 | blue}}/255, 0.15)
    property color color5: "{{color5}}"
    property color color6: "{{color6}}"
    property color color7: "{{color7}}"
    property color color8: "{{color8}}"
    property color color9: "{{color9}}"
    property color color10: "{{color10}}"
    property color color11: "{{color11}}"
    property color color12: "{{color12}}"
    property color color13: "{{color13}}"
    property color color14: "{{color14}}"
    property color color15: "{{color15}}"
}
