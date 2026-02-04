import Quickshell
import Quickshell.Widgets
import Quickshell.Io
import QtQuick
import "components"

PanelWindow {
    id: root
    property string text
    property list<string> command

    anchors.top: true
    anchors.bottom: true
    color: "#44000000"

    implicitWidth: 64

    WrapperMouseArea {
        anchors.fill: parent
        StyledText {
            anchors.fill: parent
            text: root.text
            font.pointSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
        onClicked: () => {
            process.running = true;
        }
    }
    Process {
        id: process
        command: root.command
    }
}
