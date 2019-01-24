import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4

Column
{
	id: root

	property alias text: _label.text
	property alias value: _bar.value
	property alias indeterminate: _bar.indeterminate
	spacing: 5

	Label 
	{
		id: _label
		wrapMode: Label.Wrap
		font.pixelSize: 12
		font.family : "Roboto"
		color: Material.hintTextColor
		elide: Text.ElideMiddle
		width: root.width
		horizontalAlignment: Text.AlignHCenter
	}
	
	ProgressBar 
	{
		id: _bar
		width: root.width
		anchors.horizontalCenter: parent.horizontalCenter
	}
}
