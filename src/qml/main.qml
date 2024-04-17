import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Controls 1.4
import "qrc:/lobby"

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


/*
    StackView{
        id: stack
        anchors.fill: parent
        delegate: stackDelegate
        initialItem: Home2{
            //stackView: stack
        }
        Component.onCompleted: Common.stackView = stack
    }
    StackViewDelegate {
        id: stackDelegate
        function getTransition(properties)
        {
            //return (properties.enterItem.Stack.index % 2) ? horizontalTransition : verticalTransition
            return zoomInTransition
        }

        function transitionFinished(properties)
        {
            properties.exitItem.x = 0
            properties.exitItem.y = 0
        }

        property Component horizontalTransition: StackViewTransition {
            PropertyAnimation {
                target: enterItem
                property: "x"
                from: target.width
                to: 0
                duration: 300
            }
            PropertyAnimation {
                target: exitItem
                property: "x"
                from: 0
                to: target.width
                duration: 300
            }
        }

        property Component verticalTransition: StackViewTransition {
            PropertyAnimation {
                target: enterItem
                property: "y"
                from: target.height
                to: 0
                duration: 300
            }
            PropertyAnimation {
                target: exitItem
                property: "y"
                from: 0
                to: target.height
                duration: 300
            }
        }
        property Component zoomInTransition: StackViewTransition {
            PropertyAnimation {
                target: enterItem
                property: "scale"
                from: 0
                to: 1
                duration: 300
            }
        }
        Component.onCompleted: Common.stackViewDelegate = stackDelegate
    }

    onClosing: {
        if(stack.depth > 1){
            close.accepted = false
            stack.pop();
        }else{
            return;
        }
    }
    */
    //Training{}
}
