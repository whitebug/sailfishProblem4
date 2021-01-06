import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    function getDateAsText(date) {
        return ('0' + date.getDate()).slice(-2) + '/'
                + ('0' + (date.getMonth()+1)).slice(-2) + '/'
                + date.getFullYear();
    }

    function getTimeAsText(time) {
        return ('0' + time.getHours()).slice(-2) + ':'
                + ('0' + (time.getMinutes())).slice(-2);
    }

    SilicaListView {
        id: listView
        PullDownMenu {
            MenuItem {
                text: "Добавить задачу"
                onClicked: {
                    var taskDialog = pageStack.push(
                                Qt.resolvedUrl("TaskDialog.qml"),
                                {
                                    dialogDateText: "Дата",
                                    dialogTimeText: "Время"
                                })
                    taskDialog.accepted.connect(function() {
                        var element = {
                            name: taskDialog.dialogTaskName,
                            date: taskDialog.dialogTaskDate,
                            dateText: getDateAsText(taskDialog.dialogTaskDate),
                            time: taskDialog.dialogTaskTime,
                            timeText: getTimeAsText(taskDialog.dialogTaskTime),
                            textD: taskDialog.dialogTaskText,
                        }
                        taskList.append(element)
                    })
                }
            }
        }
        model: ListModel {
            id: taskList
        }
        anchors.fill: parent
        header: PageHeader {
            title: qsTr("Список задач")
        }
        delegate: Column {
            spacing: Theme.paddingMedium
            Label {
                x: Theme.horizontalPageMargin
                text: 'Задача ' + (index + 1)
                color: Theme.highlightBackgroundColor
                font.pixelSize: Theme.fontSizeLarge
            }
            Label {
                x: Theme.horizontalPageMargin * 2
                text: name
                color: Theme.primaryColor
                font.pixelSize: Theme.fontSizeMedium
            }
            Label {
                x: Theme.horizontalPageMargin * 2
                text: dateText
                color: Theme.primaryColor
                font.pixelSize: Theme.fontSizeMedium
            }
            Label {
                x: Theme.horizontalPageMargin * 2
                text: timeText
                color: Theme.primaryColor
                font.pixelSize: Theme.fontSizeMedium
            }
            Label {
                x: Theme.horizontalPageMargin * 2
                text: textD
                color: Theme.primaryColor
                font.pixelSize: Theme.fontSizeMedium
            }
            Row {
                x: Theme.horizontalPageMargin
                spacing: Theme.paddingMedium
                Button {
                    text: "Редактировать"
                    onClicked: {
                        var item = taskList.get(index);
                        var taskDialog = pageStack.push(Qt.resolvedUrl("TaskDialog.qml"),
                                                        {
                                                            dialogTaskName: item.name,
                                                            dialogTaskDate: item.date,
                                                            dialogTaskTime: item.time,
                                                            dialogTaskText: item.textD,
                                                            dialogDateText: item.dateText,
                                                            dialogTimeText: item.timeText
                                                        })
                        taskDialog.accepted.connect(function() {
                            var element = {
                                name: taskDialog.dialogTaskName,
                                date: taskDialog.dialogTaskDate,
                                dateText: getDateAsText(taskDialog.dialogTaskDate),
                                time: taskDialog.dialogTaskTime,
                                timeText: getTimeAsText(taskDialog.dialogTaskTime),
                                textD: taskDialog.dialogTaskText,
                            }
                            taskList.set(index,element)
                        })
                    }
                }
                Button {
                    text: "Удалить"
                    onClicked: {
                        taskList.remove(taskList.get(index))
                    }
                }
            }
        }

        VerticalScrollDecorator {}
    }
}
