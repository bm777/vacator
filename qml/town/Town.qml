import QtQuick 2.0
import QtGraphicalEffects 1.15

Rectangle {
    id: root
    width: parent.width * 0.35
    anchors.topMargin: 35
    radius: 10
    property real temperature: 31
    property string town: "Average"
    property string f: "Comfortaa"
    property bool dark: true

    DropShadow {
        anchors.fill: parent
        horizontalOffset: -5
        verticalOffset: 5
        radius: 20
        samples: 25
        color: dark ? "#30000000" : "#10000000"
        source: main
//        visible: false
    }

    Rectangle {
        id: main
        anchors.fill: parent
        color: dark? "#2E3859" : "white"
        radius: root.radius

        Text {
            id: title__
            text: "Temperature"
            font{family: f; pointSize:10}
            color: dark ? "#E8E8E8" : "#000000"
            y: 10
            x: 10
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {id: t
            text: temperature
            font{family: f; pointSize: 40}
            color:  dark ? "#7564FB" : "#006DA0"
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height * 0.25
        }
        Text {
            text: "°C"
            font{family: f; pointSize: 20}
            color: t.color //004DF7
            x: t.x + t.width
            y: parent.height * 0.27
        }

        ////
        Rectangle {
            width: parent.width * 0.7
            height: 25
            radius: height/2
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height - height * 2
            color: dark ? "#7564FB" : "#006DA0"
            Text {
                text: town
                font{family: f; pointSize: 10}
                anchors.centerIn: parent
                color: "white" //"#2E3859"
            }
        }


    }
}
