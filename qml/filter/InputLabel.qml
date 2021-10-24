import QtQuick 2.0
import QtQuick.Controls 2.0         // for textfield

Rectangle {
    id: root

    /**
        property type name: value
    **/
    property string placeholder_text: ""
    property string img_src: ""
    property string plaintext: ""
    property string indicator: ""
    property string warning: ""
    property string status: ""
    property real distance: content.text =="" ? 20 : set.height+20
    signal click

    /**
        JS function to reset data on the input field
    **/
    function reset() {

    }

    /*
        MouseArea a nd action
    */
    MouseArea {
        anchors.fill: parent
        onClicked: {
            inputDate.visible = true
        }
    }


    /**
        rectangle properties
    **/
    color: "transparent"
    border.color: "#7564FB"
    radius: height * 0.25
    width: parent.width * 0.88
    height: width * 0.23
    anchors.horizontalCenter: parent.horizontalCenter

    /*
        image of the Input
    */
    Image {
        id: img_input
        source: img_src
        height: parent.height * 0.4
        width: height
        anchors.verticalCenter: parent.verticalCenter
        x: parent.width * 0.1
    }

    /*
        text of the input with value
    */
    TextField {
        id: content
        placeholderText: placeholder_text
        color: "#f6f6f6"
        maximumLength: 20
        width: parent.width - (img_input.x+img_input.width + 5)
        font{family: "Nunito"; pointSize: 12; bold: true}
        background: Rectangle { color: "transparent" }
        enabled: indicator !== "Date"
        selectByMouse: true
        clip: true
        cursorVisible: false
        anchors.left: img_input.right
        y: parent.height * 0.5 - height * 0.6

        MouseArea {
            anchors.fill: parent
            onClicked: {
                inputDate.visible = true
            }
        }

    }

    /*
        label of the input
    */
    Text {
        id: label
        text: qsTr(indicator)
        y: parent.height - height - 1
        x: parent.width  * 0.3
        color: "#f6f6f6"
        font{family: "Nunito"; pointSize: 8}
    }


    /*
        reset Button
    */
    Rectangle {
        id: set
        height: parent.height * 0.6
        width: height
        radius: height/2
        color: "#C2CED3"
        anchors.bottom: root.top
        anchors.bottomMargin: root.radius/2
        x: parent.width - width
        visible:  {
            if(!(content.text == "")) {
                root.color = "#7564FB"
            }else root.color = "transparent"

            return !(content.text == "")
        }

        Text {
            text: qsTr("x")
            anchors.centerIn: parent
            color: "#5E676E"
            font{family: "Nunito"; pointSize: 15}
        }

        MouseArea {
            anchors.fill: parent
            onClicked: content.text = ""
        }
    }

    ColorAnimation on color {
        duration: 1000
    }

    InputDate {
        id: inputDate
        height: width
        width: parent.width
        anchors.top: root.bottom
        anchors.topMargin: 20
        visible: false
    }

}