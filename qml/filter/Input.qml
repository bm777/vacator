import QtQuick 2.0
import QtQuick.Controls 2.0         // for textfield
import QtQuick.Controls.Styles 1.4

Rectangle {
    id: root

    /**
        property type name: value
    **/
    property string placeholder_text: ""
    property bool dark: true
    property string img_src: ""
    property string plaintext: ""
    property string f: "Comfortaa"
    property string indicator: ""
    property string warning: ""
    property string status: ""
//    property real distance: content.text =="" ? 20 : set.height+20
    property real distance: {
        if(indicator === "Place"){
            if(content.text =="") return 0
            else return 0
        }else{
            if(content.text =="") return 20
            else return set.height+20
        }
    }

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
        hoverEnabled: true
        onClicked: {
        }
    }


    /**
        rectangle properties
    **/
    color: root.dark ? "transparent" : "#C2CED3"
    border.color: dark ? "#807564FB" : "#307564FB"//"#80c6c6c6"
    radius: dark ? height * 0.25 : height * 0.25// height/2 //5
    width: parent.width * 0.88
    height: width * 0.23
    anchors.horizontalCenter: parent.horizontalCenter

    /*
        image of the Input
    */
    Image {
        id: img_input
        source: root.dark ? img_src : "../../img/place.png"
        height: parent.height * 0.4
        width: height
        anchors.verticalCenter: parent.verticalCenter
        x: parent.width * 0.07
    }

    /*
        text of the input with value
    */
    TextField {id: content
        placeholderText: placeholder_text
        color:"#f6f6f6"
        maximumLength: 20
        width: parent.width - (img_input.x+img_input.width + 5)
        font{family: f; pointSize: 12; bold: true}
        background: Rectangle {
            color: "transparent"
        }

        enabled: indicator !== "Date"
        selectByMouse: true
        clip: true
        cursorVisible: false
        anchors.left: img_input.right
        y: parent.height * 0.5 - height * 0.6

    }

    /*
        label of the input
    */
    Text {
        id: label
        text: qsTr(indicator)
        y: parent.height - height - 1
        x: parent.width  * 0.3
        color: dark ? "#f6f6f6" : "#f6f6f6"
        font{family: f; pointSize: 8}
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
            if(!(content.text == "") && root.dark) {        /// not empty and dark
                root.color = "#7564FB"

            }else if(!(content.text == "") && !root.dark) { /// not empty and light
                root.color = "#207564FB"
                content.color = "#a0000000"
                label.color = "#80000000"
            }else if(!root.dark && content.text == ""){     /// empty and light
                root.color = "#ffffff"
                content.color = "#80000000"
                label.color = "#80000000"
            }else if(root.dark && content.text !== "") {   /// emty and dark                                    /// empty and light
                root.color = "transparent"
                content.color = "#f6f6f6"
                label.color = "#f6f6f6"
            } else {
                root.color = "transparent"
                content.color = "#f6f6f6"
                label.color = "#f6f6f6"
            }

            return !(content.text == "")
        }

        Text {
            text: qsTr("x")
            anchors.centerIn: parent
            color: "#5E676E"
            font{family: f; pointSize: 15}
        }

        MouseArea {
            anchors.fill: parent
            onClicked: content.text = ""
        }
    }

    ColorAnimation on color {
        duration: 1000
    }

    Behavior on radius {
        NumberAnimation {duration: 500}
    }


}
