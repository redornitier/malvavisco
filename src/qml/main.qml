import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls 1.4

Window {
    id: wndw
    visible: true
    width: Common.appWidth
    height: Common.appHeight
    visibility: Qt.platform.os === "android" ? "FullScreen" : "Windowed"
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
