import QtQuick
import QtQuick.Controls

Item {
    Text{
        text: "Escoged el modo de juego que prefiráis\n(Si sois nuev@s no cambiéis nada)"
        x: 27
        y: 221
        width: 341
        height: 50
        font.family: hind.name
        font.pixelSize: 16
        color: "#5B63B7"
        horizontalAlignment: Text.AlignHCenter
    }

    Text{
        text: "Número de blancos en juego visible"
        x: 48
        y: 440
        width: 311
        height: 25
        font.family: hind.name
        font.pixelSize: 15
        color: "#5B63B7"
        horizontalAlignment: Text.AlignLeft
    }

    Text{
        text: "Número de blancos"
        x: 48
        y: 480
        width: 311
        height: 25
        font.family: hind.name
        font.pixelSize: 15
        color: "#5B63B7"
        horizontalAlignment: Text.AlignLeft
    }

    Text{
        text: "Temporizador para la discusión"
        x: 48
        y: 520
        width: 311
        height: 25
        font.family: hind.name
        font.pixelSize: 15
        color: "#5B63B7"
        horizontalAlignment: Text.AlignLeft
    }

    Item{
        id: switchContainer
        width: 40
        height: 19
        x: 306
        y: 440
        Switch {
            id: control
            anchors.fill: parent
            checked: true

            indicator: Rectangle {
                implicitWidth: switchContainer.width
                implicitHeight: switchContainer.height
                x: 0
                y: parent.height / 2 - height / 2
                radius: 13
                color: control.checked ? "#223784" : "#D9D9D9"
                Behavior on color {ColorAnimation {duration: 200; easing.type: Easing.OutCirc}}

                Rectangle {
                    x: control.checked ? parent.width - width : 0
                    width: parent.width/2
                    height: parent.height
                    radius: 13
                    color: control.checked ? "#5B63B7" : "#8E8DB9"
                    border.color: control.checked ? "#223784" : "#cccccc"
                    border.width: 2
                    Behavior on x {NumberAnimation {duration: 200; easing.type: Easing.OutCirc}}
                    Behavior on border.color {ColorAnimation {duration: 200; easing.type: Easing.OutCirc}}
                    Behavior on color {ColorAnimation {duration: 200; easing.type: Easing.OutCirc}}
                }
            }
        }
    }

    Item{
        width: 40
        height: 19
        x: 306
        y: 480
        SpinBox {
            anchors.fill: parent
            to: BlancoModel.maxPeople
            from: 1
            value: 1
            font.pixelSize: 10
        }
    }

    Item{
        id: switchContainer3
        width: 40
        height: 19
        x: 306
        y: 520
        Switch {
            id: control3
            anchors.fill: parent
            checked: false

            indicator: Rectangle {
                implicitWidth: switchContainer3.width
                implicitHeight: switchContainer3.height
                x: 0
                y: parent.height / 2 - height / 2
                radius: 13
                color: control3.checked ? "#223784" : "#D9D9D9"
                Behavior on color {ColorAnimation {duration: 200; easing.type: Easing.OutCirc}}

                Rectangle {
                    x: control3.checked ? parent.width - width : 0
                    width: parent.width/2
                    height: parent.height
                    radius: 13
                    color: control3.checked ? "#5B63B7" : "#8E8DB9"
                    border.color: control3.checked ? "#223784" : "#cccccc"
                    border.width: 2
                    Behavior on x {NumberAnimation {duration: 200; easing.type: Easing.OutCirc}}
                    Behavior on border.color {ColorAnimation {duration: 200; easing.type: Easing.OutCirc}}
                    Behavior on color {ColorAnimation {duration: 200; easing.type: Easing.OutCirc}}
                }
            }
        }
    }
}
