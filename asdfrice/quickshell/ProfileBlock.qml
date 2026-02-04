import Quickshell
import Quickshell.Widgets
import "system"
import "components"
import QtQuick.Layouts

StyledWrapper {

    ColumnLayout {
        Layout.fillWidth: false
        Layout.fillHeight: true
        spacing: 0
        StyledText {
            text: Profile.user + "@" + Profile.hostname
        }
        RowLayout {
            StyledText {
                text: Clock.time
            }
            BarStatus {
                label: "Battery"
                text: `${Util.formatKj(Battery.energy)} / ${Util.formatKj(Battery.energyCapacity)} kJ`
            }
        }
    }
}
