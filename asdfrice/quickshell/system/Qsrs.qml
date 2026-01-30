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
    Process {
        running: true
        command: ["/home/asdfer/newp/qsrs/target/debug/qsrs"]
        stdout: SplitParser {
            onRead: json => {
                const reply = JSON.parse(json);
                root.msg = json;
                let e;
                if ((e = reply.Stat)) {
                    root.cpu = e.cpu;
                    root.ram = e.ram;
                    root.swap = e.swap;
                }
            }
        }
    }
}
