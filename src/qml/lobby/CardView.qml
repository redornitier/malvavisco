import QtQuick 2.15

Rectangle {
    color: "black"

    Rectangle{
        width: parent.width * 0.7
        height: parent.height * 0.7
        color: "white"
        radius: 50
        anchors.centerIn: parent
    }

    Rectangle{
        width: parent.width * 0.7
        height: parent.height * 0.7
        color: "white"
        radius: 50
        anchors.centerIn: parent
    }

    Rectangle{
        width: parent.width * 0.7
        height: parent.height * 0.7
        color: "white"
        radius: 50
        anchors.centerIn: parent
    }

    MouseArea {
anchors.fill: parent
                preventStealing: true
                property real velocity: 0.0
                property int xStart: 0
                property int xPrev: 0
                property bool tracing: false
                onPressed: {
                    xStart = mouse.x
                    xPrev = mouse.x
                    velocity = 0
                    tracing = true
                    console.log( " pressed  "+xStart)
                    console.log( " pressed  "+xPrev)
                }
                onPositionChanged: {
                    if ( !tracing ) return
                    var currVel = (mouse.x-xPrev)
                    velocity = (velocity + currVel)/2.0
                    xPrev = mouse.x
                    if ( velocity > 15 && mouse.x > parent.width*0.2 ) {
                        tracing = false
                        console.log( " positioned  ")
                        // SWIPE DETECTED !! EMIT SIGNAL or DO your action
                    }
                }
                onReleased: {
                    tracing = false
                    if ( velocity > 15 && mouse.x > parent.width*0.2 ) {
                        // SWIPE DETECTED !! EMIT SIGNAL or DO your action
                        console.log("abcccccccccc")
                    }
                }
            }


}
