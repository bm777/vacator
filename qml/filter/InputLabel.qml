import QtQuick 2.0
import QtQuick.Controls 2.0         // for textfield

Rectangle {
    id: root

    /**
        property type name: value
    **/
    property string placeholder_text: ""
    property string img_src: ""
    property string indicator: ""
    property string warning: ""
    property string status: ""
    property real distance: 20
    property string f: "Comfortaa"
    signal click
    property bool dark: true

    /**
        JS function to reset data on the input field
    **/
    function reset() {

    }

    /**
        rectangle properties
    **/
    color: root.dark ? "#7564FB" : "#ffffff" //807564FB

    border.color: dark ? "#807564FB" : "#80c6c6c6"  //7564FB
    radius: dark ? height * 0.25 : height * 0.25 //height/2  //5
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
        x: parent.width * 0.07
    }

    /*
        text of the input with value
    */
    TextField {
        id: content
        placeholderText: placeholder_text
        color: dark ? "#f6f6f6" : "#a0000000"
        maximumLength: 20
        width: parent.width - (img_input.x+img_input.width + 5)
        font{family: f; pointSize: 12; bold: true}
        background: Rectangle { color: "transparent" }
        enabled: indicator !== "Date"
        selectByMouse: true
        text: inputDate.date_
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
        color: content.color
        font{family: f; pointSize: 8}
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
        dark: root.dark
        onDate_Changed: content.text = inputDate.date_
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

    Behavior on radius {
        NumberAnimation {duration: 500}
    }

}
