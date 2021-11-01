import QtQuick 2.0
import QtGraphicalEffects 1.15

Rectangle {
    id: root
    width: parent.width * 0.82
    color: "transparent"
//    border.color: "red"
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.topMargin: 10
    radius: 8

    RectangularGlow {
        anchors.fill: root
        spread: 0.1
        glowRadius: root.radius
        color: "#80000000"
    }
    Rectangle {
        anchors.fill: parent
        color: "#7564FB"
        radius: root.radius
    }
}
