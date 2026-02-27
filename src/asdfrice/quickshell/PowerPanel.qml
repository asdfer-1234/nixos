import Quickshell
import QtQuick.Layouts

PanelWindow {
    required property ShellScreen modelData
    anchors {
        top: true
        left: true
    }
    exclusionMode: ExclusionMode.Normal
    StackLayout {
        anchors.fill: parent
        StyledWrapper {
            ColumnLayout {
                Title {
                    text: "Power"
                }
                RowLayout {
                    spacing: -1
                    IconSquare {}
                    IconSquare {}
                    IconSquare {}
                    IconSquare {}
                }
            }
        }
    }
    component Title: StyledText {
        font.pointSize: 20
        font.bold: true
    }
}
