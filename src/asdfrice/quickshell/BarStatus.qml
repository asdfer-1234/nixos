import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import "components"

Item {
    id: root
    property string label: "label"
    property string text: "text"
    property string icon: "placeholder24.svg"
    Rectangle {
        anchors.fill: parent
        color: Style.lightbg1
        border.color: Style.lightfg
    }
    implicitHeight: layout.height
    implicitWidth: layout.width

    RowLayout {
        id: layout
        spacing: 0
        IconSquare {
            source: "../icons/" + root.icon
            bg: Style.blue
            fg: Style.lightfg
        }

        StyledText {
            Layout.leftMargin: 8
            Layout.rightMargin: 8
            text: root.text
            font.bold: true
            font.pointSize: 10
            color: Style.lightfg
        }
    }
}
