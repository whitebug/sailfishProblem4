import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page

    // The effective value will be restricted by ApplicationWindow.allowedOrientations
    allowedOrientations: Orientation.All

    SilicaListView {
        id: listView
        PullDownMenu {
            MenuItem {
                text: "Добавить задачу"
                onClicked: {
                    var taskDialog = pageStack.push(Qt.resolvedUrl("TaskDialog.qml"))
                    taskDialog.accepted.connect(function() {
                        var element = {name: '' + taskDialog.dialogTaskName, date: '' + taskDialog.dialogTaskDate,
                        time: '' + taskDialog.dialogTaskTime, textD: '' + taskDialog.dialogTaskText}
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
            Label {
                x: Theme.horizontalPageMargin
                text: 'Задача ' + index
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
                text: date
                color: Theme.primaryColor
                font.pixelSize: Theme.fontSizeMedium
            }
            Label {
                x: Theme.horizontalPageMargin * 2
                text: time
                color: Theme.primaryColor
                font.pixelSize: Theme.fontSizeMedium
            }
            Label {
                x: Theme.horizontalPageMargin * 2
                text: textD
                color: Theme.primaryColor
                font.pixelSize: Theme.fontSizeMedium
            }
        }

        VerticalScrollDecorator {}
    }
}
