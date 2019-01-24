import QtQuick 2.11
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4

import QQuickHelper.Controls 5.11

Item
{
    id: root
    property string source: ""
    property string text: ""

    function open(msg)
    {
        root.text = msg
        if(_dialogLoader.sourceComponent)
        {
            _dialogLoader.item.openWithMsg(msg)
        }
        else
        {
            _dialogLoader.sourceComponent = _errorDialogComponent
        }
    }

    Component
    {
        id: _errorDialogComponent
        ErrorDialog
        {
            icon.source: root.source
            onClosed: _dialogLoader.sourceComponent = undefined
        }
    }
    
    Loader 
    { 
        id: _dialogLoader
        onLoaded: item.openWithMsg(root.text)
    }
}