pragma Singleton
import Quickshell
import Quickshell.Io
import QtQuick
import Quickshell.Services.UPower

Singleton {
    readonly property real batteryPercentage: UPower.displayDevice.percentage
    // We're doing it in joules, not the chaotic Wh!
    readonly property real energy: UPower.displayDevice.energy * 60 * 60
    readonly property real energyCapacity: UPower.displayDevice.energyCapacity * 60 * 60
    readonly property bool charging: !UPower.onBattery

    readonly property Process poweroff: Process {
        command: ["systemctl", "poweroff"]
    }
    readonly property Process restart: Process {
        command: ["systemctl", "restart"]
    }
    readonly property Process suspend: Process {
        command: ["systemctl", "suspend"]
    }
    readonly property Process hibernate: Process {
        command: ["systemctl", "hibernate"]
    }
}
