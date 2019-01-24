import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4

import QQuickHelper.Controls 5.11

ModalDialog 
{
	id: root

	property alias model: _list.model
	property alias currentIndex: _list.currentIndex
	property bool mirrorDialog: true

	property var delegate: _defaultDelegate

	standardButtons: Dialog.Ok | Dialog.Cancel
	contentItem: Pane
	{
		implicitHeight: _list.contentItem.childrenRect.height
		padding: 0
		ListView
		{
			anchors.fill: parent
			id: _list
			delegate: root.delegate
		}
		focus: true
		Keys.onReturnPressed: root.accept()
	}

	Component
	{
		id: _defaultDelegate
		RadioDelegate
		{
			text: model.text ? model.text : ""
			info: model.info ? model.info : ""
			width: parent.width
			wrap: true
			alignTextRight: root.mirrorDialog
			LayoutMirroring.enabled: root.mirrorDialog
			onClicked: ListView.view.currentIndex = index
			checked: ListView.view.currentIndex === index
		}
	}
}
