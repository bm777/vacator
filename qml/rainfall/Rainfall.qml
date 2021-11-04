import QtQuick 2.0
import QtGraphicalEffects 1.15

Rectangle {
    id: root
    width: parent.width * 0.35
    anchors.topMargin: 35
    radius: 10
    property real score: 0.4
    property string f: "Compfortaa"

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
        color: "#01A2F8"
        radius: root.radius

        Text {
            id: title__
            text: "Rainfall"
            font{family: f; pointSize:13}
            color: "#000000"
            y: 18
            x: 10
        }

//        Image {id: img
//            source: "../../img/air.png"
//            width: 40
//            height: width
//            y: 10
//            x: 10

//        }
        Rectangle {
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.95
            height: parent.height * 0.7
            y: parent.height - height - x
            radius: parent.radius
            color: "#2E3859"


            Rectangle {
                anchors.verticalCenter: parent.verticalCenter
                height: parent.height * 0.7
                width: 25
                radius: width/2
                border.color: "#4F557A"
                color: "transparent"
                x: parent.width - width * 1.5
                Rectangle{
                    anchors.centerIn: parent
                    width: parent.width
                    height: parent.height * 0.8
                    color: "transparent"

                    Rectangle {
                        width: parent.width * 0.7
                        height: width
                        radius: height/2
                        anchors.horizontalCenter: parent.horizontalCenter
                        y: parent.height * (1- score) - width/2
                        color: "#FCC304"
                    }
                }
            }

            //
            Text {
                id: first_
                text: "85"
                font{family:f; pointSize: 22; bold: false}
                color: "#FCC304"  //#A7AFDF
                x: 25
                y: parent.height * 0.2
            }
            Text {
                text: "%"
                anchors.left: first_.right
                y: parent.height * 0.22
                font{family: f; pointSize: 12; bold: false}
                color: first_.color
            }
            Rectangle {
                width: first_.width * 1.2
                height: 1
                color: "#4F557A"
                x: first_.x + first_.width/2 - width/2
                y: first_.y + first_.height + 5
            }

            ////
            Text {
                id: second_
                text: "38"
                font{family: f; pointSize: 14; bold: false}
                color: "#80ffffff"  //#A7AFDF
                x: first_.x + first_.width/2 - width/2
                y: parent.height * 0.5
            }
            Text {
                text: "%"
                y: second_.y + second_.height/2 - height/2
                anchors.left: second_.right
                anchors.topMargin: 0
                font{family: f; pointSize: 10; bold: false}
                color: second_.color
            }
        }


    }
}
