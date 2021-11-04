import QtQuick 2.0
import QtGraphicalEffects 1.15

Rectangle {
    id: root
    width: parent.width * 0.35
    anchors.topMargin: 35
    radius: 10
    property real score: 0.8

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
        color: "#2E3859"
        radius: root.radius

        Text {
            id: title__
            text: "Air Quality"
            font{family: "Nunito"; pointSize:13}
            color: "#B5BBCE"
            anchors.left: img.right
            y: img.y + img.height/2 - height/2
            anchors.leftMargin: 5
        }

        Image {id: img
            source: "../../img/air.png"
            width: 35
            height: width
            y: 10
            x: 10

        }

        Rectangle {
            id: bord
            y: parent.height * 0.4
            x: parent.width * 0.3
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.6
            radius: 10
            height: width * 0.3
            color: "transparent"
            border.color: "#4F557A"

            Rectangle {
                width: parent.width * 0.8
                height: parent.height
                color: "transparent"
                anchors.centerIn: parent
//                border.color: "red"

                Rectangle {
                    width: height
                    height: parent.height * 0.6
                    color: "#FCC304"
                    radius: height/2
                    anchors.verticalCenter: parent.verticalCenter
                    x: parent.width * score - width/2
                }
            }
        }

        // 1
        Text {
            id: first_
            text: "85"
            anchors.top: bord.bottom
            font{family: "Nunito"; pointSize: 22; bold: false}
            color: "#FCC304"  //#A7AFDF
            anchors.topMargin: 30
            x: parent.width * 0.3
        }

        Text {
            text: "%"
            anchors.top: bord.bottom
            anchors.left: first_.right
            anchors.topMargin: 35
            font{family: "Nunito"; pointSize: 12; bold: false}
            color: first_.color
        }

        Text {
            id: second_
            text: "45"
            font{family: "Nunito"; pointSize: 14; bold: false}
            color: "#80ffffff"
            x: parent.width * 0.65
            y: first_.y + first_.height/2 - height/2
        }

        Text {
            text: "%"
            y: second_.y + second_.height/2 - height/2
            anchors.left: second_.right
            anchors.topMargin: 0
            font{family: "Nunito"; pointSize: 10; bold: false}
            color: second_.color
        }
    }
}
