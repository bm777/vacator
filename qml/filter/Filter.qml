import QtQuick 2.0
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.12

Rectangle {
    id: root
    width: parent.width * 0.23
    height: parent.height
    property bool dark: false
    property real temp: 0
    property real precip: 0
    property real solar: 0
    property string town: "town"
    property string f: "Comfortaa"

    property bool loader: {
        if(busy.running == true) {
            ll.sourceComponent = comp
            return true
        } else
            ll.sourceComponent = null
            return false
    }
    Loader {
        id: ll
        asynchronous: true
//        sourceComponent: comp
        visible: status == Loader.Ready
    }

    Component {
        id: comp

        Rectangle {
            property real _d: {
                if(place.plaintext.includes(" ")){
                    var reformed = place.plaintext.split(" ")
                    reformed = reformed.join("-")
                }else{
                    reformed = place.plaintext
                }


                var temporary = bridge.wdata(reformed, date.plaintext)
                root.town = place.plaintext
                root.temp = temporary[0]
                root.precip = temporary[1]
                root.solar = temporary[2]
                print(temp, precip, solar)
                busy.running = false
                ll.visible = false
                return 0
            }
        }
    }

    RectangularGlow {
        anchors.fill: root
        spread: 0.1
        glowRadius: 10
        color: dark ? "#80000000" : "#20000000"
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
        font {family: f; pointSize: 10}
    }

    /*
        submit button
    */
    DropShadow {
        anchors.fill: btn
        horizontalOffset: -5
        verticalOffset: 5
        radius: 20
        samples: 10
        color: dark ? "#50000000" : "#30000000"
        source: btn
    }

    Rectangle {id: btn
        width: parent.width * 0.8
        height: width * 0.21
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: place.bottom
        anchors.topMargin: 20 + place.height * 2 // cause of the hidden comparison
//        y:  parent.height * 0.6// parent.height - height * 4
        color: dark ? frame.color : "#006DA0" // 7564FB
        radius: height * 0.25
        border.width: 1
        border.color: "transparent"
        Text {id: id_forecast
            text: "Forecast"
            font{family: "Nunito"; pointSize: 12}
            anchors.centerIn: parent
            color: dark ? "#FCC304" : "white"
        }

        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                dark ? parent.border.color = "#FCC304" : parent.border.color = "transparent"
                id_forecast.font.bold = true
            }

            onExited: {
                parent.border.color = "transparent"
                id_forecast.font.bold = false
            }

            onClicked: {
                busy.running = true
            }
        }

    }

//    Text {id: placeholder
//        text: "Forecasting..."
//        font{family: "Nunito"; pointSize: 12}
//        anchors.horizontalCenter: parent.horizontalCenter
//        anchors.top: btn.bottom
//        anchors.topMargin: 20
//        color: dark ? "white" : "#FCC304"
//    }
    BusyIndicator {id: busy
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: btn.bottom
        anchors.topMargin: 20
        running: false

    }
    Text {
        id: logger
        text: ""
        font{family: "Nunito"; pointSize: 12}
        anchors.top: busy.bottom
        anchors.topMargin: 20
        color: dark ? "#FCC304" : "red"
    }

    /*
        place Input
    */
    Input {
        id: place
        y: tools.y + tools.height + 10
        placeholder_text: "Washington..."
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
//    Input {
//        id: compare
//        y: date.y + date.height + distance
//        placeholder_text: "Washington ..."
//        img_src: "../../img/place-bold.png"
//        indicator: "Comparison place"
//        dark: root.dark

//        // colorAnimation
//        Behavior on color {
//            PropertyAnimation { duration: 500 }
//        }
//    }

    /*
        compare Input
    */
    InputLabel {
        id: date
        y: place.y + place.height + distance
        placeholder_text: "Today"
        dark: root.dark
        img_src: "../../img/calendar.png"
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

            Behavior on x {
                NumberAnimation { duration: 500 }
            }
        }
        MouseArea {
            anchors.fill: parent
            hoverEnabled: true
            onClicked: root.dark = !root.dark
        }


    }

//    Timer {
//        id: timer
//        repeat: false
//        running: false
//        onTriggered: {
////            busy.running = true
//            loader = true
//        }
//    }


}

