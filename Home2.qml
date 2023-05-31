import QtQuick 2.15
import QtQuick.Controls 2.15

Rectangle {
    id: root
    color: "#3366cc"


    Flickable{
        clip: true
        width: parent.width
        height: parent.height
        contentWidth: 670; contentHeight: 1191;
        contentX: 95 // los pixeles que sobran / 2
        contentY: 115 // los pixeles que sobran / 2
        GameWorld{
//            anchors.centerIn: parent
        }
    }
}

