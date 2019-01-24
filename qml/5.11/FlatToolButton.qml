import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4

Button
{
	property string toolTipText
	flat:true
	implicitWidth: 48
	icon.color: highlighted ? Material.accent : (enabled ? Material.foreground : Material.hintTextColor)

	ToolTip.visible: (ToolTip.text != "") && (hovered | down)
	ToolTip.delay: 400
	ToolTip.text: toolTipText
}
