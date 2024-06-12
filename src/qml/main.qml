import QtQuick
import QtQuick.Window
import QtQuick.Controls

Window {
    id: wndw
    visible: true
    width: Common.appWidth
    height: Common.appHeight
    title: qsTr("Malvavis.co.")

    FontLoader {id: monofett; source: "fonts/Monofett-Regular.ttf"}
    FontLoader {id: jua; source: "qrc:/fonts/Jua-Regular.ttf"}
    FontLoader {id: hind; source: "qrc:/fonts/Hind-Regular.ttf"}

    GamesBox{
        id: gameBox
        width: 390
        height: 844
        transform: Scale {
            origin.x: 0
            origin.y: 0
            xScale: Qt.platform.os === "android" ? wndw.width/gameBox.width : 1
            yScale: Qt.platform.os === "android" ? wndw.height/gameBox.height : 1
        }
    }
}

