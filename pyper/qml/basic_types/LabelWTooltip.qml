import QtQuick 2.3
import QtQuick.Controls 1.2

import "../style"

Label {
    id: labelWTooltip
    width: 145
    height: 30
    property alias help: tooltip.tooltip
    property alias fontSize: labelWTooltip.font.pointSize

    color: theme.text
    text: "Label"
//        antialiasing: true
    ToolTip{
        id: tooltip
        tooltip: "No help yet"
        anchors.fill: parent
    }
}
