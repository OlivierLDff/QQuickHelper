import QtQuick 2.11
import QtQuick.Templates 2.4 as T
import QtQuick.Controls 2.4
import QtQuick.Controls.Material 2.4

import QQuickHelper.Controls 5.11

Rectangle
{
    id: root
    color: "transparent"

    property string text: ""
    property string value: text
    property string placeholderText: ""
    property string title: ""
    property var validator: null
    property string delegateText: ""
    property alias icon: _delegate.icon
    property bool selectAllText: false
    property bool acceptableInput: true
    property bool delegateEnabled: true

    height: _delegate.implicitHeight

    signal textValidated(string delegateText)

    ItemDelegate
    {
        id: _delegate
        width: parent.width
        text: root.placeholderText
        info: root.text

        Component
        {
            id: _labelDialogComponent
            TextFieldDialog
            {
                id: _labelDialog
                placeholderText: root.placeholderText
                text: root.value
                title: root.title
                validator: root.validator
                selectAllText: root.selectAllText
                onAccepted:
                {
                    root.delegateText = text
                    root.textValidated(text)
                }
                onClosed: _pageLoader.sourceComponent = undefined
                Component.onCompleted:
                {
                    root.acceptableInput = acceptableInput
                }
                onAcceptableInputChanged: root.acceptableInput = acceptableInput
            }
        }
        
        Loader 
        { 
            id: _pageLoader
            onLoaded: item.open()
        }

        onClicked: if(delegateEnabled) _pageLoader.sourceComponent = _labelDialogComponent
    } 
}