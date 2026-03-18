import Quickshell
import QtQuick.Layouts
import QtQuick

Item {
    id: root
    default property list<Item> children
    implicitWidth: row.width + 14
    implicitHeight: row.height

    Rectangle {
        anchors.fill: parent
        color: "#ebdbb2"
        border.width: 1
        border.color: Style.lightfg
        ColorImage {
            anchors.fill: parent
            anchors.margins: 1
            source: "patterns/firmstripes.png"
            color: "#928374"
            fillMode: Image.Tile
        }
    }

    RowLayout {
        id: row
        anchors.centerIn: parent
        spacing: 10
        children: root.children
    }
}
