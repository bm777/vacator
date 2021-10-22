import QtQuick 2.13
import QtQuick.Window 2.13
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.12
import "filter"

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

    Filter {
        id: filter

    }

}
