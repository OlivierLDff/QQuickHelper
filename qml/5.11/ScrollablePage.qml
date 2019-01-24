import QtQuick 2.11
import QtQuick.Controls 2.4
Page 
{
    id: page

    default property alias content: pane.contentItem
    property alias panePadding: pane.padding

    Flickable {
        anchors.fill: parent
        contentHeight: pane.implicitHeight
        flickableDirection: Flickable.AutoFlickIfNeeded

        Pane {
            id: pane
            width: parent.width
            //height: page.height
            padding: 0
        }

        ScrollIndicator.vertical: ScrollIndicator { }
    }
}