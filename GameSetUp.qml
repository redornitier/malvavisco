import QtQuick 2.15
import QtQuick.Controls 2.15
import BlancoController 1.0

Rectangle {
    color: "light blue"
    property StackView stackView

    property Item addPlayers: AddPlayers{
        stackView: root.stackView
    }
    BlancoController{
        id: controller
    } // todo: share the same instance between qmls

    Column{
        anchors.horizontalCenter: parent.horizontalCenter


        Label{
            id: gameName
            text: controller.gameName
        }
        Label{
            id: gameSimpleDescription
            text: controller.gameSimpleDescription
        }
        Label{
            id: detailedDescription
            text: controller.gameDetailedDescription
        }
        Label{
            id: gameMinPlayers
            text: controller.gameMinPlayers
        }
        Label{
            id: gameMaxPlayers
            text: controller.gameMaxPlayers
        }
        Label{
            id: gameEstimatedDuration
            text: controller.gameEstimatedDuration
        }
        Button{
            text: "Jogar"
            onClicked: stackView.push(addPlayers)
        }
    }
}
