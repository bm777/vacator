import QtQuick 2.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.12

Rectangle {
    id: root
    width: parent.width * 0.23
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
//        border.color: "red"
        color: "transparent"

        Image {id: dc
            source: "../../img/dc.png"
            height: parent.height * 0.8
            width: height
            anchors.verticalCenter: parent.verticalCenter
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


    Text {
        id: tools
        text: qsTr("Operation tools")
        anchors.top: logo.bottom
        anchors.topMargin: 15
        x: parent.width * 0.16
        color: "#b7b6e6"
        font{family: "Nunito"; pointSize: 10}
    }

    /*
        place Input
    */
    Input {
        id: place
        y: tools.y + tools.height + distance
        placeholder_text: "Washingtown"
        img_src: "../../img/place-bold.png"
        indicator: "Place"


        // colorAnimation
//        ColorAnimation on color {
//            duration: 1000
//        }
        Behavior on y {
            NumberAnimation { duration: 500 }
        }
    }

    Input {
        id: date
        y: place.y + place.height + distance
        placeholder_text: "Washingtown"
        img_src: "../../img/place-bold.png"
        indicator: "Place"
    }

}

