pragma Singleton
import Quickshell
import Quickshell.Io
import QtQuick
import Quickshell.Services.UPower

Singleton {
    readonly property string time: {
        Qt.formatDateTime(clock.date, "M/d ddd HH:mm:ss");
    }

    SystemClock {
        id: clock
        precision: SystemClock.Seconds
    }
}
