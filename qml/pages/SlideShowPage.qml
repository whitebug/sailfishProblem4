import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    ListModel {
        id: listModel
        ListElement {
            name: "Задача 1"
            texts: "Текст задачи 1"
        }
        ListElement {
            name: "Задача 2"
            texts: "Текст задачи 2"
        }
        ListElement {
            name: "Задача 3"
            texts: "Текст задачи 3"
        }
        ListElement {
            name: "Задача 4"
            texts: "Текст задачи 4"
        }
        ListElement {
            name: "Задача 5"
            texts: "Текст задачи 5"
        }
    }

    SlideshowView {
        id: slideShow
        anchors.centerIn: parent
        height: width
        itemWidth: width; itemHeight: width;
        model: listModel
        delegate: Rectangle {
            width: slideShow.itemWidth
            height: slideShow.itemHeight
            color: "transparent"
            Column {
                anchors.centerIn: parent
                Label {
                    text: name
                    color: "white"
                }
                Label {
                    text: texts
                    color: "white"
                }
            }
        }
    }
}
