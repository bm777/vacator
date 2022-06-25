import QtQuick 2.10
import QtQuick.Controls 2.0

Rectangle {
    id: root
    color: "transparent"
    property string scheduled: day.model[day.currentIndex]
    property string f: "Comfortaa"
//    property bool dark: true
    property bool dark: true
    property string date_: {
        var index_day = day.currentIndex
        var formated_date = new Date( new Date().setDate(new Date().getDate() +index_day))
        var final_date = Qt.formatDate(formated_date,"yyyy-MM-dd")
        return final_date
    }

    function formatText(count, modelData) {
      var data = count === 12 ? modelData + 1 : modelData;
      return data.toString().length < 2 ? "0" + data : data;
  }

    Rectangle {
        anchors.fill: frame
        visible: !dark
    }
    Rectangle {


        id: frame
        color: dark ? "#2E3957" : "#80006DA0"//"#DCEAFF"
        width: parent.height
        height: parent.height
        radius: 10
        border.color: dark ? "#484F59" : "#f6f6f6"


        FontMetrics {
            id: fontMetrics
        }

        ////
        Component {
          id: delegateComponent

        Label {
            text: formatText(Tumbler.tumbler.count, modelData)
            opacity: 1.0 - Math.abs(Tumbler.displacement) / (Tumbler.tumbler.visibleItemCount / 2)
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            font.pixelSize: fontMetrics.font.pixelSize * 1
            font.family: f
            font.bold: true
            color: dark ? "#BCC2D0" : "#80000000"
           }
        }

        Row {
            id: row
            spacing: 5
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            Tumbler {
                id: day
                model: {
                    var list_date = ["today"]
                    var date_splited
                    for(let i=1; i<31; i++) {
                        date_splited = new Date( new Date().setDate(new Date().getDate() +i)).toString()
                        date_splited = date_splited.split(" ")
                        list_date.push(date_splited[0]+" "+date_splited[1]+" "+date_splited[2])
                    }
                    return list_date
                }

                delegate: delegateComponent
                visibleItemCount: 5
                width: frame.width * 0.5
                height: frame.height * 0.5
                x: frame.width - width
                background: Rectangle {
                    color: "transparent"
//                    border.color: "red"
                }
            }
        }

        Rectangle {
            y: parent.height * (0.4 + 0.045)
            width: parent.width
            height: 1
            color: dark ? "#484F59" : "#80484F59"
        }
        Rectangle {
            y: parent.height * (0.6 - 0.045)
            width: parent.width
            height: 1
            color: dark ? "#484F59" : "#80484F59"
        }

        Rectangle {
            width: parent.width * 0.5
            height: parent.height * 0.15
            y: parent.height - height * 1.2
            anchors.horizontalCenter: parent.horizontalCenter
            color: dark ? "#7765FD" : "#006DA0"
            radius: height/2
            border.color: dark ? "#484F59" : "transparent"
            Text {
                anchors.centerIn: parent
                text: "save"
                color: "#ffffff"
                font{pointSize: 12; family: f}
            }
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    root.visible = false
                }
            }
        }
    }
}
