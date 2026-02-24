import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import "components"
import "system"

PanelWindow {
    required property ShellScreen modelData
    screen: modelData
    anchors {
        top: true
        left: true
        right: true
    }
    color: "transparent"

    implicitHeight: 80
    implicitWidth: 1500

    RowLayout {
        spacing: 0
        ProfileBlock {
            Layout.alignment: Qt.AlignTop
            implicitHeight: 70
        }
        BarBlock {
            Layout.alignment: Qt.AlignTop
        }
    }
}
