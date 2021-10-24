import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.12
import "filter"
import "condition"
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
        gradient: Gradient {
            GradientStop {position: 0.0; color: "#363F60"}
            GradientStop {position: 0.5; color: "#323B5C"}
            GradientStop {position: 1.0; color: "#2E3859"}
        }
    }

    /*
        filter
    */
    Filter {
        id: filter

    }

    /*
        filter
    */
//    Cu {
//        id: cursor

//    }

    /*
        filter
    */
    Condition {
        id: condition

    }

}
