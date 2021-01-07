import QtQuick 2.0
import Sailfish.Silica 1.0

CoverBackground {
    Label {
        id: label
        anchors.centerIn: parent
        text: valueInt
        property int valueInt: 0
    }

    CoverActionList {
        id: coverAction

        CoverAction {
            iconSource: "image://theme/icon-cover-next"
            onTriggered: label.valueInt++
        }

        CoverAction {
            iconSource: "image://theme/icon-cover-previous"
            onTriggered: label.valueInt--
        }
    }
}
