import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import "components"
import "system"
import QtApplicationManager

PanelWindow {
    required property ShellScreen modelData
    screen: modelData
    anchors {
        top: true
        left: true
        right: true
    }
    color: "transparent"

    implicitHeight: 67
    implicitWidth: 1500

    StyledWrapper {
        anchors.left: parent.left
        anchors.top: parent.top
        Layout.fillWidth: true

        RowLayout {
            spacing: 20

            ProfileBlock {}

            ColumnLayout {
                RowLayout {
                    spacing: 20
                    StatusBlock {
                        BarStatus {
                            label: "Mouse"
                            text: "mouse"
                        }
                        BarStatus {
                            label: "Keyboard"
                            text: "keyboard"
                        }
                    }
                    Arrow {}
                    StatusBlock {
                        BarStatus {
                            label: "CPU"
                            text: "cpu"
                        }
                        BarStatus {
                            label: "GPU"
                            text: "gpu"
                        }
                        BarStatus {
                            label: "RAM"
                            text: "ram"
                        }
                        BarStatus {
                            label: "Swap"
                            text: "swap"
                        }
                        BarStatus {
                            label: "Disk"
                            text: "disk"
                        }
                    }
                    Arrow {}
                    StatusBlock {
                        BarStatus {
                            label: "Brightness"
                            text: Util.formatPercentage(Backlight.brightnessPercentage)
                        }
                        WrapperMouseArea {
                            onWheel: event => {
                                Volume.sink.audio.volume = Math.min(Volume.volume + (event.angleDelta.y) / 120 / 100, 1);
                            }

                            onPressed: event => {
                                Volume.sink.audio.muted = !Volume.muted;
                            }

                            BarStatus {
                                label: "Volume"
                                text: Util.formatPercentage(Volume.volume) + " " + (Volume.muted ? "Muted" : "Unmuted")
                            }
                        }
                    }

                    StatusBlock {
                        BarStatus {
                            label: "Bluetooth"
                            text: "bluetooth"
                        }
                        BarStatus {
                            label: "Wifi"
                            text: "wifi"
                        }
                        BarStatus {
                            label: "Airplane mode"
                            text: "airplane"
                        }
                    }
                    StatusBlock {
                        BarStatus {
                            label: "Currently playing"
                            text: "media"
                        }
                    }
                }
                RowLayout {
                    spacing: 20
                    FocusedStatus {
                        Layout.fillWidth: true
                    }
                    StyledText {
                        text: "close"
                    }
                    StyledText {
                        text: "floating?"
                    }
                    StyledText {
                        text: "fullscreen?"
                    }
                    StyledText {
                        text: "track on outliner"
                    }
                }
            }
        }
    }
    component Arrow: StyledText {
        text: "->"
    }
    component StatusBlock: StyledWrapper {
        id: root
        default property list<Item> children

        RowLayout {
            spacing: 10
            children: root.children
        }
    }
}
