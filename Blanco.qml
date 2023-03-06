import QtQuick 2.15
import QtQuick.Controls 2.15
import BlancoController 1.0

Rectangle {
    id: root
    color: "#dcf763"
    property alias players: controller.players

    BlancoController{
        id: controller
    }

    Button{
        anchors.centerIn: parent
        width: parent.width * 0.8
        height: parent.height * 0.1
        text: "empezar"
        font.pixelSize: 50
        onClicked: {
            controller.calculateWord()
            controller.distributePlayers()
            controller.shufflePlayers()
            controller.calculateCurrentPlayerAndWord()
            turnWarning.visible = true
        }
    }

    Rectangle{
        id: turnWarning
        anchors.fill: parent
        color: "#dcf763"
        visible: false

        Text{
            id: turnOf
            text: "Es el turno de..."
            width: parent.width * 0.8
            height: parent.height * 0.2
            font.pixelSize: 60
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
        }

        Text{
            id: playerOfTurn
            text: controller.currentPlayer
            width: parent.width * 0.8
            height: parent.height * 0.2
            font.pixelSize: 80
            anchors.top: turnOf.bottom
            anchors.topMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
        }

        Button{
            id: validatePlayerOfTurn
            text: "Soy yo"
            width: parent.width * 0.8
            height: parent.height * 0.2
            font.pixelSize: 60
            anchors.top: playerOfTurn.bottom
            anchors.topMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                turnWarning.visible = false
                turnPlay.visible = true
            }
        }
    }

    Rectangle{
        id: turnPlay
        anchors.fill: parent
        color: "#dcf763"
        visible: false

        Text{
            id: yourWordIs
            text: "Tu palabra es ..."
            width: parent.width * 0.8
            height: parent.height * 0.2
            font.pixelSize: 60
            anchors.top: parent.top
            anchors.topMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
        }

        Text{
            id: currentWord
            text: controller.currentPlayerWord
            width: parent.width * 0.8
            height: parent.height * 0.2
            font.pixelSize: 80
            anchors.top: yourWordIs.bottom
            anchors.topMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter
            horizontalAlignment: Text.AlignHCenter
        }

        Button{
            id: validateEndOfTurn
            text: "OK, siguiente"
            width: parent.width * 0.8
            height: parent.height * 0.2
            font.pixelSize: 60
            anchors.top: currentWord.bottom
            anchors.topMargin: 30
            anchors.horizontalCenter: parent.horizontalCenter
            onClicked: {
                controller.calculateCurrentPlayerAndWord()
                turnWarning.visible = true
                turnPlay.visible = false
            }
        }
    }
}
