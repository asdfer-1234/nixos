import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
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
        spacing: -1
        ProfileLine {
            Layout.alignment: Qt.AlignTop
            implicitHeight: 70
        }
        ColumnLayout {
            spacing: -1
            Layout.alignment: Qt.AlignTop
            StatusLine {}
            FocusLine {
                Layout.fillWidth: false
                implicitWidth: 600
            }
        }
    }
}
