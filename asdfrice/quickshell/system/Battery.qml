pragma Singleton
import Quickshell
import Quickshell.Io
import QtQuick
import Quickshell.Services.UPower

Singleton {
    readonly property real batteryPercentage: UPower.displayDevice.percentage
    // We're doing it in joules, not the chaotic Wh!
    readonly property real energy: UPower.displayDevice.energy * 60 * 60
    readonly property real energyCapacity: UPower.displayDevice.energy * 60 * 60
    readonly property bool charging: !UPower.onBattery
}
