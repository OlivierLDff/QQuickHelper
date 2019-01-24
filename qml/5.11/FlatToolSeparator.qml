import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4

Rectangle 
{
	implicitWidth: 1
	implicitHeight: 38
	color: Material.theme === Material.Dark ? secondary : Material.hintTextColor
}