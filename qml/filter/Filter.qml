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
        text: qsTr("Filter")
        anchors.top: logo.bottom
        anchors.topMargin: 15
        x: parent.width * 0.16
        color: "#b7b6e6"
        font{family: "Nunito"; pointSize: 10}
    }

    /*
        submit button
    */
    Rectangle {
        width: parent.width * 0.88
        height: width * 0.23
        anchors.horizontalCenter: parent.horizontalCenter
        y: parent.height - height * 4
        color: "#E3F085"
        radius: height * 0.25
        Text {
            text: "Sort out"
            font{family: "Nunito"; pointSize: 14}
            anchors.centerIn: parent
            color: "#CF642D"
        }
    }

    /*
        place Input
    */
    Input {
        id: place
        y: tools.y + tools.height + 10
        placeholder_text: "Washingtown"
        img_src: "../../img/place-bold.png"
        indicator: "Place"

        // colorAnimation
        Behavior on color {
            PropertyAnimation{ duration: 500 }
        }

    }

    /*
        compare Input
    */
    Input {
        id: compare
        y: date.y + date.height + distance
        placeholder_text: "Washingtown"
        img_src: "../../img/place-bold.png"
        indicator: "Comparison place"

        // colorAnimation
        Behavior on color {
            PropertyAnimation{ duration: 500 }
        }
    }

    /*
        compare Input
    */
    InputLabel {
        id: date
        y: place.y + place.height + distance
        placeholder_text: "Today"
        img_src: "../../img/calendar-bold.png"
        indicator: "Date"

        Behavior on color {
            PropertyAnimation{ duration: 500 }
        }
    }

    //

}

