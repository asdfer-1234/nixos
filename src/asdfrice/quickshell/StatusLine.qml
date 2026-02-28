import QtQuick
import QtQuick.Layouts
import Quickshell
import Quickshell.Widgets
import "system"

FitWrapper {
    leftMargin: 12
    rightMargin: 50
    ColumnLayout {
        spacing: -1
        RowLayout {
            spacing: 15
            StripeRow {
                RowLayout {
                    spacing: -1
                    IconSquare {}
                    IconSquare {}
                }

                Arrow {}
                Status {
                    icon: "system.svg"
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
                Status {
                    icon: "system.svg"
                    label: "GPU"
                    text: Qsrs.nvidia_gpu ? `${Util.formatGib(Qsrs.nvidia_gpu[0].memory.used)} / ${Util.formatGib(Qsrs.nvidia_gpu[0].memory.reserved)} / ${Util.formatGib(Qsrs.nvidia_gpu[0].memory.total)} GiB` : "none"
                }
                Status {
                    icon: "system.svg"
                    label: "RAM"
                    text: Qsrs.ram ? `${Util.formatGib(Qsrs.ram.used)} / ${Util.formatGib(Qsrs.ram.total)} GiB` : null
                }
                Status {
                    icon: "system.svg"
                    label: "Swap"
                    text: Qsrs.swap ? `${Util.formatGib(Qsrs.swap.used)} / ${Util.formatGib(Qsrs.swap.total)} GiB` : null
                }
                Arrow {}
                Status {
                    icon: "brightness.svg"
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

                    Status {
                        label: "Volume"
                        icon: Volume.muted ? "volume_mute.svg" : "volume.svg"
                        text: Util.formatPercentage(Volume.volume)
                        strikeout: Volume.muted
                    }
                }
            }

            StripeRow {
                Status {
                    label: "Bluetooth"
                    text: "bluetooth"
                }
                Status {
                    label: "Wifi"
                    text: "wifi"
                }
                Status {
                    label: "Airplane mode"
                    text: "airplane"
                }
            }

            Status {
                label: "Currently playing"
                text: "mpris"
            }
            Status {
                icon: "system.svg"
                label: "Disk"
                text: "disk"
            }
        }
    }
    component Arrow: ColorImage {
        source: "icons/right_arrow.svg"
        color: "yellow"
    }
}
