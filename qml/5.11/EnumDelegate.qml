import QtQuick 2.11
import QtQuick.Templates 2.4 as T
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4

import QQuickHelper.Controls 5.11

ItemDelegate
{
    id: root

    property var model: undefined
    property string title: ""
    property bool mirrorDialog: true

    property var currentValue: 0 // Value can be anything, int, string etc...
    property int currentIndex: 0

    property var delegate: _defaultDelegate
    
    info: currentIndex >=0 && currentIndex < model.count ? model.get(currentIndex).text : ""

    function updateCurrentIndexFromValue()
    {
        for(var i=0; i < model.count; ++i)
        {
            if(model.get(i).value === currentValue)
            {
                if(currentIndex !== i)
                    currentIndex = i
                return;
            }
        }        
    }

    function updateCurrentValueFromIndex(index)
    {
        console.log("updateCurrentValueFromIndex :" + index)
        if(index >= 0 && index < model.count)
        {
            var newVal = model.get(index).value
            if(newVal !== currentValue )
                currentValue = newVal
        }      
    }

    function closeDelegate()
    {
        _dialogLoader.sourceComponent = undefined
    }

    onCurrentValueChanged: updateCurrentIndexFromValue()

    Component
    {
        id: _radioButtonDialogComponent
        RadioButtonDialog
        {
            delegate: root.delegate
            onAccepted: updateCurrentValueFromIndex(currentIndex)
            onClosed: root.closeDelegate()
            model: root.model
            mirrorDialog: root.mirrorDialog
            title: root.title
            Component.onCompleted: currentIndex = root.currentIndex
        }
    }

    Component
    {
        id: _defaultDelegate
        RadioDelegate
        {
            text: model.text ? model.text : ""
            info: model.info ? model.info : ""
            width: parent.width
            wrap: true
            alignTextRight: root.mirrorDialog
            LayoutMirroring.enabled: root.mirrorDialog
            onClicked: ListView.view.currentIndex = index
            checked: ListView.view.currentIndex === index
        }
    }
    
    Loader 
    { 
        id: _dialogLoader
        onLoaded: item.open()
    }

    onClicked: _dialogLoader.sourceComponent = _radioButtonDialogComponent

    Component.onCompleted: updateCurrentIndexFromValue()
}  