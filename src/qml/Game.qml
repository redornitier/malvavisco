import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "blanco"

Item{
    // propiedades dinamicas
    property var model
    property string animal: ""
    property string name: ""
    property string type: ""
    property int difficulty: 0
    property int time: 0
    property int minPeople: 0
    property int maxPeople: 0


    id: root
    width: 242
    height: 246
    clip: true
    Behavior on width {NumberAnimation {duration: 200}}
    Behavior on height {NumberAnimation {duration: 200}}
    Behavior on x {NumberAnimation {duration: 200}}
    Behavior on y {NumberAnimation {duration: 200}}

    Rectangle{
        id: baseRect
        x:23
        y:35
        width: 205
        height: 184
        color: "#cbccff"
        radius: 7
        Behavior on width {NumberAnimation {duration: 200}}
        Behavior on height {NumberAnimation {duration: 200}}
        Behavior on radius {NumberAnimation {duration: 200}}
        Behavior on x {NumberAnimation {duration: 200}}
        Behavior on y {NumberAnimation {duration: 200}}
    }

    Text{
        id: name
        font.family: monofett.name
        text: root.name
        y: 75+2
        x: 23 + 12
        font.pixelSize: 32
        color: "#223784"
        Behavior on x {NumberAnimation {duration: 200}}
        Behavior on y {NumberAnimation {duration: 200}}
    }

    Text{
        id: type
        font.family: hind.name
        text: root.type
        y: 75+33
        x: 23 + 12
        font.pixelSize: 16
        color: "#223784"
        Behavior on x {NumberAnimation {duration: 200}}
        Behavior on y {NumberAnimation {duration: 200}}
    }

    Text{
        id: difficultyText
        font.family: hind.name
        text: "Dificultad"
        y: 75 + 70
        x: 23 + 12
        font.pixelSize: 16
        color: "#223784"
        Behavior on x {NumberAnimation {duration: 200}}
        Behavior on y {NumberAnimation {duration: 200}}
    }

    Image{
        id: difficultyIcon
        x: 23 + 90
        y: 75 + 75
        source: {
            if(root.difficulty === 5){
                "qrc:/image/Property 1=level_5.png"
            }else if(root.difficulty === 4){
                "qrc:/image/Property 1=level_4.png"
            }else if(root.difficulty === 3){
                "qrc:/image/Property 1=level_3.png"
            }else if(root.difficulty === 2){
                "qrc:/image/Property 1=level_2.png"
            }else if(root.difficulty === 1){
                "qrc:/image/Property 1=level_1.png"
            }else{
                "qrc:/image/Property 1=Default.png"
            }
        }
        Behavior on x {NumberAnimation {duration: 200}}
        Behavior on y {NumberAnimation {duration: 200}}
    }

    Image{
        id: timeIcon
        source: "qrc:/image/tabler_clock-filled.png"
        x: 23 + 12
        y: 75 + 111
        Behavior on x {NumberAnimation {duration: 200}}
        Behavior on y {NumberAnimation {duration: 200}}
    }

    Text{
        id: timeText
        font.family: hind.name
        text: root.time + "min"
        y: 75 + 107
        x: 23 + 29
        font.pixelSize: 16
        color: "#223784"
        Behavior on x {NumberAnimation {duration: 200}}
        Behavior on y {NumberAnimation {duration: 200}}
    }

    Image{
        id: peopleIcon
        source: "qrc:/image/fluent_person-16-filled.png"
        x: 23 + 130
        y: 75 + 110
        Behavior on x {NumberAnimation {duration: 200}}
        Behavior on y {NumberAnimation {duration: 200}}
    }

    Text{
        id: peopleText
        font.family: hind.name
        text: root.minPeople + "-" + root.maxPeople
        y: 75 + 107
        x: 23 + 147
        font.pixelSize: 16
        color: "#223784"
        Behavior on x {NumberAnimation {duration: 200}}
        Behavior on y {NumberAnimation {duration: 200}}
    }

    Image{
        id: path
        source: "qrc:/image/path.png"
        x: 19
        y: 227
        width: 311
        height: 8
        transformOrigin: Item.TopLeft
        Behavior on opacity {NumberAnimation {duration: 200}}
        Behavior on x {NumberAnimation {duration: 200}}
        Behavior on y {NumberAnimation {duration: 200}}
        Behavior on scale {NumberAnimation {duration: 200}}
    }

    MouseArea{
        anchors.fill: parent
        onClicked: {
            if(root.state == "small")
                root.state = "medium"
        }
    }

    Image{
        id: favourite
        property bool favorited: false
        source: "qrc:/image/Vector.png"
        x: 197
        y: 45
        transformOrigin: Item.TopLeft
        Behavior on scale {NumberAnimation {duration: 200}}
        Behavior on x {NumberAnimation {duration: 200}}
        Behavior on y {NumberAnimation {duration: 200}}
        ColorOverlay {
            id: colorOverlay
            anchors.fill: parent
            source: parent
            color: "#FF83A1"
            scale: favourite.favorited ? 1 : 0
            opacity: favourite.favorited ? 1 : 0
            Behavior on opacity {NumberAnimation {duration: 100}}
            Behavior on scale {NumberAnimation {duration: 100}}
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                if(favourite.favorited)
                    favourite.favorited = 0
                else
                    favourite.favorited = 1
            }
        }
    }

    Item{
        id: carrusel
        width: 297
        height: 360
        x: 29
        y: 287
        opacity: 0
        clip: true
        Behavior on opacity {NumberAnimation {duration: 200}}
        SwipeView {
            id: view

            currentIndex: 0
            width: 297
            height: 260

            Repeater {
                model: root.model ? root.model.description.length : 0
                CarruselElementTemplate{
                    id: firstPage
                    text: root.model.description[index].first
                    image: root.model.description[index].second
                }
            }
        }
        PageIndicator {
            id: indicator

            count: view.count
            currentIndex: view.currentIndex

            anchors.horizontalCenter: view.horizontalCenter
            y: 299
            delegate: Rectangle {
                    implicitWidth: 5
                    implicitHeight: 5

                    radius: width / 2
                    color: index === indicator.currentIndex ? "#FF83A1" : "#FFFFFF"


                    Behavior on color {
                        ColorAnimation {
                            duration: 100
                        }
                    }
                }
        }
    }

    Image{
        id: play
        source: "qrc:/image/play.png"
        x: 100
        y: 663
        z: 1
        opacity: 0
        //Behavior on opacity {NumberAnimation {duration: 200}}
        MouseArea{
            anchors.fill: parent
            onClicked: {
                root.state = "big"
            }
        }
    }

    Blanco_Page{ // hay que parametrizar qué juego se carga
        id: gamePage
        width: parent.width
        height: parent.height
        opacity: 0
        Behavior on opacity {NumberAnimation {duration: 200}}
    }

    state: "small"
    states: [
        State {
            name: "small"
            PropertyChanges {
                target: path
                opacity: 0
            }
            PropertyChanges {
                target: favourite
                scale: 0.625
            }
        },
        State {
            name: "medium"
            PropertyChanges {
                target: baseRect
                x: 3
                y: 67
                width: 347
                height: 620
                radius: 13
            }
            PropertyChanges {
                target: root
                width: 355
                height: 687 + 25
                x: 19
                y: 90
                z: 1
            }
            PropertyChanges {
                target: favourite
                x: 297+4
                y: 78+6
            }
            PropertyChanges {
                target: name
                x: 17
                y: 119
            }
            PropertyChanges {
                target: type
                x: 17
                y: 150
            }
            PropertyChanges {
                target: difficultyText
                x: 17
                y: 183
            }
            PropertyChanges {
                target: difficultyIcon
                x: 98
                y: 188
            }
            PropertyChanges {
                target: timeIcon
                x: 224
                y: 186
            }
            PropertyChanges {
                target: timeText
                x: 241
                y: 182
            }
            PropertyChanges {
                target: peopleIcon
                x: 288
                y: 185
            }
            PropertyChanges {
                target: peopleText
                x: 305
                y: 182
            }
            PropertyChanges {
                target: play
                opacity: 1
            }
            PropertyChanges {
                target: carrusel
                opacity: 1
            }
        },
        State {
            name: "big"
            PropertyChanges {
                target: baseRect
                x: 0
                y: 0
                width: 390
                height: 844
                radius: 0
            }
            PropertyChanges {
                target: root
                width: 390
                height: 844
                x: 0
                y: 0
                z: 1
            }
            PropertyChanges {
                target: favourite
                opacity: 0
            }
            PropertyChanges {
                target: name
                x: 139
                y: 40
            }
            PropertyChanges {
                target: path
                scale: 0.53
                x: 112
                y: 107
            }
            PropertyChanges {
                target: type
                x: 150
                y: 71
            }
            PropertyChanges {
                target: difficultyText
                opacity: 0
            }
            PropertyChanges {
                target: difficultyIcon
                opacity: 0
            }
            PropertyChanges {
                target: timeIcon
                opacity: 0
            }
            PropertyChanges {
                target: timeText
                opacity: 0
            }
            PropertyChanges {
                target: peopleIcon
                opacity: 0
            }
            PropertyChanges {
                target: peopleText
                opacity: 0
            }
            PropertyChanges {
                target: gamePage
                opacity: 1
            }
        }

    ]
}
