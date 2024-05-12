import QtQuick 2.15

Item {

    state: BlancoModel.debateState

    Text{
        id: txtCountdownInstructions
        font.family: hind.name
        font.pixelSize: 16
        text: "Tenéis 5min para debatir quién creéis que es el\nBLANCO. Cuando termine el tiempo tendréis que\nvotar."
        color: "#5B63B7"
        x: 18
        y: 201
        width: 341
        height: 117
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        opacity: 0
    }

    Text{
        id: txtCountdown
        font.family: hind.name
        font.pixelSize: 96
        text: "5:00"
        color: "#5B63B7"
        x: 18
        y: 401
        width: 341
        height: 117
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        opacity: 0
    }

    Text{
        id: txtVotingInstructions
        font.family: hind.name
        font.pixelSize: 16
        text: "¿Quién ha recibido la mayoría de los votos?"
        color: "#5B63B7"
        x: 18
        y: 201
        width: 341
        height: 117
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        opacity: 0
    }

    states:[
        State{
            name: "countdown"
            PropertyChanges{target: txtCountdownInstructions; opacity: 1}
            PropertyChanges{target: txtCountdown; opacity: 1}
        },
        State{
            name: "voting"
            PropertyChanges{target: txtVotingInstructions; opacity: 1}
        }

    ]
}
