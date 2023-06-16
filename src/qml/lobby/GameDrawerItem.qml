import QtQuick 2.15
import Malvavisco 1.0

Rectangle {
    border.color: "black"
    radius: 20

    color: "white"

    width: 480/2
    height: 960/2
    Component{
        id: aux
        CardView{
            width: Common.appWidth
            height: Common.appHeight
        }
    }

    MouseArea{
        anchors.fill: parent
        onClicked: Common.stackView.push(aux)
    }
//    Component.onCompleted: print("parent", parent)
}
