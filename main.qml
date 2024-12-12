import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.15

Window {
    visible: true
    width: 400
    height: 600
    title: "NedoTelegram"

    ListModel {
        id: messageModel
    }

    Component {
        id: messageDelegate
        Item {
            width: parent.width
            height: 50

            Rectangle {
                anchors.fill: parent
                anchors.margins: 8
                radius: 8
                color: model.isMine ? "lightblue" : "black"
                border.color: "black"

                Text {
                    text: model.text
                    anchors.centerIn: parent
                    font.pixelSize: 16
                    color: "black"
                }
            }
        }
    }

    ColumnLayout {
        anchors.fill: parent
        spacing: 10

        ListView {
            id: messageListView
            Layout.fillWidth: true
            Layout.fillHeight: true
            model: messageModel
            delegate: messageDelegate
            clip: true
        }

        RowLayout {
            id: inputRow
            Layout.fillWidth: true
            spacing: 10

            TextField {
                id: messageInput
                Layout.fillWidth: true
                placeholderText: "Write a message..."
                font.pixelSize: 14
            }

            Button {
                text: "Send"
                onClicked: {
                    if (messageInput.text !== "") {
                        messageModel.append({ text: messageInput.text, isMine: true })
                        messageInput.clear()
                        messageListView.contentY = messageListView.contentHeight
                    }
                }
            }
        }
    }
}
