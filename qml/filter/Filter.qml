import QtQuick 2.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.12

Rectangle {
    id: root
    width: parent.width * 0.23
    height: parent.height
    property bool dark: true
    property string f: "Comfortaa"

    RectangularGlow {
        anchors.fill: root
        spread: 0.1
        glowRadius: 10
        color: dark ? "#80000000" : "#a0a9a9a9"
    }

    LinearGradient {
        anchors.fill: parent
        start: Qt.point(0, 0)
        end: Qt.point(parent.width, 0)
        gradient: Gradient {
            GradientStop {position: 0.0; color: dark ? "#52456B" : "#ffffff"}
            GradientStop {position: 1.0; color: dark ? "#3D4162" : "#ffffff"}
        }
    }



    //  vertical separator
//    Rectangle {
//        width: 1
//        height: parent.height
//        x: parent.width - width
//        color: "#4F557A"
//        visible: !dark
//    }

    Rectangle {
        id: logo
        width: parent.width
        height: width * 0.333
//        border.color: "red"
        color: "transparent"

        Rectangle {id: dc
            height: parent.height * 0.3
            width: height
            anchors.verticalCenter: parent.verticalCenter
            x: parent.width * 0.1
            color: "#2E3859"
            radius: height/2
            Rectangle {
                anchors.centerIn: parent
                width: parent.width * 0.5
                height: width
                radius: height/2
                color: "#7564FB"
            }
        }
        Text {
            id: logomark
            text: qsTr("vacator")
            font{family: f; pointSize: 14; bold: true}
            anchors.verticalCenter: parent.verticalCenter
            color: dark ? "#a0ffffff" : "#a0000000"
            anchors.left: dc.right
            anchors.leftMargin: 10
        }
    }


    Text {
        id: tools
        text: qsTr("Filter")
        anchors.top: logo.bottom
        anchors.topMargin: 15
        x: parent.width * 0.16
        color: dark ? "#b7b6e6" : "#000000"
        font{family: f; pointSize: 10}
    }

//    /*
//        submit button
//    */
//    Rectangle {
//        width: parent.width * 0.88
//        height: width * 0.23
//        anchors.horizontalCenter: parent.horizontalCenter
//        y: parent.height - height * 4
//        color: "#000011"
//        radius: height * 0.25
//        Text {
//            text: "Sort out"
//            font{family: "Nunito"; pointSize: 14}
//            anchors.centerIn: parent
//            color: "#806FFF"
//        }
//    }

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
        dark: root.dark

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
        dark: root.dark

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
//        dark: root.dark
        Behavior on color {
            PropertyAnimation{ duration: 500 }
        }
    }

    //
    Rectangle {id: frame
        y: parent.height - height *1.5
        anchors.horizontalCenter: parent.horizontalCenter
        width: height * 3
        height: 35
        radius: height/2
        color: dark ? "#27173B" : "#2E3957"

        // for dark
        Rectangle {id: mover
            visible: dark
            anchors.verticalCenter: parent.verticalCenter
            height: parent.height * 0.7
            width: height
            radius: height/2
            x: parent.width - width -(parent.height - height) /2
            color: "#FCC304"
            Rectangle {
                width: parent.width
                height: parent.height
                x: -width * 0.3
                radius: height/2
                color: frame.color
            }
        }
        // for light
        Image {
            id: sun
            visible: !dark
            source: "../../img/sun-logo.png"
            height: parent.height * 0.7
            width: height
            anchors.verticalCenter: parent.verticalCenter
            x: parent.width * 0.1

            RotationAnimation {
                target: sun
                running: true
                from: 0
                to: 360
                loops: Animation.Infinite
                duration: 3000
            }
        }

        Text {
            id: center
            text: dark ? "Dark" : "Light"
            font{family: f; pointSize: 12}
            color: "#FCC304"
            anchors.verticalCenter: parent.verticalCenter
            x: dark ? frame.width * 0.2 : frame.width * 0.8 - width

            Behavior on x{
                NumberAnimation { duration: 500 }
            }
        }
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onClicked: root.dark = !root.dark
        }

    }






}

