import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4
import QtQuick.Layouts 1.3

import QQuickHelper.Controls 5.11

ModalDialog 
{
	id: root

	function openWithMsg(msg)
	{
		text = msg;
		open()
	}

	property alias text: _label.text
	property alias icon: _icon.icon
	standardButtons: Dialog.Ok
	contentItem: Row
	{
		spacing : 16
		ColorIcon
		{
			id: _icon
			icon.color: Material.color(Material.Orange)
			icon.width: 32; icon.height: 32
			width: 32; height: 32
			anchors.verticalCenter: parent.verticalCenter
		}

		Label 
		{
			id: _label
			width: parent.width - _icon.width - 8
			anchors.verticalCenter: parent.verticalCenter
			wrapMode: Label.Wrap
		}
	}
}
