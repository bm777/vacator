import QtQuick 2.0

Item {
    id: root
    property string welcome: "Hi,"
    property string message: "Welcome back :)            "
    property string message2: "And enjoy the spot vacation finder.."
    property bool active: false
    property bool dark: true
    property int i: 0
    property int i2: 0
    property int j: message.length
    property int j2: message2.length
    width: parent.width
    height: parent.height * 0.12
    property string f: "Comfortaa"
    Rectangle {anchors.fill: parent; border.color: "transparent"; color: "transparent"}

    Text {
        id: greating
        text: welcome
        font{family: f; pointSize: 12}
        x: parent.width * 0.1
        y: parent.height * 0.15
        color: dark ? "#70ffffff" : "#70000000"
    }

    Text {
        id: mess_id
//        text: message
        font{family: f; pointSize: 15}
        x: parent.width * 0.1
        y: parent.height * 0.5
        color: dark ? "#80ffffff" : "#80000000"

        Timer {
            id: timer
            interval: 120
            repeat: true
            running: true

            onTriggered: mess_id.type()
            onRunningChanged: running === false ? /*print("Stopped.")*/ null : null
        }
        Timer {
            id: timer2
            interval: 120
            repeat: true

            onTriggered: mess_id.type2()
            onRunningChanged: running === false ? /*print("Stopped.")*/ null : null
        }

        Timer {
            id: close_timer
            interval: 80
            repeat: true

            onTriggered: mess_id.untype()
            onRunningChanged: running === false ? /*print("Stopped.")*/ null : null
        }
        Timer {
            id: close_timer2
            interval: 80
            repeat: true
//            running: true

            onTriggered: mess_id.untype2()
            onRunningChanged: running === false ? /*print("Stopped.")*/ null : null
        }

        function type() {
            text = message.slice(0, ++i);
            if (text === message) {
                close_timer.running = true
                return timer.stop()
            }
            mess_id.text = text;
        }
        function type2() {
            text = message2.slice(0, ++i2);
            if (text === message2) {
//                close_timer2.running = true
                line.visible = false
                return timer.stop()
            }
            mess_id.text = text;
        }

        function untype() {

            --j
            text = message.slice(0, j)
//            print(j, message.length - j)
            if (text === "") {
                timer2.running = true
                return close_timer.stop()
            }

            mess_id.text = text;
        }
    }
    Rectangle {
        id: line
        width: 1
        height: mess_id.height * 0.8
        x: mess_id.x+ mess_id.width + 2
        y: mess_id.y + mess_id.height/2 - height/2
        color: dark ? "#ffffff" : "#000000"
    }


}
