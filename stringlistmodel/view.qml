import QtQuick 2.6
import QtQuick.Window 2.0

Window {
    id: rootWindow

    width: 500;
    height: 500;

    property var stTime;
    property int fCount: 0;
    visible: true;

    ListView {
        FontLoader {
            id: hv; source: "qrc:/HelveticaNeueRegularAtieva.ttf"
        }

        anchors.fill: parent;
        width: parent.width;
        height: parent.height;

        model: strModel

        delegate: Rectangle {
            height: txtElem.implicitHeight
            width: 100
            Text {
                id: txtElem
                text: modelData
                font.pixelSize: 29
                font.family: hv.name
            }
        }
    }

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
        //rootWindow.showFullScreen();
        stTime = new Date().getTime();
    }
}
