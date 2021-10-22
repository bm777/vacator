import QtQuick 2.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.12

Rectangle {
    id: root
    width: parent.width * 0.22
    height: parent.height

    LinearGradient {
        anchors.fill: parent
        start: Qt.point(0, 0)
        end: Qt.point(parent.width, 0)
        gradient: Gradient {
            GradientStop {position: 0.0; color: "#52456B"}
            GradientStop {position: 1.0; color: "#3D4162"}
        }
    }

    //  vertical separator
    Rectangle {
        width: 1
        height: parent.height
        x: parent.width - width
        color: "#4F557A"
    }

    Rectangle {
        id: logo
        width: parent.width
        height: width * 0.333
        border.color: "red"
        color: "transparent"
    }
}
