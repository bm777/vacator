import QtQuick 2.0

Item {
    id: root
    property string welcome: "Hi,"
    property string message: "Welcome back :)"
    property bool active: false
    width: parent.width
    height: parent.height * 0.12
    Rectangle {anchors.fill: parent; border.color: "red"; color: "transparent"}

    Text {
        id: greating
        font{family: "Nunito"; pointSize: 12}
        x: parent.width * 0.1
        y: parent.height * 0.15
        color: "#ffffff"
    }

    Text {
        id: mess
        font{family: "Nunito"; pointSize: 18}
        x: parent.width * 0.1
        y: parent.height * 0.5
        color: "#ffffff"
    }

    Component.onCompleted: {
        edit(message)
    }

    Timer {
        id: timer
        interval: 1000
        repeat: false
        running: active
        onTriggered: {
            mess.text = message
        }
    }
    // **

    // **

}
