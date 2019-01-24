import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4

Item
{
	property alias source: logo.source
	property alias text: label.text

	Image
	{
		id: logo
		width: parent.width*0.8
		anchors.centerIn: parent
		fillMode: Image.PreserveAspectFit
	}

	Label
	{
		id: label
		color: Material.hintTextColor
		anchors.bottom: parent.bottom
		anchors.right: parent.right
		anchors.margins: 10
	}

	ProgressBar
	{
		anchors.bottom: parent.bottom
		anchors.right: parent.right
		anchors.left: parent.left
		indeterminate: true
	}
}