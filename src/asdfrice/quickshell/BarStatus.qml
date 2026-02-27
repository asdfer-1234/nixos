import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import "components"

StyledWrapper {
    id: root
    property string label: "label"
    property string text: "text"
    color: Style.lightbg1
    border.color: Style.lightborder1
    margin: 0
    RowLayout {
        spacing: 0
        IconSquare {}
        RowSeparator {}
        StyledText {
            Layout.leftMargin: 8
            Layout.rightMargin: 8
            text: root.text
            font.bold: true
            color: Style.lightfg
        }
    }
}
