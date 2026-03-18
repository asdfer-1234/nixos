import Quickshell.Widgets

WrapperMouseArea {
    id: root
    required property string panel
    onClicked: () => {
        screenRoot.panel = screenRoot.panel == panel ? null : panel;
    }
}
