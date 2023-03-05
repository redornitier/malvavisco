import QtQuick 2.15
import QtQuick.Controls 2.15


Rectangle {
    id: root
    property StackView stackView
    color: "#3366cc"
    property Item addPlayers: AddPlayers{
        stackView: root.stackView
    }

    Button{
        anchors.centerIn: parent
        text: "GO"
        font.pixelSize: 70
        font.bold: true
        width: parent.width * 0.5
        height: parent.height * 0.1
        onClicked: stackView.push(addPlayers)
    }
}

