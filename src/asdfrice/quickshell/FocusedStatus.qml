import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import "system"
import "components"

StackLayout {
    id: root

    currentIndex: Niri.focusedWindow ? 1 : 0

    StyledText {
        Layout.fillHeight: false
        text: "Niri"
        font.bold: true
    }

    RowLayout {
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
        RowLayout {
            spacing: -1
            IconSquare {
                source: "../icons/placeholder16.svg"
            }
            IconSquare {
                source: "../icons/placeholder16.svg"
            }
            IconSquare {
                source: "../icons/placeholder16.svg"
            }
            IconSquare {
                source: "../icons/placeholder16.svg"
            }
        }
    }
}
