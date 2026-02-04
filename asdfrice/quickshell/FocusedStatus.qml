import Quickshell
import QtQuick
import QtQuick.Layouts
import "system"
import "components"

StackLayout {
    id: root
    property var focusedWindow: {
        Niri.windows.find(x => x.is_focused);
    }
    function appId() {
        if (!focusedWindow) {
            return "Niri";
        }
        const appid = focusedWindow.app_id;
        if (appid == "dev.zed.Zed") {
            return "Zed";
        } else if (appid == "firefox") {
            return "Firefox";
        } else {
            return appid;
        }
    }
    function title() {
        if (!focusedWindow) {
            return "";
        }
        const appid = focusedWindow.app_id;

        const title = focusedWindow.title;
        if (appid == "firefox") {
            return title.slice(0, -18);
        }
        return title;
    }
    currentIndex: focusedWindow ? 1 : 0

    StyledText {
        text: "Niri"
        font.bold: true
    }
    RowLayout {

        spacing: 40

        StyledText {
            text: root.appId()

            font.bold: true
        }
        StyledText {
            Layout.fillWidth: true
            text: root.title()
            font.italic: true
        }
        StyledText {
            text: "close"
        }
        StyledText {
            text: root.focusedWindow?.is_floating ? "Floating" : "Not floating"
        }
        StyledText {
            text: {
                "fullscreen?";
            }
        }
        StyledText {
            text: "track on outliner"
        }
    }
}
