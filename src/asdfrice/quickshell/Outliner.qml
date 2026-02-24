import QtQuick
import Quickshell
import QtQuick.Layouts
import "components"

PanelWindow {
    required property ShellScreen modelData
    screen: modelData
    implicitWidth: 350
    color: "transparent"
    anchors {
        top: true
        right: true
        bottom: true
    }
    StyledWrapper {
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        ColumnLayout {
            StyledText {
                text: "Outliner"
                font.pointSize: 15

                font.bold: true
            }
            ColumnSeparator {}
            ColumnLayout {
                OutlinerItem {}
                OutlinerItem {}
                OutlinerItem {}
                OutlinerItem {}
                OutlinerItem {}
            }
        }
    }
    component OutlinerItem: StyledWrapper {
        id: root
        property string label: "Label"
        property string text: "text"
        Layout.fillWidth: true
        RowLayout {

            StyledText {
                text: root.label
                font.bold: true
            }
            StyledText {
                Layout.fillWidth: true
                text: root.text
                font.italic: true
            }
            StyledText {
                text: "remove from outliner"
                font.italic: true
            }
        }
    }
}
