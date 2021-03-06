import QtQuick 2.0
import QtGraphicalEffects 1.15

Rectangle {
    id: root
    width: parent.width * 0.35
    anchors.topMargin: 35
    radius: 10
    property bool dark: true
    property real rainfall: 0.0
//    property real score: 0
    property string f: "Comfortaa"

    DropShadow {
        anchors.fill: parent
        horizontalOffset: -5
        verticalOffset: 5
        radius: 20
        samples: dark ? 25 : 10
        color: dark ? "#50000000" : "transparent"
        source: main
    }

    Rectangle {
        id: main
        anchors.fill: parent
        color: root.dark ? "#2E3859" : "#ffffff"
        radius: root.radius


        Text {
            id: title__
            text: "Rainfall"
            font {family: f; pointSize:10}
            color: dark ? "#B5BBCE" : "#000000"
            y: 18
//            x: 10
            anchors.left: img.right
            anchors.leftMargin: 5
        }

        Image {id: img
            source: "../../img/rainfall.png"
            width: 40
            height: width
            y: 10
            x: 10

        }
        Rectangle {id: selector
            anchors.horizontalCenter: parent.horizontalCenter
            width: parent.width * 0.95
            height: parent.height * 0.7
            y: parent.height - height - x
            radius: parent.radius
            color: dark ? "#2E3859" : "#ffffff" //


            Rectangle {
                y: parent.height / 2 - height/2 - 10
                height: parent.height * 0.7
                width: 25
                radius: width/2
                border.color: dark ? "#4F557A" : "#304F557A"
                color: "transparent"
                x: parent.width - width * 1.7
                Rectangle{
                    anchors.centerIn: parent
                    width: parent.width
                    height: parent.height * 0.8
                    color: "transparent"

                    Rectangle {
                        width: parent.width * 0.7
                        height: width
                        radius: height/2
                        anchors.horizontalCenter: parent.horizontalCenter
                        y: {
                            if(rainfall/46 == 0) return (parent.height - width/2)
                            else if(rainfall < 0.1) return (parent.height - width/2) * (1 - 0.1)
                            else if(rainfall >= 0.1 && rainfall < 0.3) return (parent.height - width/2) * (1 - 0.55)
                            else if(rainfall >= 0.3) return (parent.height - width/2) * (1 - 0.9)
                        }

                        color: "#FCC304"
                    }
                }
            }

            //
            Text {
                id: first_
                text: rainfall/46.69 == 0 ? "--" : rainfall.toFixed(3) //Math.round(score * 100)
                font{family:f; pointSize: 22; bold: false}
                color: "#FCC304"  //#A7AFDF
                x: 40
                y: parent.height * 0.2
            }
            Text {
                text: '"'
                anchors.left: first_.right
                y: parent.height * 0.22
                font{family: f; pointSize: 12; bold: false}
                color: first_.color
            }
            Rectangle {
                width: first_.width * 1.2
                height: 1
                color: dark ? "#4F557A" : "#404F557A"
                x: first_.x + first_.width/2 - width/2
                y: first_.y + first_.height + 5
            }

            ////
            Text {
                id: second_
                text: "--"
                font{family: f; pointSize: 14; bold: false}
                color: dark ? "#80ffffff"  : "#80000000"
                x: first_.x + first_.width/2 - width/2
                y: parent.height * 0.5
            }
            Text {
                text: '"'
                y: second_.y + second_.height/2 - height/2
                anchors.left: second_.right
                anchors.topMargin: 0
                font{family: f; pointSize: 10; bold: false}
                color: second_.color
            }
        }
    }
    Text {
        id: bucket
        text: {
            var val = rainfall.toFixed(3)
            if (rainfall/46 === 0) return ""
            if(val < 0.1) return "Light"
            else if(val >= 0.1 && val < 0.3) return "Moderate"
            else if(val >= 0.3) return "Heavy"
        }

        font{family: f; pointSize: 11; bold: false}
        color: dark ? "#90ffffff"  : "#90000000"
        x: (parent.width - width)/2
        y: parent.height * 0.87
    }

    /////////////////////////// Animation

}
