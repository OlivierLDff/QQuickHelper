import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4

import QQuickHelper.Controls 5.11

Dialog 
{
	id: root
	modal: true
	focus: true

	x: (parent.width - width) / 2
	y: (parent.height - height) / 2
	parent: Overlay.overlay
	width: parent.width / 3 * 2
}
