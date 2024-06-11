import QtQuick

Item {
    anchors.fill: parent
    Text{
        id: txtVotedPlayer
        font.pixelSize: 32
        font.family: hind.name
        font.bold: true
        text: BlancoModel.votedPlayerName
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        x: 123
        y: 183
        width: 144
        height: 51
        color: "#FF83A1"
        opacity: 1
    }

    Image{
        x: 0
        y: 240
        source: "qrc:/image/blanco/Rectangle 23.png"
    }

    Text{
        x: 174
        y: 298
        width: 46
        height: 38
        font.pixelSize: 34
        font.family: hind.name
        color: "#F9F8FF"
        text: "es ..."
    }

    Image{
        x: 155
        y: 384
        opacity: BlancoModel.votedPlayerIsBlanco ? 1 : 0
        source: "qrc:/image/blanco/Group 20.png"
    }

    Image{
        x: 138
        y: 344
        opacity: BlancoModel.votedPlayerIsBlanco ? 0 : 1
        source: "qrc:/image/blanco/Group 21.png"
    }

    Text{
        x: 150
        y: 497
        width: 98
        height: 23
        font.pixelSize: 24
        font.family: monofett.name
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: BlancoModel.votedPlayerIsBlanco ? "#F9F8FF" : "#F9F8FF"
        text: BlancoModel.votedPlayerIsBlanco ? "DE LOS\nBLANCOS" : "DE LOS\nQUE SABEN"
    }

    Text{
        id: endText
        x: 123
        y: 567
        width: 149
        height: 40
        font.pixelSize: 16
        font.family: hind.name
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        color: "#F9F8FF"
        text: "No os relajéis:\ntodavía queda" + (BlancoModel.leftBlancos > 1 ? "n" : "") + " "+ BlancoModel.leftBlancos +" blanco" + (BlancoModel.leftBlancos > 1 ? "s" : "") +" más"
    }

    state: BlancoModel.endState
    onStateChanged: print(state)
    states:[
        State{
            name: "blancosWin"
            PropertyChanges{
                target: endText
                text: "Los blancos ganan!"
            }
        },
        State{
            name: "blancosLose"
            PropertyChanges{
                target: endText
                text: "Los blancos pierden!"
            }
        },
        State{
            name: "repeat"
            PropertyChanges{
                target: endText
                text: "No os relajéis:\ntodavía queda" + (BlancoModel.leftBlancos > 1 ? "n" : "") + " "+ BlancoModel.leftBlancos +" blanco" + (BlancoModel.leftBlancos > 1 ? "s" : "") +" más"
            }
        }

    ]
}
