import QtQuick 1.1
import org.kde.plasma.components 0.1 as Components

Item {
    id: ticker
    property int minimumWidth: 470
    property int minimumHeight: 200
    
    XmlListModel {
        id: model
        source: "friends.xml"
        query: "/friends-quotes/quote"
        
        XmlRole { name:"title"; query:"title/string()" }
        XmlRole { name:"content"; query:"content/string()" }
    }
    
    property int n: Math.floor(Math.random()*model.count)

    Components.Label {
        id: header
        text: model.get(n).title
        wrapMode: Text.WordWrap
        textFormat: Text.RichText
        width: parent.width
    }

    Flickable {
        id: flickableText
        anchors {
            top: header.bottom
            topMargin: 10
            bottom: parent.bottom
            bottomMargin: 5
            left: parent.left
            right: scrollBar.visible ? scrollBar.left : parent.right
        }
        boundsBehavior: scrollBar.visible ? Flickable.DragAndOvershootBounds : Flickable.StopAtBounds
        contentWidth: width
        contentHeight: content.height
        clip: true
        
        Components.Label {
            id: content
            text: "<style>dd { margin-top:5px; }</style>" + model.get(n).content
            wrapMode: Text.WordWrap
            textFormat: Text.RichText
            width: ticker.width-30
        }
    }
    
    Components.ScrollBar {
        id: scrollBar
        flickableItem: flickableText
        anchors {
            right: parent.right
            top: flickableItem.top
            bottom: flickableItem.bottom
        }
    }
}
