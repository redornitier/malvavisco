import QtQuick 2.15
import Malvavisco 1.0

Rectangle {
    border.color: "black"
    radius: 20

    color: "white"

    width: 480/4
    height: 960/5
    Component{
        id: aux
        CardView{
            width: Common.appWidth
            height: Common.appHeight
        }
    }

    MouseArea{
        anchors.fill: parent
        onClicked: print(index)
        //onClicked: Common.stackView.push(aux)
        //onClicked: Common.stackView.push({item: aux, inmediate: true})
    }
//    Component.onCompleted: print("parent", parent)
}
