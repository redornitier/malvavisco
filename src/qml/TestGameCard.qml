import QtQuick 2.15

Item{
    // propiedades dinamicas
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

    Image{
        id: favourite
        source: "qrc:/favourite_indicator.png"
        x: 197
        y: 45
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
                "qrc:/Property 1=level_5.png"
            }else if(root.difficulty === 4){
                "qrc:/Property 1=level_4.png"
            }else if(root.difficulty === 3){
                "qrc:/Property 1=level_3.png"
            }else if(root.difficulty === 2){
                "qrc:/Property 1=level_2.png"
            }else if(root.difficulty === 1){
                "qrc:/Property 1=level_1.png"
            }else{
                "qrc:/Property 1=Default.png"
            }
        }
        Behavior on x {NumberAnimation {duration: 200}}
        Behavior on y {NumberAnimation {duration: 200}}
    }

    Image{
        id: timeIcon
        source: "qrc:/tabler_clock-filled.png"
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
        source: "qrc:/fluent_person-16-filled.png"
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

    MouseArea{
        anchors.fill: parent
        onClicked: {
            if(root.state == "small")
                root.state = "big"
            else
                root.state = "small"
        }
    }

    state: "small"
    states: [
        State {
            name: "small"
        },
        State {
            name: "big"
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
                height: 687
                x: 19
                y: 90
                z: 1
            }
            PropertyChanges {
                target: favourite
                x: 297
                y: 78
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
        }

    ]
}
