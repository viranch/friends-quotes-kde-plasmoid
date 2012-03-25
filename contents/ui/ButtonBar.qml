import QtQuick 1.1
import org.kde.plasma.components 0.1 as Components

MouseArea {
    width: buttons.width
    height: buttons.height
    hoverEnabled: true

    signal leftClicked()
    signal rightClicked()

    Components.Highlight {
        anchors.fill: parent
        opacity: parent.containsMouse
        Behavior on opacity { NumberAnimation { duration: 200 } }
    }

    Row {
        id: buttons
        spacing: 2
        opacity: parent.containsMouse
        
        Components.ToolButton {
            iconSource: "arrow-left"
            onClicked: leftClicked()
        }
        
        Components.ToolButton {
            iconSource: "arrow-right"
            onClicked: rightClicked()
        }
        
        Behavior on opacity { NumberAnimation { duration: 200 } }
    }
}
