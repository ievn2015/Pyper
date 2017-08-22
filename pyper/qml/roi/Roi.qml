import QtQuick 2.3
import QtQuick.Controls 1.2

Item {
    property bool isActive
    property bool isDrawn

    signal released(real xPosition, real yPosition)
    signal pressed(real xPosition, real yPosition)
    signal dragged(real xPosition, real yPosition)

    onPressed: {
        if (isActive) {
            setRoiPosition(xPosition, yPosition);
            drawRoi();
        }
    }
    onDragged: {
        if (isActive) {
            expandRoi(xPosition, yPosition)
        }
    }

    function drawRoi() {
        roi.visible = true;
        isDrawn = true;
    }
    function eraseRoi() {
        roi.visible = false;
        isDrawn = false;
    }

    MouseArea {
        id: behavior
        anchors.fill: parent

        onReleased: { parent.released(mouse.x, mouse.y) }
        onPressed: { parent.pressed(mouse.x, mouse.y) }
        onPositionChanged: { parent.dragged(mouse.x, mouse.y) }
    }
}