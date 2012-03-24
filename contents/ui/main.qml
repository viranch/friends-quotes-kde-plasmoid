import QtQuick 1.1
import org.kde.plasma.components 0.1 as Components

Item {
    id: ticker
    property int minimumWidth: 470
    property int minimumHeight: 200
    
    XmlListModel {
        id: xmlModel
        source: "friends.xml"
        query: "/friends-quotes/quote"
        
        XmlRole { name: "title"; query: "title/string()" }
        XmlRole { name: "content"; query: "content/string()" }

        onStatusChanged: {
            if (status==XmlListModel.Ready && listView.model==0)
                listView.model = randomize(count);
        }
    }
    
    property int updateInterval: 5 // in minutes
    
     Timer {
         interval: updateInterval*60000; running: true; repeat: true
         onTriggered: listView.currentIndex++;
     }
    
    function randomize(count) {
        if (count<0) return [];
        var a = new Array(count);

        for(i=0; i<count; i++)
            a[i] = i;

        for(i=a.length-1; i>0; i--) {
            j = Math.floor(Math.random() * (i + 1));

            // Swap the elements at positions i and j.
            var temp = a[i];
            a[i] = a[j];
            a[j] = temp;
        }
        
        return a;
    }

    ListView {
        id: listView
        anchors {
            top: parent.top
            bottom: parent.bottom
            bottomMargin: 5
            left: parent.left
            right: parent.right
        }
        model: 0
        clip: true
        orientation: ListView.Horizontal
        snapMode: ListView.SnapToItem
        highlightMoveDuration: 500
        interactive: false
    
        delegate: ListItem {
            title: xmlModel.get(modelData).title
            content: xmlModel.get(modelData).content
            width: listView.width
            height: listView.height
        }
        
        Component.onCompleted: currentIndex = 0
    }
    
    ButtonBar {
        id: buttonBar
        anchors {
            horizontalCenter: parent.horizontalCenter
            bottom: parent.bottom
            bottomMargin: 10
        }
        onLeftClicked: listView.currentIndex--;
        onRightClicked: listView.currentIndex++;
    }
}
