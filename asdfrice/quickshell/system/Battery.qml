pragma Singleton
import Quickshell
import Quickshell.Io
import QtQuick
import Quickshell.Services.UPower

Singleton {
    readonly property real batteryPercentage: UPower.displayDevice.percentage
    readonly property bool charging: !UPower.onBattery
}
