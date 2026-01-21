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

            implicitHeight: 40
            ColumnLayout {
                anchors.fill: parent
                spacing: 0

                Rectangle {
                    Layout.fillWidth: true
                    implicitHeight: 10
                    color: '#bbbbbb'
                }

                ColumnSeparator {}

                WrapperRectangle {
                    Layout.fillHeight: true
                    Layout.fillWidth: true

                    color: "#aaaaaa"

                    RowLayout {
                        spacing: 0
                        anchors.fill: parent

                        RowSeparator {}
                        StatusText {
                            text: System.time
                        }
                        RowSeparator {}

                        StatusText {
                            Layout.fillWidth: true
                            text: {
                                [...Niri.windows].filter(w => w.layout.pos_in_scrolling_layout).sort((lhs, rhs) => lhs.layout.pos_in_scrolling_layout[0] - rhs.layout.pos_in_scrolling_layout[0]).map(w => w.title).join("      ");
                            }
                        }

                        RowSeparator {}
                        RowLayout {
                            StatusText {
                                text: System.batteryPercentage
                            }
                            StatusText {
                                text: System.charging
                            }
                        }
                        RowSeparator {}
                    }
                }

                ColumnSeparator {}
            }
        }
    }
}
