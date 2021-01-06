import QtQuick 2.0
import Sailfish.Silica 1.0

Page {
    id: webPage
    SilicaWebView {
        id: webBrowser
        anchors {
            top: parent.top
            left: parent.left; right: parent.right
            bottom: urlText.top
        }
        url: "https://google.com"
    }
    TextField {
        id: urlText
        anchors {
            right: parent.right; left: parent.left
            bottom: parent.bottom
        }
        text: "https://google.com"
        label: webBrowser.title
        EnterKey.onClicked: webBrowser.url = text
    }
}
