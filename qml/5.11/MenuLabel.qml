import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4

Pane
{
	property alias text: _label.text
	implicitWidth: 120
	property bool highlighted: false
	bottomPadding: 8
	topPadding: 8
	Label
	{
		id: _label
		width: parent.width
		color: Material.accent
		font.pixelSize: 12
	}
}
