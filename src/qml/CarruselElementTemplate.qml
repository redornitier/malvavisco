import QtQuick 2.15

Rectangle {
    property string text: "queso"
    property string image: ""
    id: root
    width: 297
    height: 260
    color: "transparent"
    Rectangle{

        color:"transparent"
        width: parent.width
        height: 41
        Text{
            text: root.text
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
            font.family: hind.name
            font.pixelSize: 16
            color: "#223784"
        }
    }
    Rectangle{
        color:"transparent"
        y: 41
        width: parent.width
        height: 260 - 41
        Image{
            source: root.image
            anchors.centerIn: parent
        }
    }
}
