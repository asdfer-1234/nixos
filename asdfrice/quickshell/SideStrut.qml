import Quickshell
import Quickshell.Widgets
import Quickshell.Io
import QtQuick
import QtQuick.Layouts
import "components"
import "system"

PanelWindow {
    id: root
    property bool isRight

    anchors.top: true
    anchors.bottom: true
    anchors.left: !isRight
    anchors.right: isRight
    color: "transparent"

    implicitWidth: 80

    WrapperRectangle {
        anchors.fill: parent
        gradient: Gradient {
            orientation: Gradient.Horizontal
            GradientStop {
                position: root.isRight ? 0.0 : 1.0
                color: "transparent"
            }

            GradientStop {
                position: root.isRight ? 1.0 : 0.0
                color: "#77000000"
            }
        }
        WrapperMouseArea {
            anchors.fill: parent
            ColumnLayout {
                StyledText {
                    Layout.alignment: Qt.AlignHCenter
                    text: root.isRight ? "->" : "<-"
                    font.pointSize: 20
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                }
                StyledText {

                    text: Niri.appId(isRight ? Niri.rightColumn[0] : Niri.leftColumn[0])
                }
            }

            onClicked: () => {
                process.running = true;
            }
        }
        Process {
            id: process
            command: ["niri", "msg", "action", root.isRight ? "focus-column-right" : "focus-column-left"]
        }
    }
}
