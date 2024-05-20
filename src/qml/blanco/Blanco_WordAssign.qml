import QtQuick 2.15

Item {
    anchors.fill: parent

    //PLAYER

    Image{
        id: playerCloud
        source: "qrc:/image/blanco/Group 59.png"
        x: 36
        y: 265
        opacity: 0
    }

    Text{
        id: playerHeader
        opacity: 0
        font.family: hind.name
        font.pixelSize: 16
        color: "#223784"
        text: "Es el momento de repartir los roles."
        width: parent.width
        height: 30
        horizontalAlignment: Text.AlignHCenter
        y: 222
    }

    Text{
        id: playerNameTitle
        opacity: 0
        font.family: hind.name
        font.pixelSize: 16
        color: "#223784"
        text: "Que el móvil lo coja:"
        width: parent.width
        height: 30
        horizontalAlignment: Text.AlignHCenter
        y: 389
    }

    Text{
        id: playerName
        opacity: 0
        font.family: hind.name
        font.pixelSize: 32
        color: "#FF83A1"
        text: BlancoModel.players[BlancoModel.wordAndPlayerIt]
        width: parent.width
        height: 51
        horizontalAlignment: Text.AlignHCenter
        y: 405
        font.bold: true
    }

    Text{
        id: playerFooter
        opacity: 0
        font.family: hind.name
        font.pixelSize: 16
        color: "#223784"
        text: "Cuando nadie más esté viendo la pantalla\npulsa el botón."
        width: parent.width
        height: 60
        horizontalAlignment: Text.AlignHCenter
        y: 631
    }

    //WORD

    Image{
        id: wordCloud
        opacity: 0
    }

    Text{
        id: wordHeader
        opacity: 0
        font.family: hind.name
        font.pixelSize: 16
        color: "#F9F8FF"
        text: "Te ha tocado ser"
        width: parent.width
        height: 30
        horizontalAlignment: Text.AlignHCenter
        y: 224
    }

    Text{
        id: wordSubHeader
        opacity: 0
        font.family: monofett.name
        font.pixelSize: 36
        color: "#F9F8FF"
        text: "DE LOS QUE\nSABEN"
        width: parent.width
        height: 100
        horizontalAlignment: Text.AlignHCenter
        y: 271
    }

    Text{
        id: wordNameTitle
        opacity: 0
        font.family: hind.name
        font.pixelSize: 16
        color: "#223784"
        text: "La palabra es:"
        width: parent.width
        height: 30
        horizontalAlignment: Text.AlignHCenter
        y: 494
    }

    Text{
        id: wordName
        opacity: 0
        font.family: hind.name
        font.pixelSize: 32
        color: "#FF83A1"
        text: BlancoModel.wordList[BlancoModel.wordAndPlayerIt] ? BlancoModel.wordList[BlancoModel.wordAndPlayerIt] : ""
        width: parent.width
        height: 51
        horizontalAlignment: Text.AlignHCenter
        y: 510
        font.bold: true
    }

    state: BlancoModel.wordAssignState
    states:[
        State{
            name: "player"
            PropertyChanges {target: playerCloud; opacity: 1}
            PropertyChanges {target: playerHeader; opacity: 1}
            PropertyChanges {target: playerNameTitle; opacity: 1}
            PropertyChanges {target: playerName; opacity: 1}
            PropertyChanges {target: playerFooter; opacity: 1}
        },
        State{
            name: "word"
            PropertyChanges {target: wordCloud; opacity: 1}
            PropertyChanges {target: wordHeader; opacity: 1}
            PropertyChanges {target: wordSubHeader; opacity: 1}
            PropertyChanges {target: wordNameTitle; opacity: 1}
            PropertyChanges {target: wordName; opacity: 1}
        }

    ]
}
