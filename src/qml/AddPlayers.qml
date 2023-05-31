import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: root
    color: "#de6449"
    property var players: []
    property StackView stackView
    property Item blanco: Blanco{}

    Text{
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20
        text: "Añadir Jugadores"
        font.pixelSize: 50
    }
    TextField{
        id: playerNickInput
        width: parent.width * 0.8
        anchors.horizontalCenter: parent.horizontalCenter
        y: 150
        height: parent.height * 0.1
        placeholderText: "nick"
        font.pixelSize: 30
        horizontalAlignment: Text.AlignHCenter
    }

    Button{
        id: addButton
        anchors.top: playerNickInput.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 10
        text: "Añadir"
        font.pixelSize: 30
        font.bold: true
        width: parent.width * 0.8
        height: parent.height * 0.1
        onClicked: {
            root.players.push(playerNickInput.text)
            playersView.text = root.players.toString()
            playerNickInput.text = ""
        }
    }

    TextField{
        id: playersView
        anchors.top: addButton.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.topMargin: 50
        width: parent.width * 0.8
        height: parent.height * 0.1
        font.pixelSize: 30
    }

    Button{
        id: jugarBlanco
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: 30
        text: "Jugar Blanco"
        font.pixelSize: 30
        font.bold: true
        width: parent.width * 0.8
        height: parent.height * 0.1
        onClicked: {
            blanco.players = root.players
            stackView.push(blanco)
        }
    }
}
