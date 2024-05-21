import QtQuick

Item {
    anchors.fill: parent
    Text{
        id: txtVotedPlayer
        font.pixelSize: 32
        font.family: hind.name
        font.bold: true
        text: BlancoModel.players[BlancoModel.debateIndexPressed] ? BlancoModel.players[BlancoModel.debateIndexPressed] : ""
        x: 123
        y: 183
        width: 114
        height: 50
        color: "#FF83A1"
        opacity: 1
    }

    Image{
        x: 0
        y: 240
        source: "qrc:/image/blanco/Rectangle 23.png"
    }

    states:[
    State{
            name: "win"
        },
        State{
            name: "repeat"
        }

    ]
}
