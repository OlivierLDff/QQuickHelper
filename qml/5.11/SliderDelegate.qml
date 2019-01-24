import QtQuick 2.11
import QtQuick.Templates 2.4 as T
import QtQuick.Controls 2.4
import QtQuick.Controls.impl 2.4
import QtQuick.Controls.Material 2.4
import QtQuick.Controls.Material.impl 2.4

Pane
{
    id: control

    property alias text: _label.text
    property alias info: _labelInfo.text
    property alias value: _slider.value
    property alias from: _slider.from
    property alias to: _slider.to
    property alias snapMode: _slider.snapMode
    property alias live : _slider.live 
    property alias position: _slider.position
    property alias pressed: _slider.pressed
    property alias stepSize: _slider.stepSize
    property alias icon: _iconLabel.icon

    function decrease() { _slider.decrease(); }
    function increase() { _slider.increase(); }
    function valueAt(position) { _slider.valueAt(position); }

    implicitWidth: Math.max(120,
                            _iconLabel.implicitWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(48, Math.max(_iconLabel.height, _sliderColumn.height) + topPadding + bottomPadding)

    font.capitalization: Font.MixedCase
    
    topPadding: 4
    bottomPadding: 0
    leftPadding: 16
    rightPadding: 16
    spacing: 8

    IconLabel
    {
        id: _iconLabel

        icon.color: control.enabled ? control.Material.foreground : control.Material.hintTextColor
        icon.width: 24
        icon.height: width

        spacing: control.spacing
        mirrored: control.mirrored
        display: IconLabel.IconOnly
        anchors
        {
            left: control.mirrored ? undefined : parent.left
            right: control.mirrored ? parent.right : undefined
            verticalCenter: parent.verticalCenter
        }
    } // IconLabel

    Column
    {
        id: _sliderColumn
        anchors
        {
            left: control.mirrored ? parent.left :  _iconLabel.right
            right: control.mirrored ?  _iconLabel.left : parent.right
            verticalCenter: parent.verticalCenter
            leftMargin: control.mirrored ? undefined : (_iconLabel.width ? control.spacing : 0)
            rightMargin: control.mirrored ? (_iconLabel.width ? control.spacing : 0) : undefined
        }

        Row
        {
            anchors
            {
                left: control.mirrored ? undefined : parent.left
                right: control.mirrored ? parent.right : undefined
            }
            spacing: 8
            Label
            {
                id: _label
                color: control.enabled ? Material.foreground : Material.hintTextColor

                elide: Text.ElideRight
                anchors.bottom: parent.bottom
            } // Label
            Label
            {
                id: _labelInfo

                elide: Text.ElideRight
                color: Material.hintTextColor
                Component.onCompleted: font.pointSize = font.pointSize*0.8
                anchors.bottom: parent.bottom
            } // Label  
        }

        Slider
        {
            id: _slider
            width: parent.width
            value: root.server ? root.server.infoPacketFrequency : 0
            enabled: control.enabled
        } // Slider
    } // Column
} // Pane