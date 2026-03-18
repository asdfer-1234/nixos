import Quickshell
import QtQuick

PanelWindow {
    required property var modelData
    screen: modelData
    anchors {
        left: true
        bottom: true
        right: true
        top: true
    }
    exclusionMode: ExclusionMode.Ignore
    aboveWindows: false
    Rectangle {
        anchors.fill: parent
        color: Style.bg
        Line {
            anchors.top: parent.top
            anchors.topMargin: 56
        }
        Line {
            anchors.top: parent.top
            anchors.topMargin: 76
        }
        Line {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 12
        }
        Line {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 32
        }
        RowSeparator {
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.leftMargin: 5
        }
        RowSeparator {
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.leftMargin: 123
        }
        RowSeparator {
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            anchors.leftMargin: 600
        }
        RowSeparator {
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.rightMargin: 600
        }
        RowSeparator {
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.right: parent.right
            anchors.rightMargin: 5
        }
    }
    component Line: ColumnSeparator {
        anchors.left: parent.left
        anchors.right: parent.right
    }
}
