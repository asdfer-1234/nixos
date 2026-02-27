import Quickshell.Widgets
import QtQuick

Item {
    id: root
    property color bg: "#ffffff"
    property color fg: "#000000"
    property url source: "../icons/placeholder.svg"
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
        source: root.source
    }
}
