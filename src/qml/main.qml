import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls 1.4

Window {
    visible: true
    width: Common.appWidth
    height: Common.appHeight
    visibility: Qt.platform.os === "android" ? "FullScreen" : "Windowed"
    title: qsTr("Hello World")

    FontLoader {id: monofett; source: "fonts/Monofett-Regular.ttf"}
    FontLoader {id: jua; source: "qrc:/fonts/Jua-Regular.ttf"}
    FontLoader {id: hind; source: "qrc:/fonts/Hind-Regular.ttf"}

    TestGameBox{}
}
