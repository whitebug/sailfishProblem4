import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog {
    property alias dialogTaskName: taskName.text
    property alias dialogTaskDate: taskDate.text
    property alias dialogTaskTime: taskTime.text
    property alias dialogTaskText: taskText.text
    Column {
        width: parent.width
        spacing: Theme.paddingMedium
        DialogHeader {}
        Label {
            x: Theme.horizontalPageMargin
            text: qsTr("Имя задачи")
        }
        TextField {
            id: taskName
            width: parent.width
        }
        Label {
            x: Theme.horizontalPageMargin
            text: qsTr("Дата")
        }

        Button {
            id: taskDate
            x: Theme.horizontalPageMargin
            text: "Выберите дату"
            onClicked: {
                var choosenDate = pageStack.push("Sailfish.Silica.DatePickerDialog");
                choosenDate.accepted.connect(function(){
                    taskDate.text = choosenDate.day + " " + choosenDate.month + " " + choosenDate.year
                })
            }
        }
        Label {
            x: Theme.horizontalPageMargin
            text: qsTr("Время")
        }
        Button {
            id: taskTime
            x: Theme.horizontalPageMargin
            text: "Выберите время"
            onClicked: {
                var choosenTime = pageStack.push("Sailfish.Silica.TimePickerDialog");
                choosenTime.accepted.connect(function(){
                    taskTime.text = choosenTime.hour + ":" + choosenTime.minute
                })
            }
        }
        Label {
            x: Theme.horizontalPageMargin
            text: qsTr("Текст задачи")
        }
        TextField {
            id: taskText
            width: parent.width
        }
    }
}
