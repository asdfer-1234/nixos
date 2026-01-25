import Quickshell.Io
import Quickshell
pragma Singleton

// probably only works on my machine due to hardcoded brightness paths

Singleton{
    id: root
    readonly property real brightnessPercentage: brightness / maxBrightness
    property int brightness: 0
    property int maxBrightness: 0
    FileView{
        id: brightnessFile
        watchChanges: true
        path: "/sys/class/backlight/intel_backlight/brightness"
        onFileChanged: reload()
        onLoaded: reload()
        function reload() {
            root.brightness = parseInt(brightnessFile.text())
        }
    }
    FileView{
        id: maxBrightnessFile
        watchChanges: true
        path: "/sys/class/backlight/intel_backlight/max_brightness"
        onFileChanged: reload()
        onLoaded: reload()
        function reload() {
            root.maxBrightness = parseInt(maxBrightnessFile.text())
        }
    }
}
