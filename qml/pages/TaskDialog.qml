import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog {
    property alias dialogTaskName: taskName.text
    property alias dialogTaskDate: taskDate.date
    property alias dialogDateText: taskDate.text
    property alias dialogTaskTime: taskTime.time
    property alias dialogTimeText: taskTime.text
    property alias dialogTaskText: taskText.text
    SilicaFlickable {
        width: parent.width
        height: parent.height
        contentHeight: dialog.y + dialog.height
        Column {
            id: dialog
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
                text: dialogDateText
                id: taskDate
                property date date: new Date()
            }

            Button {
                x: Theme.horizontalPageMargin
                text: "Выберите дату"

                onClicked: {
                    var v = dialogTaskDate
                    var choosenDate = pageStack.push("Sailfish.Silica.DatePickerDialog");
                    choosenDate.accepted.connect(function(){
                        taskDate.text = ('0' + choosenDate.day).slice(-2) + '/'
                                + ('0' + (choosenDate.month + 1)).slice(-2) + '/'
                                + choosenDate.year;
                        taskDate.date = choosenDate.date;
                    })
                }
            }
            Label {
                id: taskTime
                x: Theme.horizontalPageMargin
                text: dialogTimeText
                property date time: new Date()
            }
            Button {

                x: Theme.horizontalPageMargin
                text: "Выберите время"

                onClicked: {
                    var choosenTime = pageStack.push("Sailfish.Silica.TimePickerDialog");
                    choosenTime.accepted.connect(function(){
                        taskTime.text = ('0' + choosenTime.hour).slice(-2) +
                                              ':' + ('0' + choosenTime.minute).slice(-2);
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
}
