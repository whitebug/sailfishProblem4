import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog {
    property alias dialogTaskName: taskName.text
    property alias dialogTaskDate: taskDate.date
    property alias dialogTaskTime: taskTime.time
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
            id: taskDate
            property date date: new Date()
        }

        Button {
            x: Theme.horizontalPageMargin
            text: "Выберите дату"

            onClicked: {
                var choosenDate = pageStack.push("Sailfish.Silica.DatePickerDialog");
                choosenDate.accepted.connect(function(){
                    taskDate.text = choosenDate.day + " " + choosenDate.month + " " + choosenDate.year;
                    taskDate.date = choosenDate.date;
                })
            }
        }
        Label {
            id: taskTime
            x: Theme.horizontalPageMargin
            text: qsTr("Время")
            property date time: new Date()
        }
        Button {

            x: Theme.horizontalPageMargin
            text: "Выберите время"

            onClicked: {
                var choosenTime = pageStack.push("Sailfish.Silica.TimePickerDialog");
                choosenTime.accepted.connect(function(){
                    taskTime.text = choosenTime.hour + ":" + choosenTime.minute;
                    taskTime.time = choosenTime.time;
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
