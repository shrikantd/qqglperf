TEMPLATE = app

QT += gui widgets
CONFIG += c++11

SOURCES += main.cpp \
            glwidget.cpp \
            mainwindow.cpp \
            bubble.cpp
            
HEADERS +=  glwidget.h \
            mainwindow.h \
            bubble.h

RESOURCES += texture.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
unix:!android {
    isEmpty(target.path) {
        qnx {
            target.path = /tmp/$${TARGET}/bin
        } else {
            target.path = /opt/$${TARGET}/bin
        }
        export(target.path)
    }
    INSTALLS += target
}
