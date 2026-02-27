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
        ProfileLine {
            Layout.alignment: Qt.AlignTop
            implicitHeight: 70
        }
        BarLine {
            Layout.alignment: Qt.AlignTop
        }
    }
}
