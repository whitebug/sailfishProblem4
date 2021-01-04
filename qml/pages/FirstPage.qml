import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: page
    allowedOrientations: Orientation.All
    SilicaFlickable {
        anchors.fill: parent
        contentHeight: column.height
        Column {
            y: Theme.horizontalPageMargin
            id: column
            width: page.width
            spacing: Theme.paddingLarge * 2
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
                text: qsTr("Тут будет")
                color: Theme.secondaryHighlightColor
                font.pixelSize: Theme.fontSizeExtraLarge
            }
        }
    }
}
