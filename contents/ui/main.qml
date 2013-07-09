import QtQuick 1.1

Item {
    id: applet
    property int minimumWidth: 470
    property int minimumHeight: 200

    XmlListModel {
        id: xmlModel
        source: "../../tvd.xml"
        //source: "friends.xml"
        query: "/friends-quotes/quote"
        
        XmlRole { name: "title"; query: "title/string()" }
        XmlRole { name: "content"; query: "content/string()" }

        onStatusChanged: {
            if (status==XmlListModel.Ready && ticker.model==0)
                ticker.model = randomize(count);
        }
    }

    property int tickInterval: 5 // in minutes

    Component.onCompleted: {
        plasmoid.addEventListener('ConfigChanged', configChanged);
    }
    function configChanged() {
        tickInterval = plasmoid.readConfig("interval");
        tickTimer.restart();
    }

    Timer {
        id: tickTimer
        interval: tickInterval*60000; running: true; repeat: true
        onTriggered: buttonBar.rightClicked();
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
        id: ticker
        anchors {
            top: parent.top
            bottom: parent.bottom
            bottomMargin: 5
            left: parent.left
            right: parent.right
        }
        model: xmlModel.count
        clip: true
        orientation: ListView.Horizontal
        snapMode: ListView.SnapToItem
        highlightMoveDuration: 500
        interactive: false

        delegate: ListItem {
            title: xmlModel.get(index).title
            //title: xmlModel.get(modelData).title
            //content: xmlModel.get(modelData).content
            content: xmlModel.get(index).content
            width: ticker.width
            height: ticker.height
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
        onLeftClicked: moveTicker(-1);
        onRightClicked: moveTicker(1);

        function moveTicker(direction) {
            if (direction>0) ticker.currentIndex = (ticker.currentIndex+1)%xmlModel.count;
            else if (direction<0 && ticker.currentIndex>0) ticker.currentIndex--;
            tickTimer.restart();
        }
    }
}
