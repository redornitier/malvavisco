import QtQuick 2.15

Item {
    id: root
    width: 390
    height: 844

    Rectangle{anchors.fill: parent; color: "#eeeeee"}

    Text{
        id: malvavisco
        x: 21
        y: 55
        font.family: jua.name
        font.pixelSize: 32
        text: "MALVAVIS.CO."
        color: "#001C63"
        Behavior on opacity {NumberAnimation {duration: 200}}
    }

    Text{
        id: games
        x: 20
        y: 81
        font.family: jua.name
        font.pixelSize: 36
        text: "games"
        color: "#001C63"
        Behavior on opacity {NumberAnimation {duration: 200}}
    }

    Image{
        id: group57
        source: "qrc:/Group 57.png"
        x: 20
        y: 153
        Behavior on opacity {NumberAnimation {duration: 200}}
    }

    Image{
        id: financiacion
        source: "qrc:/financiacion.png"
        x: 258
        y: 32
        Behavior on opacity {NumberAnimation {duration: 200}}
    }

    Image{
        id: back
        source: "qrc:/back.png"
        x: 14
        y: 40
        Behavior on opacity {NumberAnimation {duration: 200}}
        MouseArea{
            anchors.fill: parent
            onClicked: {
                // reset all game cards
                blanco.state = "small"
                lobos.state = "small"
            }
        }
        z: (root.state === "gameselected") ? 2 : 0
    }

    TestGameCard{
        id: blanco
        x: 58
        y: 215
        name: "BLANCO"
        type: "Roles Ocultos"
        time: 15
        minPeople: 4
        maxPeople: 15
        difficulty: 1
        onStateChanged: {
            if(state === "medium" || state === "big"){
                root.state = "gameselected"
            }else{
                root.state = "default"
            }
        }
    }

    TestGameCard{
        id: lobos
        x: 58
        y: 475
        name: "LOS LOBOS"
        type: "Roles Ocultos"
        time: 45
        minPeople: 4
        maxPeople: 15
        difficulty: 2
        onStateChanged: {
            if(state === "medium" || state === "big"){
                root.state = "gameselected"
            }else{
                root.state = "default"
            }
        }
    }

    states: [
        State {
            name: "default"
            PropertyChanges {
                target: back
                opacity: 0
            }
        },
        State {
            name: "gameselected"
            PropertyChanges {
                target: malvavisco
                opacity: 0
            }
            PropertyChanges {
                target: games
                opacity: 0
            }
            PropertyChanges {
                target: group57
                opacity: 0
            }
            PropertyChanges {
                target: financiacion
                opacity: 0
            }
        }
    ]

}
