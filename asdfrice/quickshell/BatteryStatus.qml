import QtQuick
import QtQuick.Layouts
import "components"
import "system"
import Quickshell.Widgets

RowLayout {
    spacing: 0
    Item {
        implicitWidth: icon.implicitWidth
        implicitHeight: icon.implicitHeight
        WrapperRectangle {
            id: square
            anchors.fill: parent
            color: "#ddbb00"
        }
        ColorImage {
            id: icon
            source: "icons/charging.svg"
            color: "black"
        }

        StyledText {
            anchors.right: parent.right
            anchors.baseline: parent.bottom
            text: Math.round(Battery.batteryPercentage * 100)
            color: "#eeeeee"
            font.bold: true
            font.pointSize: 14
            style: Text.Outline
            styleColor: "#444444"
        }
    }

    RowSeparator {}
    StatusBlock {

        Layout.fillWidth: false

        StyledText {
            text: "Battery"
        }
    }
}
