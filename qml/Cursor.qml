import QtQuick 2.0

Item {
    id: root
    property string welcome: "Hi,"
    property string message: "Welcome back :)"
    property bool active: false
    property int i: 0
    width: parent.width
    height: parent.height * 0.12
    Rectangle {anchors.fill: parent; border.color: "red"; color: "transparent"}

    Text {
        id: greating
        text: welcome
        font{family: "Nunito"; pointSize: 12}
        x: parent.width * 0.1
        y: parent.height * 0.15
        color: "#ffffff"
    }

    Text {
        id: mess_id
//        text: message
        font{family: "Nunito"; pointSize: 18}
        x: parent.width * 0.1
        y: parent.height * 0.5
        color: "#ffffff"

        Timer {
            id: timer
            interval: 100
            repeat: true
            running: true

            onTriggered: mess_id.type()
            onRunningChanged: running === false ? print("Stopped.") : null
        }

        function type() {
            text = message.slice(0, ++i);
            if (text === message) return timer.stop()

            mess_id.text = text;
        }
    }


}
