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
            // Outliner {
            //     modelData: scope.modelData
            // }
            SideStrut {
                modelData: scope.modelData
                isRight: false
            }
            SideStrut {
                modelData: scope.modelData
                isRight: true
            }
        }
    }
}
