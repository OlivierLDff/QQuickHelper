import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4

import QQuickHelper.Controls 5.11

ModalDialog 
{
	id: root

	property bool selectAllText: false

	property alias text: _textField.text
	property alias placeholderText: _textField.placeholderText
	property alias validator: _textField.validator
	property alias acceptableInput: _textField.acceptableInput
	standardButtons: Dialog.Ok | Dialog.Cancel
	contentItem: TextField
	{
		id: _textField
		focus: true
		onAccepted: root.accept()
	}

	onOpened : if(root.selectAllText) _textField.selectAll()
}
