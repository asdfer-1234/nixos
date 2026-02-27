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
        RowLayout {
            StyledText {
                text: Profile.user + "@" + Profile.hostname
            }
            StyledText {
                text: "Stop overthinking!"
            }
        }
        RowLayout {
            StyledText {
                text: Clock.time
            }
            BarStatus {
                label: "Battery"
                icon: "placeholder16.svg"
                text: `${Util.formatKj(Battery.energy)} / ${Util.formatKj(Battery.energyCapacity)} kJ`
            }
        }
    }
}
