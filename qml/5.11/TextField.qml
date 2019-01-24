import QtQuick 2.11
import QtQuick.Templates 2.4 as T
import QtQuick.Controls 2.4
import QtQuick.Controls.impl 2.4
import QtQuick.Controls.Material 2.4
import QtQuick.Controls.Material.impl 2.4

T.TextField {
    id: control

    implicitWidth: Math.max(background ? background.implicitWidth : 0,
                            placeholderText ? placeholder.implicitWidth + leftPadding + rightPadding : 0)
                            || contentWidth + leftPadding + rightPadding
    implicitHeight: Math.max(contentHeight + topPadding + bottomPadding,
                             background ? background.implicitHeight : 0,
                             placeholder.implicitHeight + topPadding + bottomPadding)

    topPadding: 8
    bottomPadding: 16

    color: enabled ? Material.foreground : Material.hintTextColor
    selectionColor: Material.accentColor
    selectedTextColor: Material.primaryHighlightedTextColor
    verticalAlignment: TextInput.AlignVCenter

    cursorDelegate: CursorDelegate { }

    property bool withFloatingLabel: true
    property bool isUp: control.withFloatingLabel && (control.activeFocus || control.length)
    selectByMouse: true

    font.capitalization: Font.MixedCase
    
    PlaceholderText {
        id: placeholder
        x: control.leftPadding
        y: (control.isUp ? -control.topPadding*1.25 : control.topPadding)
        width: control.width - (control.leftPadding + control.rightPadding)
        height: control.height - (control.topPadding + control.bottomPadding)
        text: control.placeholderText
        color: control.Material.hintTextColor
        verticalAlignment: control.verticalAlignment
        elide: Text.ElideRight
        visible: control.withFloatingLabel || !control.length && !control.preeditText && (!control.activeFocus || control.horizontalAlignment !== Qt.AlignHCenter)

        font.bold : control.font.bold
		font.capitalization : control.font.capitalization
		font.family : control.font.family
		font.hintingPreference : control.font.hintingPreference
		font.italic : control.font.italic
		font.kerning : control.font.kerning
		font.letterSpacing : control.font.letterSpacing
		font.pointSize : control.isUp ? control.font.pointSize*0.85 : control.font.pointSize
		font.preferShaping  : control.font.preferShaping 
		font.strikeout : control.font.strikeout
		font.styleName : control.font.styleName
		font.underline : control.font.underline
		font.weight : control.font.weight
		font.wordSpacing : control.font.wordSpacing

        property int floatingLabelMovingSpeed: 0
		Behavior on y
		{
			NumberAnimation { easing.type:Easing.OutQuad; duration: placeholder.floatingLabelMovingSpeed }
		}
		Behavior on font.pointSize
		{
			NumberAnimation { easing.type:Easing.OutQuad; duration: placeholder.floatingLabelMovingSpeed }
		}
        Component.onCompleted: if(control.withFloatingLabel) floatingLabelMovingSpeed = 150
    }
    onWithFloatingLabelChanged: if(control.withFloatingLabel) placeholder.floatingLabelMovingSpeed = 150
   
    background: Rectangle {
    	id: rect
        y: control.height - height - control.bottomPadding + 8
        implicitWidth: 120
        width: parent.width
       	height: control.activeFocus || control.hovered ? 2 : 1
        color: (control.hovered ? control.Material.primaryTextColor : control.Material.hintTextColor)

        Rectangle
        {
            id: accentRectangle
            height: 2
            color: control.Material.accentColor
            width: control.activeFocus ? parent.width : 0
            x: control.activeFocus ? 0 : parent.width/2
			Behavior on width
			{
				enabled: !control.activeFocus
				NumberAnimation { easing.type:Easing.OutQuad; duration: 300 }
			}
			Behavior on x
			{
				enabled: !control.activeFocus
				NumberAnimation { easing.type:Easing.OutQuad; duration: 300 }
			}
        }
    }
}
