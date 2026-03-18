import Quickshell
import QtQuick.Layouts
import Quickshell.Widgets
import "system"

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
                    SquareButton {
                        action: () => {
                            Power.poweroff.running = true;
                        }
                    }
                    SquareButton {
                        action: () => {
                            Power.reboot.running = true;
                        }
                    }
                    SquareButton {
                        action: () => {
                            Power.suspend.running = true;
                        }
                    }
                    SquareButton {
                        action: () => {
                            Power.hibernate.running = true;
                        }
                    }
                }
            }
        }
    }
    component Title: StyledText {
        font.pointSize: 20
        font.bold: true
    }

    component SquareButton: WrapperMouseArea {
        id: root
        property var action
        IconSquare {}
        onClicked: mouse => {
            if (mouse.button == Qt.LeftButton) {
                console.log("aaaaa");
                root.action();
            }
        }
    }
}
