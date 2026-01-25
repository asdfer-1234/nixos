import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import "components"

RowLayout {
    id: root
    property string label: "label"
    property string text: "text"

    StyledWrapper {

        RowLayout {
            StyledText {
                text: root.label
                font.bold: true
            }
            StyledText {
                text: root.text
                font.italic: true
            }
        }
    }
}
