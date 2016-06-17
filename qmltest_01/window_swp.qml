import QtQuick 2.5
import QtQuick.Window 2.0

Window {

    id: root

    property var stTime;
    property int fCount: 0;

    color: fCount % 2 == 0 ? "red" : "blue"

    onFrameSwapped: {
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
        root.showFullScreen();
        stTime = new Date().getTime();
    }
}
