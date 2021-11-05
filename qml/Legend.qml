import QtQuick 2.0

Rectangle {
    id: root
    property string first: "first element LVP"
    property string second: "second element"
    color: "transparent"
    property string f: "Comfortaa"

    Rectangle {
        id: first_rectangle
        width: 10
        height: width
        anchors.verticalCenter: parent.verticalCenter
        x: parent.height * 1.3
        color: "#FCC304"

        Text {id: content1
            text: first
            font{family: f; pointSize: 12; italic: true}
            color: "#40ffffff"
            anchors.verticalCenter: parent.verticalCenter
            x: first_rectangle.width * 2
        }
    }


    ///////////
    Rectangle {
        id: second_rectangle
        width: 10
        height: width
        anchors.verticalCenter: parent.verticalCenter
        x: first_rectangle.x +10+ content1.width + 40
        color: "#80ffffff"

        Text {id: content2
            text: second
            font{family: f; pointSize: 12; italic: true}
            color: "#40ffffff"
            anchors.verticalCenter: parent.verticalCenter
            x: first_rectangle.width * 2
        }
    }
}
