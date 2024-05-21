import QtQuick

Item {
    anchors.fill: parent

    Image{
        x: 0
        y: 51
        source: "qrc:/image/blanco/dibujitos.png"
    }

    // preparation
    Text{
        id: txtCirculo
        font.pixelSize: 20
        font.family: hind.name
        font.bold: true
        text: "PONEOS EN\nCÍRCULO"
        x: 68
        y: 325
        width: 114
        height: 50
        horizontalAlignment: Text.AlignHCenter
        color: "#5B63B7"
        opacity: 0
    }
    Text{
        id: txtSeparadas
        font.pixelSize: 20
        font.family: hind.name
        font.bold: true
        text: "Preparadas..."
        x: 252
        y: 548
        color: "#5B63B7"
        opacity: 0
    }
    Text{
        id: txtListas
        font.pixelSize: 20
        font.family: hind.name
        font.bold: true
        text: "...listas..."
        x: 52
        y: 622
        color: "#5B63B7"
        opacity: 0
    }

    // calling
    Text{
        id: txtStartingPlayer
        font.pixelSize: 32
        font.family: hind.name
        font.bold: true
        text: BlancoModel.players[0]
        x: 63
        y: 303
        width: 114
        height: 50
        color: "#FF83A1"
        opacity: 0
    }
    Text{
        id: txtEmpiezas
        font.pixelSize: 20
        font.family: hind.name
        text: "Empiezas tú!"
        x: 80
        y: 354
        color: "#5B63B7"
        opacity: 0
    }
    Text{
        id: txtCuando
        font.pixelSize: 16
        font.family: hind.name
        text: "...cuando todos hayáis\nparticipado..."
        horizontalAlignment: Text.AlignHCenter
        x: 209
        y: 536
        width: 176
        height: 63
        color: "#5B63B7"
        opacity: 0
    }
    Text{
        id: txtPasad
        font.pixelSize: 16
        font.family: hind.name
        text: "...pasad la votación..."
        x: 4
        y: 631
        color: "#5B63B7"
        opacity: 0
    }

    state: BlancoModel.wordCallingState
    states:[
        State{
            name: "preparation"
            PropertyChanges{target: txtCirculo; opacity: 1}
            PropertyChanges{target: txtSeparadas; opacity: 1}
            PropertyChanges{target: txtListas; opacity: 1}
        },
        State{
            name: "calling"
            PropertyChanges{target: txtStartingPlayer; opacity: 1}
            PropertyChanges{target: txtCuando; opacity: 1}
            PropertyChanges{target: txtEmpiezas; opacity: 1}
            PropertyChanges{target: txtPasad; opacity: 1}
        }
    ]
}
