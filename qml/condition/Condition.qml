import QtQuick 2.0
import QtGraphicalEffects 1.15

Rectangle {
    id: root
    width: parent.width * 0.8
    color: "transparent"
    property bool dark: true
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.topMargin: 10
    radius: 8
    property string f: "Comfortaa"
    property string town: "Washingtown"
    property string compared: "New York"
    property string condition : "Rainy" // Sunny Cloudy Rainy

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
        visible: dark
    }
    Rectangle {
        id: main
        anchors.fill: parent
        color: "#7564FB"
        radius: root.radius

        Text {
            id: first_text
            text: qsTr("Condition")
            font{family: f; pointSize: 18; bold: false}
            color: "#ffffff"
            x: parent.width * 0.1
            y: parent.height * 0.1
        }
        Text {
            id: second_text
            text: qsTr("Did you know you can get perfect time for your vacation.")
            font{family: f; pointSize: 10; bold: false}
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
            anchors.topMargin: 40
            width: parent.width * 0.4
            radius: 8
            color: "#363F60"

            // text of town
            Text {
                id: place
                text: root.town
                font{family: f; pointSize: 10; bold: true}
                color: "#ffffff"
                x: parent.width * 0.1
                anchors.verticalCenter: parent.verticalCenter

            }
            Image {
                anchors.verticalCenter: parent.verticalCenter
                x: parent.width - width * 1.7
                source: "../../img/switch-town.png"
                height: parent.height * 0.5
                rotation: 90
                width: height
            }
        }

        //// forcast condition
        Rectangle {
            anchors.left: frame_text.right
            anchors.leftMargin: 4
            width: parent.width * 0.5 - 4
            height: parent.height * 0.8
            y: first_text.y
            color: "transparent"

            Image {id: encoded
                source: {
                    if(condition === "Sunny") return "../../img/sun.png"
                    if (condition === "Cloudy") return "../../img/cloud.png"
                    return ""
                }
                width: parent.width * 0.7
                height: width
                anchors.horizontalCenter: parent.horizontalCenter
                visible: condition !== "Rainy"

            }
            AnimatedImage {
                source: "../../img/rain.gif"
                width: parent.width * 0.7
                height: width
                anchors.horizontalCenter: parent.horizontalCenter
                visible: condition === "Rainy"

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
                cornerRadius: glowRadius
                color: {
                    if(condition === "Sunny") return "#40F1C40F"
                    if(condition === "Cloudy") return "#40ADD8E6"
                    return "#40ADD8E6"
                }
                visible: condition === "Sunny" || condition === "Cloudy"
            }
            Text {
                anchors.top: encoded.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: {
                    if(condition==="Sunny") return 15
                    return -10
                }
                text: condition
                color: {
                    if(condition==="Cloudy") return "#ffffff"
                    if(condition==="Rainy") return "#ffffff"
                    return "#F1C40F"
                }
                font{family: f}
            }
        }
    }
}
