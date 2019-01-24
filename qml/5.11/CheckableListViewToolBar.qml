import QtQuick 2.11
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4

import QQuickHelper.Controls 5.11

/** 
 * Toolbar that can be used with a CheckableListView
 * By default it is visible only when checkableListView.checkBoxEnabled is true
 * \code
 * CheckableListViewToolBar 
 * {
 *     width: parent.width
 *     checkableListView: listView
 *     clearButtonIcon: "/path/to/clearButtonIcon.svg"
 *     checkAllIcon: "/path/to/checkAllIcon.svg"
 *     uncheckAllIcon: "/path/to/uncheckAllIcon.svg"
 *     deleteIcon: "/path/to/deleteIcon.svg"
 * }
 * CheckableListView { id: listView; ... }
 * \encode
 */
ToolBar
{
	id: root

	visible: checkableListView && checkableListView.checkBoxEnabled

	/** The checkable listview that control this toolbar */
	property CheckableListView checkableListView: null
	/** Path to the clearButton Icon Source */
	property alias clearButtonIcon: _clearButton.icon
	/** Path to the check All Icon source */
	property alias selectButtonIcon: _selectButton.icon
	/** Path to the delete icon source */
	property alias deleteButtonIcon: _deleteButton.icon

	readonly property bool checkAll: checkableListView && checkableListView.checkedItemCounter < root.checkableListView.maxCheckedItemCounter

	RowLayout
	{
		id: _checkListToolbar
		width: parent.width

		/** Clear Button that disable checkBox when clicked */
		ToolButton
		{
			id: _clearButton
			onClicked: if(root.checkableListView) root.checkableListView.checkBoxEnabled = false
		}
		/** Indicate the number of selected item */
		Label
		{
			text: root.checkableListView ? root.checkableListView.checkedItemCounter : ""
			Layout.fillWidth: true
		}
		/** Select all icon or deselect all icons */
		ToolButton
		{
			id: _selectButton
			onClicked:
			{
				if(root.checkableListView)
				{
					if(root.checkAll)
						root.checkableListView.checkAllItem()
					else
						root.checkableListView.uncheckAllItem()					
				}
			}
		}
		/** Delete all checked item in the checkable list view */
		ToolButton
		{
			id: _deleteButton
			enabled: root.checkableListView && root.checkableListView.checkedItemCounter > 0
			onClicked: if(root.checkableListView) root.checkableListView.deleteCheckedItem()
		}
	} // RowLayout
} // Toolbar
