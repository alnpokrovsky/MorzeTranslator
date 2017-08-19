import QtQuick 2.7
import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3

Item {
    property alias outputText: outputText
    property alias btnLoadFile: btnLoadFile
    property alias btnSaveFile: btnSaveFile
    property alias inputText: inputText

    anchors {
        fill: parent
        margins: 10
    }


    /*Row {
        anchors {
            fill: parent
            margins: 10
        }
        spacing: 20*/

    ColumnLayout {
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.horizontalCenter
            left: parent.left
            margins: 10
        }

        ScrollView {
            Layout.fillHeight: true
            Layout.fillWidth: true

            TextArea {
                id: inputText
                font.capitalization: Font.AllUppercase
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                placeholderText: qsTr("Enter text you want to translate")
                selectByMouse: true
                selectByKeyboard: true
                background: Rectangle {
                    implicitWidth: 200
                    implicitHeight: 100
                    border.color: "black"
                    border.width: 1
                }
            }
        }

        Button {
            id: btnLoadFile
            text: qsTr("Load file")
            anchors.bottomMargin: 5
        }
    }


    ColumnLayout {
        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
            left: parent.horizontalCenter
            margins: 10
        }

        /*TabBar {
            anchors {
                right: parent.right
                top: parent.top
                rightMargin: 5
                //topMargin: 5
                bottomMargin: 5
            }

            background: Rectangle {
                color: "#eeeeee"
            }

            TabButton {
                width: 70
                id: checkButtonMorze
                text: qsTr("Morze")
            }
            TabButton {
                width: 70
                text: qsTr("English")
            }
        }*/

        ScrollView {
            Layout.fillHeight: true
            Layout.fillWidth: true

            TextArea {
                id: outputText
                font.capitalization: Font.AllUppercase
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                placeholderText: qsTr("Translated text")
                readOnly: true
                selectByMouse: true
                selectByKeyboard: true
                background: Rectangle {
                    implicitWidth: 200
                    implicitHeight: 100
                    border.color: "black"
                    border.width: 1
                }
            }
        }

        Button {
            id: btnSaveFile
            text: qsTr("Save file")
            anchors.bottomMargin: 5
        }

    }
}
