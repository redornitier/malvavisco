import QtQuick 2.15

Item {
    anchors.fill: parent
    Text{
        id: txtStartingPlayer
        font.pixelSize: 32
        font.family: hind.name
        font.bold: true
        text: "TYPE HERE"
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
}
