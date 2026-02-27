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
    property bool strikeout: false
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
            Layout.leftMargin: Style.textMargin
            Layout.rightMargin: Style.textMargin
            text: root.text
            font.bold: true
            font.pointSize: 10
            color: Style.lightfg
            font.strikeout: root.strikeout
        }
    }
}
