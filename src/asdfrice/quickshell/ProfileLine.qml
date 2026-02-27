import Quickshell
import Quickshell.Widgets
import "system"
import QtQuick.Layouts

StyledWrapper {
    ColumnLayout {
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
            PanelMouseArea {
                panel: "power"
                Status {
                    label: "Power"
                    icon: "power.svg"
                    text: `${Util.formatKj(Power.energy)} / ${Util.formatKj(Power.energyCapacity)} kJ`
                }
            }
        }
    }
}
