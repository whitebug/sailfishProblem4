import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    allowedOrientations: Orientation.All
    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height
        PullDownMenu {
            MenuItem {
                text: qsTr("Менеджер задач")
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
            }
        }

        Column {
            y: Theme.horizontalPageMargin
            id: column
            width: page.width
            spacing: Theme.paddingLarge
            Label {
                x: Theme.horizontalPageMargin
                text: qsTr("Problem 2")
            }

            Button {
                x: Theme.horizontalPageMargin
                text: "Открыть диалог"
                onClicked: {
                    var dialog = pageStack.push(Qt.resolvedUrl("Dialog.qml"))
                    dialog.accepted.connect(function(){
                        label.text = dialog.textFieldValue;
                    })
                }
            }

            Label {
                id: label
                x: Theme.horizontalPageMargin
                width: parent.width - Theme.horizontalPageMargin * 2
                text: qsTr("Тут будет текст из диалога")
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeLarge
            }

            Button {
                x: Theme.horizontalPageMargin
                text: "Открыть менеджер задач"
                onClicked: pageStack.push(Qt.resolvedUrl("SecondPage.qml"))
            }

            Label {
                x: Theme.horizontalPageMargin
                width: parent.width - Theme.horizontalPageMargin * 2
                text: qsTr("Задача 5")
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeLarge
            }

            Button {
                x: Theme.horizontalPageMargin
                text: "Открыть веб браузер"
                onClicked: pageStack.push(Qt.resolvedUrl("WebPage.qml"))
            }
        }
    }
}
