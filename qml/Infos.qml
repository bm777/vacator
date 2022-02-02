import QtQuick 2.0
import QtGraphicalEffects 1.15

Rectangle {
    id: root
    width: parent.width * 0.35
    anchors.topMargin: 35
    radius: 10
    property real number: 10
    property string town: ""
    color: "transparent"
    property string f: "Comfortaa"
    property bool dark: true


    Rectangle {
        id: main
        anchors.fill: parent
        color: dark? "#2E3859" : "white"
        radius: root.radius

        Text {
            id: title__
            text: "Forecasts"
            font{family: f; pointSize:11}
            color: dark ? "#E8E8E8" : "#000000"
            y: 15
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {id: num
            text: number
            font{family: f; pointSize: 30}
            color: dark ? "#7564FB" : "#006DA0"
            x: parent.width/2 - (width+t.width) /2
            y: parent.height * 0.3
        }
        Text {id: t
            text: "towns"
            font{family: "Nunito"; pointSize: 20}
            color: num.color //004DF7
            x: num.x + num.width + 10
            y: parent.height * 0.34
        }
        Text {
            text: "(available)"
            font{family: f; pointSize: 14}
            color: dark? "#40ffffff": "#cccccc"
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height * 0.52
        }

        ///
        Rectangle {
            width: parent.width
            height: 1
            color: dark ? "#4F557A": "#cccccc"
            y: parent.height * 0.75
        }

        Rectangle {
            id: logo
            width: parent.width
            height: width * 0.333
            y: parent.height * 0.73
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
                font{family: f; pointSize: 14; bold: true}
                anchors.verticalCenter: parent.verticalCenter
                color: dark?  "#ffffff": "#006DA0"
                anchors.left: dc.right
                anchors.leftMargin: 0
            }
        }

    }
}
