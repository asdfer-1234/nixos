import QtQuick
import QtQuick.Layouts

Item {
    id: root
    property real fill
    implicitHeight: 8
    Layout.fillWidth: true
    Rectangle {
        anchors.fill: parent
        color: "#f8cecc"
    }

    Rectangle {
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        implicitWidth: parent.width * 0.5
        color: "#bfd0be"
        RowSeparator {
            anchors.right: parent.right
        }
    }
}
