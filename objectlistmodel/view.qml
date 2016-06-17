/****************************************************************************
**
** Copyright (C) 2015 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the examples of the Qt Toolkit.
**
** $QT_BEGIN_LICENSE:BSD$
** You may use this file under the terms of the BSD license as follows:
**
** "Redistribution and use in source and binary forms, with or without
** modification, are permitted provided that the following conditions are
** met:
**   * Redistributions of source code must retain the above copyright
**     notice, this list of conditions and the following disclaimer.
**   * Redistributions in binary form must reproduce the above copyright
**     notice, this list of conditions and the following disclaimer in
**     the documentation and/or other materials provided with the
**     distribution.
**   * Neither the name of The Qt Company Ltd nor the names of its
**     contributors may be used to endorse or promote products derived
**     from this software without specific prior written permission.
**
**
** THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
** "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
** LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
** A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
** OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
** SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
** LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
** DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
** THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
** (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
** OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE."
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.5
import QtQuick.Window 2.0

Window {
    id: rootWindow

    width: 500;
    height: 500;

    property int idxInc: 0;
    property var stTime;
    property int fCount: 0;
    visible: true;

    property real t;
    NumberAnimation on t {id: numAnim; from: 0; to: 1000; duration: 1000; loops: Animation.Infinite }
    onTChanged: {
        lstView.currentIndex += idxInc;
        lstView.positionViewAtIndex(lstView.currentIndex + idxInc, ListView.Beginning )
    }

    ListView {
        id: lstView

        FontLoader {
            id: hv; source: "qrc:/HelveticaNeueRegularAtieva.ttf"
        }

        anchors.left: parent.left;
        anchors.top: parent.top;
        width: parent.width;
        height: parent.height;

        model: objModel

        delegate: Rectangle {
            height: childrenRect.height
            width: childrenRect.width

            color: model.modelData.color

            Image {
                id: carImg;
                anchors.left: parent.left;
                source: "qrc:/CarAva.png";
            }

            Text {
                id: txtElem
                anchors.left: carImg.right
                text: name
                font.pixelSize: 35
                font.family: hv.name
            }
        }
        onAtYBeginningChanged: {
            if (atYBeginning == true) {
                idxInc *= -1;
            }
        }
        onAtYEndChanged: {
            if (atYEnd == true) {
                idxInc *= -1;
            }
        }
    }

//    onFrameSwapped: {
//        ++fCount;
//        var totalRunningTime = new Date().getTime() - stTime;
//        if (totalRunningTime > 10000) {
//            print(fCount + " frames in " + totalRunningTime + " ms; "
//                  + fCount * 1000.0 / totalRunningTime + " fps, "
//                  + totalRunningTime / fCount + " ms/frame");

//            fCount = 0;
//            stTime = new Date().getTime();
//        }
//    }

    Component.onCompleted: {
        //rootWindow.showFullScreen();
        idxInc = height / lstView.currentItem.height;
        stTime = new Date().getTime();
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            if (numAnim.running) {
                numAnim.stop();
                mouse.accepted = true;
                visible = false;
            }
        }
    }
}
