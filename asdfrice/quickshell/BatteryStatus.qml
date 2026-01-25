import QtQuick
import QtQuick.Layouts
import "components"
import "system"
import Quickshell.Widgets

RowLayout {
    Layout.fillWidth: false
    spacing: 0

    ColorImage {
        id: icon
        source: "icons/charging.svg"
        color: Style.textColor
    }

    RowSeparator {}

    ColumnLayout {
        spacing: 0

        StyledText {
            text: "Battery"
            Layout.fillHeight: true
        }
        ColumnSeparator {}
        StatusBar {
            fill: Battery.batteryPercentage
        }
    }
}
