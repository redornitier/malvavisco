import QtQuick 2.15
import QtQuick.Controls 2.15
import BlancoController 1.0

Rectangle {
    id: root
    property StackView stackView
    color: "#3366cc"
    property Item gameSetUp: GameSetUp{
        stackView: root.stackView
    }

    Text{
        id: welcomeText
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: 20
        text: "Bienvenidas a la diversión"
        font.pixelSize: 30
    }

    Rectangle{
        id: filterArea
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: welcomeText.bottom
        anchors.topMargin: 10
        color: "light grey"
        width: parent.width * 0.9
        height: parent.height * 0.1
    }

    Rectangle{
        id: gameListArea
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: filterArea.bottom
        anchors.topMargin: 10
        color: "light grey"
        width: parent.width * 0.9
        height: parent.height

        ListModel {
            id: myModel
            ListElement {
                gameName: "Blanco"
                gameImageSource: "qrc:/res/barrywhite.jpg"
                gameDescription: "Miente para que no sepan que no tienes ni idea. Ya tienes práctica, ¿no?"
            }
            ListElement {
                gameName: "Lobos"
                gameImageSource: "qrc:/res/lobo-como-oveja.jpg"
                gameDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
            }
            ListElement {
                gameName: "Mímica"
                gameImageSource: "qrc:/res/charades.jpg"
                gameDescription: "Lorem ipsum dolor sit amet, consectetur adipiscing elit"
            }
            ListElement {
                gameName: "--"
                gameImageSource: ""
                gameDescription: "--"
            }
            ListElement {
                gameName: "--"
                gameImageSource: ""
                gameDescription: "--"
            }
        }

        GridView{
            id: grid
            anchors.fill: parent
            cellWidth: grid.width / 2; cellHeight: 300
            delegate: Item{
                width: grid.cellWidth
                height: grid.cellHeight
                Rectangle{
                    id: rect
                    anchors.centerIn: parent
                    radius: 10
                    border.color: "black"
                    border.width: 0
                    color: "white"
                    width: grid.cellWidth * 0.9
                    height: grid.cellHeight * 0.9
                    clip: true
                    Column{

                        Item{
                            width: rect.width
                            height: rect.height * 0.2
                            Label{
                                anchors.fill: parent
                                anchors.margins: 15
                                text: gameName
                            }
                        }

                        Item{
                            width: parent.width
                            height: parent.height * 0.4
                            clip: true
                            Image{
                                anchors.fill: parent
                                source: gameImageSource
                                fillMode: Image.PreserveAspectCrop
                            }
                        }

                        Item{
                            width: parent.width
                            height: parent.height * 0.4
                            Label{
                                anchors.margins:  15
                                anchors.fill: parent
                                text: gameDescription
                                wrapMode: Text.Wrap
                                horizontalAlignment: Text.AlignLeft
                            }
                        }
                    }

                    MouseArea{
                        anchors.fill: parent
                        onReleased: {
                            if(index === 0){
                                stackView.push(gameSetUp)
                            }
                        }
                    }
                }
            }
            model: myModel
        }
    }
}

