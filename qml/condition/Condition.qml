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
    property string town: "Washingtown"
    property string compared: "New York"
    property string condition : "Sunny"

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
            text: qsTr("Did youb know you can get perfect time for you vacation.")
            font{family: "Nunito"; pointSize: 12; bold: false}
            color: "#ffffff"
            x: first_text.x
            anchors.top: first_text.bottom
            width: parent.width * 0.45
//            height: parent.height * 0.3
            wrapMode: Text.WordWrap
        }
        Rectangle {id: frame_text
            anchors.top: second_text.bottom
            x: first_text.x
            height: parent.height* 0.18
            anchors.topMargin: 20
            width: parent.width * 0.4
            radius: 8
            color: "#363F60"

            // text of town
            Text {
                id: place
                text: root.town
                font{family: "Nunito"; pointSize: 10; bold: true}
                color: "#ffffff"
                x: parent.width * 0.1
                anchors.verticalCenter: parent.verticalCenter

            }
            Image {
                anchors.verticalCenter: parent.verticalCenter
                x: parent.width - width * 1.7
                source: "../../img/switch-town.png"
                height: parent.height * 0.7
                width: height
            }
        }

        //// forcast condition
        Rectangle {
//            id: frame_condition
            anchors.left: frame_text.right
            anchors.leftMargin: 4
            width: parent.width * 0.5 - 4
            height: parent.height * 0.8
            y: first_text.y
            color: "transparent"

            Image {id: encoded
                source: {
                    if(condition === "Sunny") return "../../img/sun.png"
                    else return "../../img/sun.png"
                }
                width: parent.width * 0.7
                height: width
                anchors.horizontalCenter: parent.horizontalCenter
//                y: parent.height *

            }
            RotationAnimation {
                target: encoded
                running: condition === "Sunny"
                from: 0
                to: 360
                loops: Animation.Infinite
                duration: 3000
            }
            RectangularGlow {
                anchors.fill: encoded
                spread: 0
                glowRadius: encoded.width / 2
                color: "#50F1C40F"
                visible: condition === "Sunny"
            }
        }
    }
}
