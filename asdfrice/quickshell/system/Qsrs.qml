pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root
    property string msg

    property list<var> cpu
    property var ram
    property var swap
    property var nvidia_gpu
    Process {
        id: qsrs
        running: true
        command: ["qsrs"]
        stdinEnabled: true
        stdout: SplitParser {
            onRead: json => {
                const reply = JSON.parse(json);
                root.msg = json;
                let e;
                if ((e = reply.Stat)) {
                    root.cpu = e.cpu;
                    root.ram = e.ram;
                    root.swap = e.swap;
                    root.nvidia_gpu = e.nvidia_gpu;
                }
            }
        }
    }
    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: () => qsrs.write(JSON.stringify({
                Stat: {}
            }))
    }
}
