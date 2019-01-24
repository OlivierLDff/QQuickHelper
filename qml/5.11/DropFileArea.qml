import QtQuick 2.0
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4

DropArea 
{
	id: root
	property color mainColor: "white"
	property alias text: _label.text
	property int rectLength: Math.min(parent.height, parent.width)/4
	Item
	{
		id: dropProjectLayout
		anchors.fill: parent
		visible: false

		Behavior on opacity { NumberAnimation { duration: 150 } }
		Rectangle 
		{
			anchors.fill: parent
			color: Material.backgroundDimColor
			opacity: 0.5
		}

		Rectangle
		{
			id: hRect
			color: mainColor
			anchors.centerIn: parent
			width: 150
			height: 30
			radius: 15
		}

		Rectangle
		{
			color: mainColor
			anchors.centerIn: parent
			width: hRect.height
			height: hRect.width
			radius: hRect.radius
		}

		Label 
		{
			id: _label
			anchors.centerIn: parent
			text: qsTr("Open File")
			wrapMode: Label.Wrap
			color: "white"
			font.pixelSize: 30
			anchors.verticalCenterOffset: hRect.width/2 + 30
		}

		Rectangle
		{
			color: mainColor
			anchors.top: parent.top
			anchors.left: parent.left
			anchors.margins: 10
			width: hRect.height
			height: root.rectLength
			radius: hRect.radius
		}

		Rectangle
		{
			color: mainColor
			anchors.top: parent.top
			anchors.right: parent.right
			anchors.margins: 10
			width: hRect.height
			height: root.rectLength
			radius: hRect.radius
		}

		Rectangle
		{
			color: mainColor
			anchors.bottom: parent.bottom
			anchors.left: parent.left
			anchors.margins: 10
			width: hRect.height
			height: root.rectLength
			radius: hRect.radius
		}

		Rectangle
		{
			color: mainColor
			anchors.bottom: parent.bottom
			anchors.right: parent.right
			anchors.margins: 10
			width: hRect.height
			height: root.rectLength
			radius: hRect.radius
		}

		Rectangle
		{
			color: mainColor
			anchors.top: parent.top
			anchors.left: parent.left
			anchors.margins: 10
			width: root.rectLength
			height: hRect.height
			radius: hRect.radius
		}

		Rectangle
		{
			color: mainColor
			anchors.top: parent.top
			anchors.right: parent.right
			anchors.margins: 10
			width: root.rectLength
			height: hRect.height
			radius: hRect.radius
		}

		Rectangle
		{
			color: mainColor
			anchors.bottom: parent.bottom
			anchors.left: parent.left
			anchors.margins: 10
			width: root.rectLength
			height: hRect.height
			radius: hRect.radius
		}

		Rectangle
		{
			color: mainColor
			anchors.bottom: parent.bottom
			anchors.right: parent.right
			anchors.margins: 10
			width: root.rectLength
			height: hRect.height
			radius: hRect.radius
		}
	}

	onDropped: 
	{
		dropProjectLayout.visible = false
		dropProjectLayout.opacity = 0
	}

	onEntered: 
	{
		dropProjectLayout.visible = true
		dropProjectLayout.opacity = 1
	}

	onExited: 
	{
		dropProjectLayout.visible = false
		dropProjectLayout.opacity = 0
	}
}