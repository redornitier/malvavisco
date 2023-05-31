import QtQuick 2.15
import QtQml.Models 2.15
import Malvavisco 1.0

Rectangle {
    id: root
    color: Common.col
    width: 670
    height: 1191
    property int numberOfWorldItems: 0
    Image{
        anchors.fill: parent
        source: "qrc:/grid2.png"
    }
//    WorldItem{
//        id: rect
//        anchors.centerIn: parent
//    }

    ListModel {id: worldItemModel}

    Repeater{
//        asynchronous: true
        model: worldItemModel
//        onObjectAdded: print("add")
        delegate: GameDrawerItem {
            x: model.posX
            y: model.posY
        }
    }

    Component.onCompleted: {
        root.numberOfWorldItems = calculateRectangles(root.width, root.height, 120, 192, 30)
        print(root.numberOfWorldItems)
        for(var i = 0; i < root.numberOfWorldItems; i++){
            var pos = calculatePosition(i, root.width, 120, 192, 30)
//            print("position for", i, pos.x, pos.y)
            worldItemModel.append({'posX': pos.x, 'posY': pos.y})
        }
    }

    function calculateRectangles(parentWidth, parentHeight, childWidth, childHeight, spacing) {
        let adjustedChildWidth = childWidth + spacing;
        let adjustedChildHeight = childHeight + spacing;

        let countWidth = Math.floor(parentWidth / adjustedChildWidth);
        let countHeight = Math.floor(parentHeight / adjustedChildHeight);

        return countWidth * countHeight;
    }

    function calculatePosition(index, parentWidth, childWidth, childHeight, spacing) {
        let adjustedChildWidth = childWidth + spacing;
        let adjustedChildHeight = childHeight + spacing;

        let countWidth = Math.floor(parentWidth / adjustedChildWidth);

        let row = Math.floor(index / countWidth);
        let col = index % countWidth;

        let x = col * adjustedChildWidth;
        let y = row * adjustedChildHeight;

        return { x, y };
    }
}
