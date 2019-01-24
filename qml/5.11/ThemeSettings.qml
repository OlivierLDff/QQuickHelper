import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4
import Qt.labs.settings 1.0

Settings 
{
	id: root
	category: "Theme"
	property int theme: 2
	property bool dark: true
	property color primary: "#212121"
	property color background: "#303030"
	property color accent: "#00BCD4"
	property color secondary: Material.color(Material.Amber, Material.Shade500)

	function setTheme(theme)
	{
		console.log("Theme is " + theme)
		if(theme === "Light")
		{
			root.theme = 0
			root.dark = false
			root.primary = "white"
			root.background = "white"
			root.accent = Material.color(Material.Orange)
			root.secondary = Material.color(Material.Teal)
		}
		else if(theme === "Night")
		{
			root.theme = 1
			root.dark = true
			root.primary = "#262831"
			root.background = "#313440"
			root.accent = Material.color(Material.Amber)
			root.secondary = Material.color(Material.Teal)
		}
		else if(theme === "Dark")
		{
			root.theme = 2				
			root.dark = true;
			root.primary = "#212121"
			root.background = "#303030"
			root.accent = "#00BCD4"
			root.secondary = Material.color(Material.Amber, Material.Shade500)
		}
	}
}