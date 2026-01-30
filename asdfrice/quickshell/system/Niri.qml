pragma Singleton

import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root
    property string message
    property list<var> workspaces
    property list<var> windows
    property list<var> keyboardLayouts
    property list<var> outputs
    property bool overviewing
    property var casts
    property string screenshotPath
    Socket {
        id: niriSocket
        connected: true
        path: Quickshell.env("NIRI_SOCKET")
        parser: SplitParser {
            onRead: msg => {
                root.message = msg;
                const json = JSON.parse(msg);
                let e;
                if (json.Ok == "Handled") {
                    console.info("Niri socket connection successful");
                } else if ((e = json.WorkspacesChanged)) {
                    root.workspaces = e.workspaces;
                } else if ((e = json.WorkspaceUrgencyChanged)) {
                    root.workspaces.find(ws => ws.id == e.id).is_urgent = e.urgent;
                } else if ((e = json.WorkspaceActivated)) {
                    const workspace = root.workspaces.find(ws => ws.id == e.id);
                    root.workspaces.map(ws => {
                        if (ws.output == workspace.output) {
                            ws.is_active = false;
                        }
                        if (e.focused) {
                            ws.is_focused = false;
                        }
                    });
                    workspace.is_active = true;
                    if (e.focused) {
                        workspace.is_focused = true;
                    }
                } else if ((e = json.WorkspaceActiveWindowChanged)) {
                    const workspace = root.workspaces.find(ws => ws.id == e.workspace_id);
                    workspace.active_window_id = e.active_window_id;
                } else if ((e = json.WindowsChanged)) {
                    root.windows = e.windows;
                } else if ((e = json.WindowOpenedOrChanged)) {
                    const index = root.windows.findIndex(w => w.id == e.window.id);
                    if (index == -1) { // findIndex returns -1 if index was not found. Common js L
                        root.windows.push(e.window);
                    } else {
                        root.windows[index] = e.window;
                    }
                } else if ((e = json.WindowClosed)) {
                    root.windows.splice(root.windows.findIndex(w => w.id == e.id), 1);
                } else if ((e = json.WindowFocusChanged)) {
                    const focused = root.windows.find(x => x.is_focused);
                    if (focused) {
                        focused.is_focused = false;
                    }
                    if (e.id) {
                        root.windows.find(w => w.id == e.id).is_focused = true;
                    }
                } else if ((e = json.WindowFocusTimestampChanged)) {
                    root.windows.find(w => w.id == e.id).focus_timestamp = e.focus_timestamp;
                } else if ((e = json.WindowUrgencyChanged)) {
                    root.windows.find(w => w.id == e.id).is_urgent = e.urgent;
                } else if ((e = json.WindowLayoutsChanged)) {
                    e.changes.forEach(change => {
                        const id = change[0];
                        const layout = change[1];
                        const window = root.windows.find(w => w.id == id);
                        window.layout = layout;
                    });
                } else if ((e = json.KeyboardLayoutsChanged)) {
                    root.keyboardLayouts = e.keyboard_layouts;
                } else if ((e = json.KeyboardLayoutSwitched)) {
                    root.keyboardLayouts.current_idx = e.idx;
                } else if ((e = json.OverviewOpenedOrClosed)) {
                    root.overviewing = e.is_open;
                } else if ((e = json.ConfigLoaded)) {
                    // do nothing
                } else if ((e = json.ScreenshotCaptured)) {
                    root.screenshotPath = e.path;
                } else if ((e = json.CastsChanged)) {
                    console.warn("casts changed?? this has never happened before");
                    root.casts = e.casts;
                } else if ((e = json.CastStartedOrChanged)) {
                    console.warn("casts dddf");
                    const index = root.casts.findIndex(c => c.stream_id == e.cast.stream_id);
                    if (index == -1) {
                        root.casts.push(e.cast);
                    }
                } else if ((e = json.CastStopped)) {
                    console.warn("casts dddfeee");
                    root.casts.splice(root.casts.findIndex(c => c.stream_id == e.stream_id), 1);
                } else {
                    console.error("Niri Event not handled");

                    console.log(msg);
                }
            // console.log("WINDOWS:", JSON.stringify(root.windows));
            // console.log("WORKSPACES:", JSON.stringify(root.workspaces));
            // console.log("KEYBOARDS:", JSON.stringify(root.keyboardLayouts));
            // console.log("CASTS", JSON.stringify(root.casts));
            }
        }
        onError: err => {
            root.message = err.toString();
        }
        Component.onCompleted: {
            niriSocket.write(JSON.stringify("EventStream") + "\n");
        }
    }

    function focused_window() {
        root.windows.find(x => x.is_focused);
    }
}
