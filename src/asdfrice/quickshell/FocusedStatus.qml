import Quickshell
import QtQuick
import QtQuick.Layouts
import "system"
import "components"

StackLayout {
    id: root

    currentIndex: Niri.focusedWindow ? 1 : 0

    StyledText {
        text: "Niri"
        font.bold: true
    }

    RowLayout {
        Layout.fillHeight: false
        Layout.alignment: Qt.AlignCenter

        spacing: 10

        StyledText {
            text: Niri.appId(Niri.focusedWindow)

            font.bold: true
        }
        StyledText {
            Layout.fillWidth: true
            text: Niri.title(Niri.focusedWindow)
            font.italic: true
        }
        StyledText {
            text: "close"
        }
        StyledText {
            text: Niri.focusedWindow?.is_floating ? "Floating" : "Not floating"
        }
        StyledText {
            text: {
                "fullscreen?";
            }
        }
        StyledText {
            text: "track on outliner"
        }
    }
}
