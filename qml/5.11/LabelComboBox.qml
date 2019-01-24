import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4

Column
{
	id: root

	property alias label: _label.text
	property alias model: _comboBox.model
	property alias count: _comboBox.count
	property alias currentIndex: _comboBox.currentIndex
	property alias flat: _comboBox.flat
	property alias enabled: _comboBox.enabled
	property alias comboBox: _comboBox
	property alias textRole: _comboBox.textRole

	spacing: 0
	Label 
	{
		id: _label
		wrapMode: Label.Wrap
		font.pixelSize: 12
		font.family : "Roboto"
		//text: root.label
		color: Material.hintTextColor
	}
	ComboBox 
	{
		id: _comboBox
		width: root.width
		anchors.horizontalCenter: parent.horizontalCenter
	}
}
