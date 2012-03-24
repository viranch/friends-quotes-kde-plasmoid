import QtQuick 1.1
import org.kde.plasma.components 0.1 as Components

Item {
    property alias title: header.text
    property string content

    Components.Label {
        id: header
        wrapMode: Text.WordWrap
        textFormat: Text.RichText
        width: parent.width
    }
    
    Flickable {
        id: flickableContent
        anchors {
            top: header.bottom; topMargin: 5
            left: parent.left
            right: scrollBar.visible ? scrollBar.left : parent.right
            bottom: parent.bottom
        }
        interactive: scrollBar.visible
        contentWidth: width
        contentHeight: contentText.paintedHeight
        clip: true

        Components.Label {
            id: contentText
            text: "<style>dd { margin-top:5px; }</style>" + content
            wrapMode: Text.WordWrap
            textFormat: Text.RichText
            width: parent.width-30
            anchors {
                top: parent.top
                left: parent.left
            }
        }
    }

    Components.ScrollBar {
        id: scrollBar
        flickableItem: flickableContent
        anchors {
            right: parent.right
            top: flickableItem.top
            bottom: flickableItem.bottom
        }
    }
}
