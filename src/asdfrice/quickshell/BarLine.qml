import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import "components"
import "system"

StyledWrapper {
    margin: 4
    ColumnLayout {
        spacing: 8
        RowLayout {
            spacing: 15
            StatusBlock {
                BarStatus {
                    label: "Mouse"
                    text: "mouse"
                }
                BarStatus {
                    label: "Keyboard"
                    text: "keyboard"
                }
                Arrow {}
                BarStatus {
                    label: "CPU"
                    text: {
                        let length = Qsrs.cpu.length;
                        let low = 0;
                        let mid = 0;
                        let high = 0;
                        Qsrs.cpu.forEach(cpu => {
                            if (cpu.usage < 10) {
                                low++;
                            } else if (cpu.usage < 90) {
                                mid++;
                            } else {
                                high++;
                            }
                        });
                        `${low}/${mid}/${high} (${length})`;
                    }
                }
                BarStatus {
                    label: "GPU"
                    text: Qsrs.nvidia_gpu ? `${Util.formatGib(Qsrs.nvidia_gpu[0].memory.used)} / ${Util.formatGib(Qsrs.nvidia_gpu[0].memory.reserved)} / ${Util.formatGib(Qsrs.nvidia_gpu[0].memory.total)} GiB` : "none"
                }
                BarStatus {
                    label: "RAM"
                    text: Qsrs.ram ? `${Util.formatGib(Qsrs.ram.used)} / ${Util.formatGib(Qsrs.ram.total)} GiB` : null
                }
                BarStatus {
                    label: "Swap"
                    text: Qsrs.swap ? `${Util.formatGib(Qsrs.swap.used)} / ${Util.formatGib(Qsrs.swap.total)} GiB` : null
                }
                Arrow {}
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

            BarStatus {
                label: "Currently playing"
                text: "mpris"
            }
            BarStatus {
                label: "Disk"
                text: "disk"
            }
        }
        FocusedStatus {
            Layout.fillHeight: false
        }
    }
    component Arrow: ColorImage {
        source: "icons/right_arrow.svg"
        color: "yellow"
    }
    component StatusBlock: Item {
        id: root
        default property list<Item> children
        implicitWidth: row.width + 14
        implicitHeight: row.height

        Rectangle {
            anchors.fill: parent
            color: "#ebdbb2"
            border.width: 1
            border.color: Style.lightfg
        }

        ColorImage {
            anchors.fill: parent
            anchors.margins: 1
            source: "patterns/firmstripes.png"
            color: "#928374"
            fillMode: Image.Tile
        }

        RowLayout {
            id: row
            anchors.centerIn: parent
            spacing: 10
            children: root.children
        }
    }
}
