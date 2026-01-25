pragma Singleton
import Quickshell.Services.Pipewire
import Quickshell.Widgets
import Quickshell
import QtQuick

Singleton {
    readonly property PwNode sink: Pipewire.defaultAudioSink
    readonly property real volume: sink?.audio?.volume ?? 0
    readonly property bool muted: sink?.audio?.muted ?? false

    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
    }
}
