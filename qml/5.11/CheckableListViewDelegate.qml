import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4

import QQuickHelper.Controls 5.11

/**
 * This item is a delegate container that contain a normal and a checked Delegate
 * This object needs to be inside a CheckableListView
 */
Pane
{
	id: root

	width: ListView.view.width
	height: (loader.item ? loader.item.implicitHeight : 0)
	padding: 0

	signal clicked()

	/** Text in the delegate */
	property string text: ""

	/** Info in the delegate */
	property string info: ""

	/** Icon of the delegate */
	property string iconSource: ""

	/** If the delegate is checked */
	property bool checked: false

	/** Component displayed by the loader when the list is in normal mode */
	property var normalDelegate: Component 
	{ 
		ItemDelegate
		{
			text: root.text
			info: root.info
			icon.source: root.iconSource

			onPressAndHold: root.enableCheckBox()
			onClicked: root.clicked()
		}
	}
	
	/** Component displayed by the list when the list is in check mode */
	property var checkedDelegate: Component 
	{ 
		CheckDelegate
		{
			id: _checkDelegate
			text: root.text
			info: root.info
			icon.source: root.iconSource

			onCheckedChanged: 
			{
				if(checked) 
				{
					if(!root.checked)
						root.ListView.view.checkItem(index)
				}
				else  
				{
					if(root.checked)
						root.ListView.view.uncheckItem(index)
				}

				if(checked !== root.checked)
					root.checked = checked
			}

			Connections
			{
				target: root
				onCheckedChanged:
				{
					if(_checkDelegate.checked !== root.checked)
						_checkDelegate.checked = root.checked
				}
			}
		}
	}

	Component.onCompleted: updateCheckFromList()

	/** Enable the checkbox into the checkableListView */
	function enableCheckBox()
	{
		ListView.view.checkBoxEnabled = true
		ListView.view.checkItem(index)
	}

	function updateCheckFromList()
	{
		if(root.ListView.view.checkBoxEnabled)
		{
			var newChecked = root.ListView.view.isChecked(index)
			if(newChecked !== root.checked)
				root.checked = newChecked
		}		
	}

	/** Uncheck to be sure next time it is checked it will be uncheck or check */
	Connections
	{
		target: root.ListView.view
		onCheckBoxEnabledChanged:
		{
			if(!root.ListView.view.checkBoxEnabled && root.checked)
				root.checked = false
		}

		onCheckedItemCounterChanged: updateCheckFromList()
	}

	Loader
	{
		id: loader
		anchors.fill: parent
		sourceComponent: root.ListView.view.checkBoxEnabled ? root.checkedDelegate : root.normalDelegate
	}

	//Rectangle 
	//{
	//	width: parent.width
	//	implicitHeight: 1
	//	opacity: root.ListView.view.count > 0 && index < root.ListView.view.count-1 ? 0.3 : 0 
	//	Behavior on opacity { NumberAnimation { easing.type: Easing.OutQuad } }
	//	anchors.bottom: parent.bottom
	//	color: Material.dividerColor
	//}
}
