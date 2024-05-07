import QtQuick 2.15

Item {

    Blanco_AddPlayers{
        id: addPlayers
        opacity: 0
    }

    Blanco_Settings{
        id: settings
        opacity: 0
    }

    Blanco_WordAssign{
        id: wordAssing
        opacity: 0
    }

    Rectangle{
        id: nextButton
        width: 153
        height: 50
        x: 119
        y: 752
        radius: 41
        color: "#6E75CB"
        Text{
            anchors.fill: parent
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignHCenter
            text: "SIGUIENTE"
            color: "#F9F8FF"
            font.family: hind.name
            font.pixelSize: 16
        }
        MouseArea{
            anchors.fill: parent
            onClicked: BlancoController.nextButtonClick()
        }
    }

    state: BlancoModel.blancoState
    states:[
        State {
            name: "AddPlayers"
            PropertyChanges {
                target: addPlayers
                opacity: 1
            }
        },
        State {
            name: "Settings"
            PropertyChanges {
                target: settings
                opacity: 1
            }
        },
        State {
            name: "WordAssign"
            PropertyChanges {
                target: wordAssing
                opacity: 1
            }
        }
    ]
}
