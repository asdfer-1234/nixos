import Quickshell
import QtQuick

ShellRoot {

    Variants {
        model: Quickshell.screens
        delegate: Scope {
            id: scope
            required property ShellScreen modelData
            Bar {
                modelData: scope.modelData
            }
            Outliner {
                modelData: scope.modelData
            }
            SideStrut {
                anchors.left: true
                text: "<-"
                command: ["niri", "msg", "action", "focus-column-left"]
            }
            SideStrut {
                anchors.right: true
                text: "->"
                command: ["niri", "msg", "action", "focus-column-right"]
            }
        }
    }
}
