import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import "system"

FitWrapper {
    leftMargin: Style.textMargin
    rightMargin: Style.textMargin
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
                WrapperMouseArea {
                    IconSquare {
                        icon: "window_close"
                    }
                    onClicked: mouse => {
                        if (mouse.button == Qt.LeftButton) {
                            Niri.closeFocusedWindow.running = true;
                        }
                    }
                }

                WrapperMouseArea {
                    IconSquare {
                        icon: Niri.focusedWindow?.is_floating ? "floating" : "tiling"
                    }
                    onClicked: mouse => {
                        if (mouse.button == Qt.LeftButton) {
                            Niri.closeCurrentWindow.running = true;
                        }
                    }
                }
                IconSquare {}
                IconSquare {}
            }
        }
    }
}
