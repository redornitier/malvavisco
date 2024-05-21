import QtQuick

Item {
    anchors.fill: parent
    property alias playerListModel: listModel

    Text{
        width: 250
        height: 52
        x: 71
        y: 224
        font.pixelSize: 16
        font.family: hind.name
        color: "#223784"
        text: "Introduce el nombre/alias/AKA de\nlas personas que van a jugar"
        horizontalAlignment: Text.AlignHCenter
    }

    ListModel {
        id: listModel
        // ListElement{playerName: ""}
    }

    ListView{
        width: 237
        height: 310
        x: 77
        y: 290
        model: listModel
        clip: true
        spacing: 10
        delegate: Rectangle{
            id: listRoot
            width: 237
            height: 41
            color: "white"
            radius: 23
            border.color: false ? "#D9D9D9" : "#223784"
            border.width: 2
            TextInput{
                id: txtInput
                anchors.fill: parent
                anchors.leftMargin: 15
                text: initialText
                maximumLength: 15
                onTextChanged: BlancoController.changePlayerNameByIndex(index, text)
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 16
                font.family: hind.name
                font.bold: true
            }
            Text{
                x: 200
                text: "x"
                width: 30
                height: parent.height
                font.family: hind.name
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.pixelSize: 25
                color: "#223784"
                MouseArea{
                    anchors.fill: parent
                    onClicked:{
                        BlancoController.removePlayerByIndex(index)
                        listModel.remove(index)
                    }
                }
            }
        }
    }

    Image{
        source: "qrc:/image/blanco/Group 16.png"
        x: 77 + 101
        y: 406 + 202
        MouseArea{
            anchors.fill: parent
            onClicked: {
                listModel.append({initialText: "Nuevo jugador"})
                BlancoController.addPlayerIndex()
            }
        }
    }

    Component.onCompleted: {
        for(var i = 0; i < BlancoModel.minPeople; i++){
            listModel.append({initialText: "Jugador " + (i+1)})
            BlancoController.addPlayerIndex()
            BlancoController.changePlayerNameByIndex(i, "Jugador " + i)
        }
    }
}
