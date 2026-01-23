import QtQuick
import QtQuick.Effects

Image {
    id: root
    layer.enabled: true
    required property color color
    layer.effect: MultiEffect {
        colorizationColor: root.color
        colorization: 1
    }
}
