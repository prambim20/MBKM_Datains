import QtQuick 2.14
import QtQuick.Controls 2.14
import QtQuick.Layouts 1.14

import Theme 1.0


Popup {
    id: questionDialog
    parent: Overlay.overlay

    property alias questionText: label.text
    property alias button1Text: button1.text
    property alias button2Text: button2.text
    property alias button3Text: button3.text
    property int nButtons: 3

    signal button1Clicked()
    signal button2Clicked()
    signal button3Clicked()

    modal: true
    closePolicy: Popup.NoAutoClose

    width: parent.width
    anchors.centerIn: parent

    ColumnLayout {
        id: column
        width: parent.width
        Label {
            id: label
            width: parent.width
            Layout.columnSpan: 1
            Layout.fillWidth: true
            font: Theme.secondaryTitleFont
            wrapMode: Text.Wrap
        }
        RowLayout {
            Layout.alignment: Qt.AlignRight
            Button{
                id: button1
                font: Theme.defaultFont
                onClicked: {
                    button1Clicked();
                    questionDialog.close();
                }
            }
            Button{
                id: button2
                visible: nButtons >= 2
                font: Theme.defaultFont
                onClicked: {
                    button2Clicked();
                    questionDialog.close();
                }
            }
            Button{
                id: button3
                visible: nButtons >= 3
                font: Theme.defaultFont
                onClicked: {
                    button3Clicked();
                    questionDialog.close();
                }
            }
        }
    }
}
