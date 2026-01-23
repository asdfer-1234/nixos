import QtQuick
import QtQuick.Effects

Image {
    id: root
    fillMode: parent.fillMode
    layer.enabled: true
    required property color color
    layer.effect: MultiEffect {
        colorizationColor: root.color
        colorization: 1
    }
}
