import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4

Dialog
{	
	id: root
	modal: true
	focus: true
	closePolicy : Popup.NoAutoClose

	x: (parent.width - width) / 2
	y: (parent.height - height) / 2
	parent: Overlay.overlay
	//width: Math.min(window.width / 3 * 2,200)

	function openLoadingScreen(message)
	{
		labelStr = message;
		open()
	}

	property string labelStr: ""

	contentItem: Column
	{
		width: parent.width
		spacing: 20
		BusyIndicator
		{
			anchors.horizontalCenter: parent.horizontalCenter
		}
		Label 
		{
			anchors.horizontalCenter: parent.horizontalCenter
			text: labelStr
			verticalAlignment: Text.AlignVCenter
			horizontalAlignment: Text.AlignHCenter
		}
	}
}