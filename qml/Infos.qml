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
            font{family: "Nunito"; pointSize:13}
            color: "#E8E8E8"
            y: 10
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Text {id: num
            text: number
            font{family: "Nunito"; pointSize: 40}
            color: "#7564FB" //004DF7
            x: parent.width/2 - (width+t.width) /2
            y: parent.height * 0.25
        }
        Text {id: t
            text: "towns"
            font{family: "Nunito"; pointSize: 20}
            color: num.color //004DF7
            x: num.x + num.width + 10
            y: parent.height * 0.35
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
