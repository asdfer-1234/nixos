pragma Singleton
import Quickshell.Services.Pipewire
import Quickshell.Widgets
import Quickshell
import QtQuick

Singleton {
    readonly property real volume: Pipewire.defaultAudioSink?.audio?.volume ?? 0
    readonly property bool muted: Pipewire.defaultAudioSink?.audio?.muted ?? false

    PwObjectTracker {
        objects: [Pipewire.defaultAudioSink]
    }
}
