pragma Singleton
import Quickshell
import Quickshell.Io
import QtQuick
import Quickshell.Services.UPower

Scope {
    id: root
    readonly property string time: {
        Qt.formatDateTime(clock.date, "ddd MMM d hh:mm:ss AP t yyyy");
    }

    readonly property real batteryPercentage: UPower.displayDevice.percentage
    readonly property bool charging: !UPower.onBattery

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
}
