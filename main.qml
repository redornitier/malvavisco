import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15

Window {
    visible: true
    width: 480
    height: 960
    visibility: Qt.platform.os === "android" ? "FullScreen" : "Windowed"
    title: qsTr("Hello World")

    StackView{
        id: stack
        anchors.fill: parent
        initialItem: Home{
            stackView: stack
        }
    }

    onClosing: {
        if(stack.depth > 1){
            close.accepted = false
            stack.pop();
        }else{
            return;
        }
    }
}
