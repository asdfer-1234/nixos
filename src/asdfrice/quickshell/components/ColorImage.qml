import QtQuick
import QtQuick.Effects

Image {
    id: root
    layer.enabled: true
    property color color: "#ffffff"
    layer.effect: MultiEffect {
        colorizationColor: root.color
        colorization: 1
    }
}
