import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import "components"
import "system"

StyledWrapper {
    ColumnLayout {
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
            }
            Arrow {}
            StatusBlock {
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
        }
        RowLayout {
            spacing: 20
            FocusedStatus {
                Layout.fillWidth: true
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
