import QtQuick
import QtQuick.Layouts
import "components"
import "system"

RowLayout {
    spacing: 0
    ColorImage {
        source: "icons/charging.svg"
        color: Style.textColor
    }
    RowSeparator {}
    StatusBlock {
        RowLayout {

            Layout.fillWidth: false

            StyledText {
                text: Math.round(Battery.batteryPercentage * 100) + "%"
            }
            StyledText {
                text: Battery.charging ? "Charging" : "Discharging"
            }
        }
    }
}
