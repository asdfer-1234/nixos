import Quickshell.Widgets
import QtQuick

Item {
    id: root
    property color bg: Style.blue
    property color fg: Style.lightfg
    property url icon: "placeholder24"
    implicitWidth: icon.width + 2
    implicitHeight: icon.height + 2

    Rectangle {
        anchors.fill: parent
        color: bg

        border.color: fg
        border.width: 1
    }
    ColorImage {
        id: icon
        anchors.centerIn: parent
        color: fg
        source: "icons/" + root.icon
    }
}
