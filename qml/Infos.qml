import QtQuick 2.0
import QtGraphicalEffects 1.15

Rectangle {
    id: root
    width: parent.width * 0.35
    anchors.topMargin: 35
    radius: 10
    property real number: 12
    property string town: ""
    color: "transparent"


    Rectangle {
        id: main
        anchors.fill: parent
        color: "#2E3859"
        radius: root.radius

        Text {
            id: title__
            text: "Information"
            font{family: "Comfortaa"; pointSize:13}
            color: "#E8E8E8"
            y: 10
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {id: num
            text: number
            font{family: "Nunito"; pointSize: 40}
            color: "#7564FB" //004DF7
            x: parent.width/2 - (width+t.width) /2
            y: parent.height * 0.4
        }
        Text {id: t
            text: "towns"
            font{family: "Nunito"; pointSize: 20}
            color: num.color //004DF7
            x: num.x + num.width + 10
            y: parent.height * 0.5
        }
        Text {
            text: "(available)"
            font{family: "Nunito"; pointSize: 14}
            color: "#40ffffff" //004DF7
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height * 0.67
        }

        ///
        Rectangle {
            width: parent.width
            height: 1
            color: "#4F557A"
            y: parent.height * 0.9
        }

        Rectangle {
            id: logo
            width: parent.width
            height: width * 0.333
            y: parent.height * 0.95
            color: "transparent"

            Image {id: dc
                source: "../img/dc.png"
                height: parent.height * 0.8
                width: height
                anchors.verticalCenter: parent.verticalCenter
                x: parent.width/2 - (width+logomark.width)/2
            }
            Text {
                id: logomark
                text: qsTr("dClimate")
                font{family: "Nunito"; pointSize: 14; bold: true}
                anchors.verticalCenter: parent.verticalCenter
                color: "#ffffff"
                anchors.left: dc.right
                anchors.leftMargin: 0
            }
        }

    }
}
