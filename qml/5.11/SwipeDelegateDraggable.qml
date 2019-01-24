import QtQuick 2.11
import QtQuick.Templates 2.4 as T
import QtQuick.Controls 2.4
import QtQuick.Controls.impl 2.4
import QtQuick.Controls.Material 2.4
import QtQuick.Controls.Material.impl 2.4

import QQuickHelper.Controls 5.11

T.SwipeDelegate
{
    id: root
    property ListView view: null
    property string indicatorSource: ""

    property bool dragging: _dragArea.drag.active

    property string info : ""
    property bool wrap: false
    property bool wrapInfo: wrap
    property bool wrapTitle: wrap

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            leftPadding + rightPadding)
    implicitHeight: Math.max(background ? background.implicitHeight : 0,
                             Math.max(contentItem.implicitHeight,
                                      indicator ? indicator.implicitHeight : 0) + topPadding + bottomPadding)
    baselineOffset: contentItem.y + contentItem.baselineOffset

    font.capitalization: Font.MixedCase
    
    padding: 0
    topPadding: 0
    bottomPadding: 0
    spacing: 0

    icon.width: 24
    icon.height: 24
    icon.color: enabled ? Material.foreground : Material.hintTextColor

    swipe.transition: Transition { SmoothedAnimation { velocity: 3; easing.type: Easing.InOutCubic } }

    contentItem: DropArea
    {
        id: _drop
        width: view.width
        implicitHeight: control.virtualImplicitHeight
        
        onEntered:
        {
            if(_pane.visualIndex != drag.source.visualIndex)
                root.view.model.move(drag.source.visualIndex, _pane.visualIndex)
        }
        MouseArea
        {
            id: _dragArea
            width: 50
            anchors
            {
                top: parent.top
                bottom: parent.bottom
                right: parent.right
            }
            drag.target: _pane
            drag.axis: Drag.YAxis
        } // Drag Mouse area

        Rectangle
        {
            id: _pane

            Timer 
            {
                interval: 100; running: _dragArea.drag.active; repeat: true
                onTriggered: 
                {
                    if(!root.view.atYBeginning && _pane.y < _pane.implicitHeight/2 )
                        root.view.flick(0, 1000)
                    else if(!root.view.atYEnd && _pane.y > (root.view.height - _pane.height/2))
                        root.view.flick(0, -1000)
                }
            }

            property int visualIndex: index

            width: parent.width
            implicitHeight: control.virtualImplicitHeight + 16
            color: "transparent"

            Drag.active: _dragArea.drag.active
            Drag.hotSpot.y: _pane.height*0.5

            Pane
            {
                id: _virtualPane
                height: control.virtualImplicitHeight + 18
                width: root.width
                visible: _dragArea.drag.active
                padding: 0
                topPadding: 0
                bottomPadding: 0

                Rectangle 
                {
                    anchors.fill: parent
                    visible: _dragArea.drag.active
                    color: root.Material.listHighlightColor
                }
            } // Pane

            states: State 
            {
                when: _dragArea.drag.active
                ParentChange 
                {
                    target: _pane
                    parent: root.view
                }
                AnchorChanges 
                {
                    target: _pane
                    anchors.verticalCenter: undefined
                }
                PropertyChanges 
                { 
                    target: _virtualPane
                    Material.elevation: 4
                }
            } // State

            ItemDelegate 
            {
                id: control
                text: root.text
                icon: root.icon
                info: root.info

                anchors.verticalCenter: parent.verticalCenter

                topPadding: 0
                bottomPadding: 0

                readonly property string indicatorSource: root.indicatorSource

                property int virtualImplicitHeight: Math.max(_iconLabel.implicitHeight, (_labelColumn.visible ? _labelColumn.height : 0))
                implicitHeight: 0// _dragArea.drag.active ? virtualImplicitHeight : 0
                width: _drop.width

                onClicked: root.clicked()
                onPressAndHold: root.pressAndHold()

                background: null

                contentItem: Rectangle 
                {
                    color:"transparent"
                    IconLabel
                    {
                        id: _iconLabel
                        icon: control.icon
                        spacing: control.spacing
                        display: control.display
                        alignment: control.display === IconLabel.IconOnly || control.display === IconLabel.TextUnderIcon ? Qt.AlignCenter : Qt.AlignLeft
                        anchors.verticalCenter: parent.verticalCenter
                        color: control.enabled ? control.Material.foreground : control.Material.hintTextColor
                    }
                    Column
                    {
                        id: _labelColumn
                        anchors
                        {
                            left: _iconLabel.right
                            leftMargin: control.spacing
                            verticalCenter: parent.verticalCenter
                        }
                        Label
                        {
                            text: control.text
                            font: control.font
                            color: control.enabled ? control.Material.foreground : control.Material.hintTextColor
                        }
                        Label
                        {
                            text: control.info
                            font: control.font
                            color: control.Material.hintTextColor
                            property var parentFontSize: control.font.pointSize
                            onParentFontSizeChanged: font.pointSize = parentFontSize*0.7
                            Component.onCompleted: font.pointSize = parentFontSize*0.7
                        }
                    } // Column
                    
                    IconLabel
                    {
                        id: _dragIcon
                        anchors
                        {
                            rightMargin: 0
                            right: parent.right

                            verticalCenter: parent.verticalCenter
                        }
                        icon.width: 32
                        icon.height: 32
                        icon.source: control.indicatorSource 
                        icon.color: Material.hintTextColor
                    } // IconLabel
                } // Rectangle
            }
        }
    }
    background: Rectangle 
    {
        implicitHeight: control.virtualImplicitHeight + 16

        color: root.Material.backgroundColor

        Rectangle {
            width: parent.width
            height: parent.height
            visible: root.highlighted && !_dragArea.drag.active
            color: root.Material.listHighlightColor
        }

        Ripple {
            width: parent.width
            height: parent.height
            visible: !_dragArea.drag.active
            clip: visible
            pressed: root.pressed
            anchor: root
            active: root.down || root.visualFocus || root.hovered
            color: root.Material.rippleColor
            enabled: root.swipe.position === 0
        }
    } // Rectangle
}