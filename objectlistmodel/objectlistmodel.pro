TEMPLATE = app

QT += gui qml quick
CONFIG += c++11

SOURCES += main.cpp \
           dataobject.cpp

HEADERS += dataobject.h

RESOURCES += objectlistmodel.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)
