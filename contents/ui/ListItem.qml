import QtQuick 1.1
import org.kde.plasma.components 0.1 as Components

Flickable {
    contentWidth: width
    contentHeight: container.height
    clip: true
    
    property alias title: header.text
    property string content
    
    Column {
        id: container
        anchors {
            top: parent.top
            left: parent.left
            right: parent.right
        }
        height: childrenRect.paintedHeight
        spacing: 10
        
        Components.Label {
            id: header
            wrapMode: Text.WordWrap
            textFormat: Text.RichText
            width: parent.width
        }
            
        Components.Label {
            text: "<style>dd { margin-top:5px; }</style>" + content
            wrapMode: Text.WordWrap
            textFormat: Text.RichText
            width: parent.width-30
        }
    }
}