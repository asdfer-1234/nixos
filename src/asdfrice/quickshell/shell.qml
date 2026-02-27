import Quickshell
import QtQuick

ShellRoot {
    id: shellRoot
    Variants {
        model: Quickshell.screens
        Scope {
            id: screenRoot
            required property ShellScreen modelData
            property var panel: null
            Bar {
                modelData: screenRoot.modelData
            }
            SideStrut {
                modelData: screenRoot.modelData
                isRight: false
            }
            SideStrut {
                modelData: screenRoot.modelData
                isRight: true
            }
            Outliner {
                modelData: screenRoot.modelData
            }
            PowerPanel {
                modelData: screenRoot.modelData
                visible: panel == "power"
            }
        }
    }
}
