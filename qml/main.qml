import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.12
import "filter"
import "condition"
import "air"
import "rainfall"
import "town"

Window {
    id: root
    title: qsTr("Vacator")
    width: Screen.width * 0.7 > 800 ? 1000 : 800
    height: Screen.height * 0.7 > 600 ? 600 : 600
    minimumWidth: 1000
    minimumHeight: 600
    maximumHeight: 600
    maximumWidth: 1000
    visible: true

    LinearGradient {
        anchors.fill: parent
        start: Qt.point(0, 0)
        end: Qt.point(parent.width, 0)
        visible: filter.dark
        gradient: Gradient {
            GradientStop {position: 0.0; color: "#363F60" }
            GradientStop {position: 0.5; color: "#323B5C" }
            GradientStop {position: 1.0; color: "#2E3859" }
        }
    }
    Rectangle {
        anchors.fill: parent
        color: "#F6F6F8"
        visible: !filter.dark

    }


    /*
        filter
    */
    Filter {
        id: filter
        onDarkChanged: run.start()
    }

    Item {
        id: main
        width: (parent.width - filter.width) * 0.68
        height: parent.height
        anchors.left: filter.right


        //  vertical separator
        Rectangle {
            width: 1
            height: parent.height
            x: parent.width - width
            color: filter.dark ? "#4F557A" : "#804F557A"
        }
        /*
            condition
        */
        Cursor {
            id: cursor
            dark: filter.dark

        }

        /*
            condition
        */
        Condition {
            id: condition
            height: parent.height * (1 - 0.3) / 2
            anchors.top: cursor.bottom
            dark: filter.dark
        }

        /*
            air
        */
        Air {
            id: air
            height: parent.height * 0.37
            anchors.top: condition.bottom
            x: condition.x
            dark: filter.dark
        }
        Rectangle {
            anchors.fill: air
            radius: air.radius
            id: r_air
            color: "transparent"
        }
        /*
            air
        */
        Rainfall {
            id: rainfall
            height: parent.height * 0.37
            anchors.top: condition.bottom
            anchors.left: air.right
            anchors.leftMargin: (parent.width - width*2 - air.x)/2
            dark: filter.dark
        } Rectangle {
            anchors.fill: rainfall
            radius: rainfall.radius
            id: r_rainfall
            color: "transparent"
        }

        /*
            legend
        */
        Legend {
            id: legend
            width: parent.width
            height: parent.height * 0.07
            y: parent.height - height
            dark: filter.dark
        }
    }

    Item {
        id: byside
        width:  ( parent.width - (main.x + main.width) )
        height: parent.height
        x: main.x + main.width

        /*
            Town
        */
        Town {
            id: town
            width: parent.width * 0.8
            height: parent.height * 0.33
            anchors.horizontalCenter: parent.horizontalCenter
            y: parent.height * 0.14
            dark: filter.dark
        }
        Infos {
            id: infoss
            width: parent.width * 0.8
            height: parent.height * 0.37
            anchors.horizontalCenter: parent.horizontalCenter
            y: town.y+ town.height + 45
            town: "New York"
            dark: filter.dark
        }
    }

    //////////////////////
    ParallelAnimation {
        id: run


        PropertyAnimation {
            target: r_rainfall
            property: "color"
            from: "#40F6F6F8"
            to: "transparent"
            duration: 1000
        }
        PropertyAnimation {
            target: r_air
            property: "color"
            from: "#40F6F6F8"
            to: "transparent"
            duration: 1000
        }
    }


}
