import QtQuick
import Quickshell
import Quickshell.Widgets
import QtQuick.Layouts

RowLayout {
    id: root
    property bool startSeparator: false
    property bool endSeparator: false

    property Component separator: RowSeparator {}
    default property list<Item> unseparatedChildren
    children: {
        let output = [];
        for (let i = 0; i < unseparatedChildren.length; i++) {
            if (root.startSeparator || i > 0) {
                output.push(root.separator.createObject());
            }
            output.push(root.unseparatedChildren[i]);
        }
        if (root.endSeparator) {
            output.push(root.separator.createObject());
        }
        console.log(output);
        output;
    }
}
