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

    Blanco_WordCalling{
        id: wordCalling
        opacity: 0
    }

    Blanco_Debate{
        id: debate
        opacity: 0
        enabled: false
    }

    Blanco_End{
        id: end
        opacity: 0
    }

    Blanco_NextButton{
        id: nextButton
        width: 153
        height: 50
        x: 119
        y: 752
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
        },
        State {
            name: "WordCalling"
            PropertyChanges {
                target: wordCalling
                opacity: 1
            }
        },
        State {
            name: "Debate"
            PropertyChanges {
                target: debate
                opacity: 1
                enabled: true
            }
        },
        State {
            name: "End"
            PropertyChanges {
                target: end
                opacity: 1
            }
        }
    ]
}
