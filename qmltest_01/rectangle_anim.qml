import QtQuick 2.5
import QtQuick.Window 2.0

Window {
    id: rootWindow

    property var stTime;
    property int fCount: 0;

    Rectangle {
        id: rect
        color: rootWindow.fCount % 2 == 0 ? "red" : "blue"
        anchors.fill: parent
    }

    property real t;
    NumberAnimation on t { from: 0; to: 1000; duration: 1000; loops: Animation.Infinite }
    onTChanged: {
        ++fCount;
        var totalRunningTime = new Date().getTime() - stTime;
        if (totalRunningTime > 10000) {
            print(fCount + " frames in " + totalRunningTime + " ms; "
                  + fCount * 1000.0 / totalRunningTime + " fps, "
                  + totalRunningTime / fCount + " ms/frame");
            Qt.quit();
        }
    }

    Component.onCompleted: {
        rootWindow.showFullScreen();
        stTime = new Date().getTime();
    }
}
