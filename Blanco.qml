import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: root
    color: "#dcf763"
    property var players: []
    property var shuffledPlayers: []
    property var blancoPlayers: []
    property var wordPlayers: []
    property string word: "queso" // sacar de una bbdd
    property int numberOfBlancoPlayers: 1 // calcular en base al numero total de players
    property int currentIndex: 0
    property string currentPlayer: ""
    property string currentWord: ""
    property bool ended: false

    Button{
        anchors.centerIn: parent
        width: parent.width * 0.8
        height: parent.height * 0.1
        text: "empezar"
        font.pixelSize: 50
        onClicked: {
            distributePlayers()
            shufflePlayers()
            calculateCurrentPlayerAndWord()
            turnWarning.visible = true
        }
    }

    function distributePlayers(){
        var playersAux = [...players]
        blancoPlayers = []
        wordPlayers = []
        var numberOfPlayers = players.length

        while (blancoPlayers.length < numberOfBlancoPlayers){
            var blancoIndex = Math.floor(Math.random() * numberOfPlayers)
            blancoPlayers.push(String(playersAux.splice(blancoIndex, 1)))
        }

        wordPlayers = playersAux

        print("BLANCO PLAYERS", blancoPlayers.toString())
        print("WORD PLAYERS", wordPlayers.toString())
    }

    function shufflePlayers(){
        shuffledPlayers = [...players]

        for (var i = shuffledPlayers.length - 1; i > 0; i--) {
            const j = Math.floor(Math.random() * (i + 1));
            const temp = shuffledPlayers[i];
            shuffledPlayers[i] = shuffledPlayers[j];
            shuffledPlayers[j] = temp;
        }
    }

    function calculateCurrentPlayerAndWord(){
        if(currentIndex >= shuffledPlayers.length){
            root.ended = true
            return
        }

        currentPlayer = shuffledPlayers[currentIndex]

        // calcular palabra que aplica a current player
        root.currentWord = ""
        if(blancoPlayers.indexOf(currentPlayer.toString()) !== -1 && wordPlayers.indexOf(currentPlayer.toString()) === -1) // si existe solo en blanco players
            root.currentWord = "blanco"
        else if(blancoPlayers.indexOf(currentPlayer.toString()) === -1 && wordPlayers.indexOf(currentPlayer.toString()) !== -1) // si existe solo en word players
            root.currentWord = word
        else
            print("problemas")

        currentIndex++
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
            text: root.currentPlayer
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
            text: root.currentWord
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
                calculateCurrentPlayerAndWord()
                if(!ended){
                    turnWarning.visible = true
                    turnPlay.visible = false
                }
            }
        }
    }
}
