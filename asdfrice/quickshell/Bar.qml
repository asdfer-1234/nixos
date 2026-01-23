import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts
import "components"
import "system"

Scope {
    id: root
    Variants {
        model: Quickshell.screens
        PanelWindow {
            required property var modelData

            screen: modelData
            anchors {
                top: true
                left: true
                right: true
            }
            margins.top: 10

            implicitHeight: 34

            ColumnLayout {

                anchors.left: parent.left
                anchors.right: parent.right
                spacing: 0

                ColumnSeparator {}

                WrapperRectangle {
                    Layout.fillWidth: true
                    Layout.preferredHeight: 32

                    color: Style.background

                    RowLayout {
                        spacing: 0
                        anchors.fill: parent
                        anchors.leftMargin: 5
                        anchors.rightMargin: 5

                        RowSeparator {}
                        StatusBlock {
                            StyledText {
                                text: Clock.time
                            }
                        }
                        RowSeparator {}

                        FocusedStatus {}
                        RowSeparator {}
                        ColorImage {
                            Layout.fillHeight: true
                            Layout.preferredWidth: 5
                            source: "patterns/firmstripes.png"
                            fillMode: Image.Tile
                            color: Style.separatorColor
                        }
                        RowSeparator {}
                        BatteryStatus {}
                        RowSeparator {}
                        ColorImage {
                            Layout.fillHeight: true
                            Layout.preferredWidth: 5
                            source: "patterns/firmstripes.png"
                            fillMode: Image.Tile
                            color: Style.separatorColor
                        }
                        RowSeparator {}
                        VolumeStatus {}
                        RowSeparator {}
                    }
                }

                ColumnSeparator {}
            }
        }
    }
}
