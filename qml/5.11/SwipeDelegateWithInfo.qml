import QtQuick 2.11
import QtQuick.Templates 2.4 as T
import QtQuick.Controls 2.4
import QtQuick.Controls.impl 2.4
import QtQuick.Controls.Material 2.4
import QtQuick.Controls.Material.impl 2.4

T.SwipeDelegate {
    id: control

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

    padding: 16
    topPadding: 8
    bottomPadding: 8
    spacing: 16

    icon.width: 24
    icon.height: 24
    icon.color: enabled ? Material.foreground : Material.hintTextColor

    swipe.transition: Transition { SmoothedAnimation { velocity: 3; easing.type: Easing.InOutCubic } }

    font.capitalization: Font.MixedCase
    
    contentItem: Rectangle 
    {
        color: "transparent"
        implicitHeight: Math.max(_iconLabel.implicitHeight, (_labelColumn.visible ? _labelColumn.height : 0))
        anchors
        {
            left: control.swipe.left ? control.swipe.left.right : undefined
            right: control.swipe.right ? control.swipe.right.left : undefined
            verticalCenter: parent.verticalCenter
            leftMargin: control.spacing
            rightMargin: control.spacing
        }

        property bool titleInIcon: control.info === "" && !control.wrapTitle 

        IconLabel
        {
            id: _iconLabel

            visible: !parent.titleInIcon

            icon: control.icon
            color: control.enabled ? control.Material.foreground : control.Material.hintTextColor

            spacing: control.spacing
            mirrored: control.mirrored
            display: control.display
            alignment: control.display === IconLabel.IconOnly || control.display === IconLabel.TextUnderIcon ? Qt.AlignCenter : Qt.AlignLeft
        
            anchors
            {
                left: !control.mirrored ? parent.left : undefined
                right: !control.mirrored ? undefined : parent.right
                verticalCenter: parent.verticalCenter
            }
        }

        IconLabel
        {
            visible: parent.titleInIcon
            icon: control.icon
            text: control.text
            font: control.font
            color: control.enabled ? control.Material.foreground : control.Material.hintTextColor

            spacing: control.spacing
            mirrored: control.mirrored
            display: control.display
            alignment: control.display === IconLabel.IconOnly || control.display === IconLabel.TextUnderIcon ? Qt.AlignCenter : Qt.AlignLeft
        
            anchors
            {
                fill: parent
                verticalCenter: parent.verticalCenter
            }
        }

        Column
        {
            id: _labelColumn
            visible: !parent.titleInIcon
            anchors
            {
                left: !control.mirrored ? (_iconLabel.visible ? _iconLabel.right : parent.left) : parent.left
                right: !control.mirrored ? parent.right : (_iconLabel.visible ? _iconLabel.left : parent.right)
                verticalCenter: parent.verticalCenter
                leftMargin: !control.mirrored && _iconLabel.width ? control.spacing : 0
                rightMargin: control.mirrored && _iconLabel.width ? control.spacing : 0
            }

            Label
            {
                id: _textLabel
                visible: text !== ""
                text: !control.titleInIcon ? control.text : ""
                font: control.font
                color: control.enabled ? control.Material.foreground : control.Material.hintTextColor
                width: parent.width
                elide: control.wrapTitle ? Text.ElideRight : Text.ElideMiddle
                wrapMode : control.wrapTitle ? Text.WordWrap : Text.NoWrap
                horizontalAlignment: control.mirrored ? control.alignTextRight ? Text.AlignLeft : Text.AlignRight : control.alignTextRight ? Text.AlignRight : Text.AlignLeft
            }

            Label
            {
                id: _infoLabel
                visible: text !== ""
                text: control.info
                font: control.font
                color: control.Material.hintTextColor
                property var parentFontSize: control.font.pointSize
                onParentFontSizeChanged: font.pointSize = parentFontSize*0.7
                Component.onCompleted: font.pointSize = parentFontSize*0.7
                width: parent.width
                elide: control.wrapInfo ? Text.ElideRight : Text.ElideRight
                wrapMode : control.wrapInfo ? Text.WordWrap : Text.NoWrap
                horizontalAlignment: control.mirrored ? control.alignTextRight ? Text.AlignLeft : Text.AlignRight : control.alignTextRight ? Text.AlignRight : Text.AlignLeft
            }
        }
    } // Rectangle

    background: Rectangle {
        implicitHeight: 48

        color: control.Material.backgroundColor

        Rectangle {
            width: parent.width
            height: parent.height
            visible: control.highlighted
            color: control.Material.listHighlightColor
        }

        Ripple {
            width: parent.width
            height: parent.height

            clip: visible
            pressed: control.pressed
            anchor: control
            active: control.down || control.visualFocus || control.hovered
            color: control.Material.rippleColor
            enabled: control.swipe.position === 0
        }
    }
}
