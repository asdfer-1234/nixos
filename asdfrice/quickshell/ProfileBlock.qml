import Quickshell
import "system"
import "components"
import QtQuick.Layouts

ColumnLayout {
    Layout.fillWidth: false
    Layout.fillHeight: true
    spacing: 0
    RowLayout {
        spacing: 0
        StyledText {
            text: Profile.user + "@" + Profile.hostname
        }
        BatteryStatus {
            Layout.fillHeight: false
        }
    }

    ColumnSeparator {}
    StyledText {
        text: Clock.time
    }
}
