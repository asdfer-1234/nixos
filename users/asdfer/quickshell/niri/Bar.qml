import Quickshell
import Quickshell.Widgets
import QtQuick
import QtQuick.Layouts

Scope {
    id: root
    Variants {
        model: Quickshell.screens
        PanelWindow {
            required property var modelData
            // color: "transparent"

            screen: modelData
            anchors {
                top: true
                left: true
                right: true
            }
            margins {
                top: 10
                left: 10
                right: 10
            }

            implicitHeight: 50

            RowLayout {
                anchors.centerIn: parent
                WrapperRectangle {
                    margin: 10
                    radius: 1000
                    border {
                        color: "black"
                        width: 2
                    }
                    Text {
                        text: System.time
                    }
                }
                WrapperRectangle {
                    margin: 10
                    radius: 1000
                    border {
                        color: "black"
                        width: 2
                    }
                    RowLayout {
                        Text {
                            text: {
                                [...Niri.windows].sort((lhs, rhs) => lhs.layout.pos_in_scrolling_layout[0] - rhs.layout.pos_in_scrolling_layout[0]).map(w => w.title).join("      ")
                            }
                        }
                    }
                }
                WrapperRectangle {
                    margin: 10
                    radius: 1000
                    border {
                        color: "black"
                        width: 2
                    }
                    RowLayout {
                        Text {
                            text: System.batteryPercentage
                        }
                        Text {
                            text: System.charging
                        }
                    }
                }
            }
        }
    }
}
