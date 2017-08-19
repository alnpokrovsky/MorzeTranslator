import QtQuick 2.7
import QtQuick.Dialogs 1.2

import FileIO 1.0
import Translator 1.0

Page1Form {
    /*button1.onClicked: {
        console.log("Button Pressed. Entered text: " + textField1.text);
    }*/

    Translator {
        id: translator
        inputValue: inputText.text
        //lang: checkButtonMorze.checked
        onResultValueChanged: {
            outputText.text = resultValue;
        }
    }

    FileIO {
        id: fileIO
        onError: {
            messageDialog.text = msg;
            messageDialog.visible = true;
        }
    }

    MessageDialog {
        id: messageDialog
        title: qsTr("Warning!")
        icon: StandardIcon.Warning
    }

    FileDialog {
        id: openDialog
        selectExisting: true
        visible: false
        title: qsTr("Please choose a file to load")
        nameFilters: [ qsTr("Text files") + "(*.txt)" ]
        folder: shortcuts.home
        onAccepted: {
            inputText.text = fileIO.read(openDialog.fileUrl);
        }
    }

    FileDialog {
        id: saveDialog
        selectExisting: false
        visible: false
        title: qsTr("Please choose a file to save")
        nameFilters: [ qsTr("Text files") + "(*.txt)" ]
        folder: shortcuts.home
        onAccepted: {
            fileIO.write(saveDialog.fileUrl, outputText.text);
        }
    }

    btnLoadFile.onClicked: {
        openDialog.open();
    }

    btnSaveFile.onClicked: {
        saveDialog.open();
    }
}
