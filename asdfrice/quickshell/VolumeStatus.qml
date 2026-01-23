import Quickshell.Services.Pipewire
import "components"
import "system"
import QtQuick.Layouts
import Quickshell.Widgets

RowLayout {
    spacing: 0
    ColorImage {
        source: "icons/volume.svg"
        color: Style.textColor
    }
    RowSeparator {}

    StatusBlock {
        RowLayout {
            StyledText {
                text: Math.round(Volume.volume * 100) + "%"
            }
            StyledText {
                text: Volume.muted ? "Muted" : "Unmuted"
            }
        }
    }
}
