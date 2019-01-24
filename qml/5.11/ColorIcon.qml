import QtQuick 2.11
import QtQuick.Templates 2.4 as T
import QtQuick.Controls 2.4
import QtQuick.Controls.impl 2.4
import QtQuick.Controls.Material 2.4
import QtQuick.Controls.Material.impl 2.4

Item
{
	id: _root

	property bool highlighted: false
	property alias icon: _icon.icon

	height: 24
	width: height
	property color color: enabled ? (highlighted ? Material.accent : Material.foreground) : Material.hintTextColor

	IconLabel
	{
		id: _icon
		anchors.fill: parent
	    spacing: 0
	    display: IconLabel.IconOnly
		icon.color: _root.color
	}
}
