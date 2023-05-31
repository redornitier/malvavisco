import QtQuick 2.15

Rectangle {
    border.color: "black"
    radius: 20

    color: "white"

    width: 480/4
    height: 960/5
    MouseArea{
        anchors.fill: parent
        onClicked: parent.color = "yellow"
    }
//    Component.onCompleted: print("parent", parent)
}
