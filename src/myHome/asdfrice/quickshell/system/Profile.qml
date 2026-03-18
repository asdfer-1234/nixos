pragma Singleton
import Quickshell
import Quickshell.Io

Singleton {
    property string hostname
    readonly property string user: Quickshell.env("USER")

    Process {
        running: true
        command: "hostname"
        stdout: StdioCollector {
            onStreamFinished: {
                hostname = this.text.trim();
            }
        }
    }
}
