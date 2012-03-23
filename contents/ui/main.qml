import QtQuick 1.1
import org.kde.plasma.components 0.1 as Components

Item {
    id: ticker
    property int minimumWidth: 470
    property int minimumHeight: 200

    Components.Label {
        id: header
        text: "<h3><i>The One Where Monica Gets A Roommate (A.K.A. The Pilot)</i> [1.01]</h3>"
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
            text: "<style>dd { margin-top:5px; }</style>" + "<dl><dd><b>Monica</b>: There's nothing to tell! He's just some guy I work with!</dd><dd><b>Joey</b>: C'mon, you're going out with the guy! There's gotta be something wrong with him!</dd><dd><b>Chandler</b>: Alright Joey, be nice.</dd><dd><b>Chandler</b>: [<i>to Monica</i>] So does he have a hump? A hump and a hairpiece?</dd><dd><b>Phoebe</b>: Wait, does he eat chalk?</dd></dl>"
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
