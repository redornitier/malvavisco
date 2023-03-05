import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    visible: true
    width: 480
    height: 960
    visibility: Qt.platform.os === "android" ? "FullScreen" : "Windowed"
    title: qsTr("Hello World")
    color: "#3366cc"

    Button{
        anchors.centerIn: parent
        text: "GO"
        font.pixelSize: 70
        font.bold: true
        width: parent.width * 0.5
        height: parent.height * 0.1
        onClicked: addPlayers.visible = true
    }
    AddPlayers{
        id: addPlayers
        anchors.fill: parent
        visible: false
    }

    Component.onCompleted: {
        print("OS", Qt.platform.os)
    }
}
