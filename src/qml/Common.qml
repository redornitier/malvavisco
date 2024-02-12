pragma Singleton
import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls 1.4

Item {
    property int testProp1: 125
    property color col: "red"
    property StackView stackView
    property StackViewDelegate stackViewDelegate
    property int appWidth: 480
    property int appHeight: 960
}
