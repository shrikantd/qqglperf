#include <QtGui>
#include "window.h"

int main(int argc, char **argv)
{
    QGuiApplication app(argc, argv);

    Window w;
    w.showFullScreen();

    return app.exec();
}
