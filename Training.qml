import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    id: root
    anchors.fill: parent

    SwipeView {
        id: swipeView

        currentIndex: 0
        anchors.fill: parent

        Rectangle {
            id: page1
            color: "red"
            Text{
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 20
                text: "Page 1"
                font.pixelSize: 50
            }
        }
        Rectangle {
            id: page2
            color: "green"
            Text{
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 20
                text: "Page 2"
                font.pixelSize: 50
            }
        }
        Rectangle {
            id: page3
            color: "blue"
            Text{
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.top: parent.top
                anchors.topMargin: 20
                text: "Page 3"
                font.pixelSize: 50
            }
            Button{
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 100
                text: "Next"
                onReleased: root.destroy()
            }
        }
    }

    PageIndicator {
        id: indicator

        count: swipeView.count
        currentIndex: swipeView.currentIndex

        anchors.bottom: swipeView.bottom
        anchors.horizontalCenter: parent.horizontalCenter
    }
}
