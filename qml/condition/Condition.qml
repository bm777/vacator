import QtQuick 2.0
import QtGraphicalEffects 1.15

Rectangle {
    id: root
    width: parent.width * 0.8
    color: "transparent"
//    border.color: "red"
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.topMargin: 10
    radius: 8

//    RectangularGlow {
//        anchors.fill: root
//        spread: 0.1
//        glowRadius: root.radius
//        color: "#000000"
//    }
    DropShadow {
        anchors.fill: parent
        horizontalOffset: -5
        verticalOffset: 5
        radius: 20
        samples: 25
        color: "#000000"
        source: main
    }
    Rectangle {
        id: main
        anchors.fill: parent
        color: "#7564FB"
        radius: root.radius

        Text {
            id: first_text
            text: qsTr("Condition")
            font{family: "Nunito"; pointSize: 18; bold: false}
            color: "#ffffff"
            x: parent.width * 0.1
            y: parent.height * 0.1
        }
        Text {
            id: second_text
            text: qsTr("Did youb know that that you can get perfect time for you vacation.")
            font{family: "Nunito"; pointSize: 12; bold: false}
            color: "#ffffff"
            x: first_text.x
            anchors.top: first_text.bottom
            width: parent.width * 0.45
//            height: parent.height * 0.3
            wrapMode: Text.WordWrap
        }
        Rectangle {
            anchors.top: second_text.bottom
            x: first_text.x
            height: parent.height* 0.18
            anchors.topMargin: 20
            width: parent.width * 0.4
            radius: 8
        }
    }
}
