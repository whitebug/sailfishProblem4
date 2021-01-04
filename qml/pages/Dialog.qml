import QtQuick 2.0
import Sailfish.Silica 1.0

Dialog {
    property alias textFieldValue: textField.text
    Column {
        width: parent.width
        spacing: Theme.paddingMedium
        DialogHeader {}
        TextField {
            id: textField
            width: parent.width
        }
    }
}
