import QtQuick

Item {

    state: BlancoModel.debateState


    property string blancoState: BlancoModel.blancoState
    onBlancoStateChanged:{
        if(blancoState === "WordCalling"){
            for (var i = 0; i < BlancoModel.players.length; i++)
                listModel.append({playerName: BlancoModel.players[i]});
        }
    }

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



    ListModel {
        id: listModel
    }

    ListView{
        id: listView
        property int indexPressed: -1
        opacity: 0
        width: 237
        height: 400
        x: 77
        y: 310
        model: listModel
        clip: true
        spacing: 10
        delegate: Rectangle{
            id: listRoot
            width: 237
            height: 50
            color: "transparent"
            border.color: BlancoModel.debateIndexPressed == index ? "#6E75CB" : "transparent"
            border.width: 4
            radius: 41
            Text{
                anchors.fill: parent
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: model.playerName
                font.family: hind.name
                font.bold: true
                font.pixelSize: 32
                color: "#FF83A1"
            }
            MouseArea{
                anchors.fill: parent
                onClicked: BlancoModel.debateIndexPressed = index
            }
        }
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
            PropertyChanges{target: listView; opacity: 1}
        }

    ]
}
