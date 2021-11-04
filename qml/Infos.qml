import QtQuick 2.0
import QtGraphicalEffects 1.15

Rectangle {
    id: root
    width: parent.width * 0.35
    anchors.topMargin: 35
    radius: 10
    property real temperature: 31
    property string town: "Washingtown"


    Rectangle {
        id: main
        anchors.fill: parent
        color: "#2E3859"
        radius: root.radius

        Text {
            id: title__
            text: "Information"
            font{family: "Nunito"; pointSize:13}
            color: "#E8E8E8"
            y: 10
            x: 10
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {id: t
            text: temperature
            font{family: "Nunito"; pointSize: 40}
            color: "#7564FB" //004DF7
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height * 0.25
        }
        Text {
            text: "°C"
            font{family: "Nunito"; pointSize: 20}
            color: t.color //004DF7
            x: t.x + t.width
            y: parent.height * 0.27
        }

        ////
        Rectangle {
            width: parent.width * 0.7
            height: 20
            radius: height/2
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height - height * 2
            color: "#7564FB"
            Text {
                text: town
                font{family: "Nunito"; pointSize: 10}
                anchors.centerIn: parent
                color: "#2E3859"
            }
        }


    }
}
