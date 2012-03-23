import QtQuick 1.1
import org.kde.plasma.components 0.1 as Components

Item {
    id: ticker
    property int minimumWidth: 470
    property int minimumHeight: 200

    Components.Label {
        text: "<h3><i>The One Where Monica Gets A Roommate (A.K.A. The Pilot)</i> [1.01]</h3>"
        wrapMode: Text.WordWrap
        textFormat: Text.RichText
        width: parent.width
    }

    Components.Label {
        text: "<dl><dd><b>Monica</b>: There's nothing to tell! He's just some guy I work with!</dd><dd style=\"margin-top: 5px;\"><b>Joey</b>: C'mon, you're going out with the guy! There's gotta be something wrong with him!</dd><dd style=\"margin-top: 5px;\"><b>Chandler</b>: Alright Joey, be nice.</dd><dd style=\"margin-top: 5px;\"><b>Chandler</b>: [<i>to Monica</i>] So does he have a hump? A hump and a hairpiece?</dd><dd style=\"margin-top: 5px;\"><b>Phoebe</b>: Wait, does he eat chalk?</dd></dl>"
        wrapMode: Text.WordWrap
        textFormat: Text.RichText
        width: parent.width-30
        anchors.verticalCenter: parent.verticalCenter
    }
}
