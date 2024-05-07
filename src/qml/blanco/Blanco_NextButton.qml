import QtQuick 2.15

Rectangle{
    radius: 41
    color: BlancoModel.nextButtonColor
    Text{
        anchors.fill: parent
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        text: BlancoModel.nextButtonTextValue
        color: "#F9F8FF"
        font.family: hind.name
        font.pixelSize: 16
    }
    MouseArea{
        anchors.fill: parent
        onClicked: BlancoController.nextButtonClick()
    }
}
