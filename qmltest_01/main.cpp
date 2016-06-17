#include <QGuiApplication>
#include <QQmlApplicationEngine>

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/rectangle_anim.qml")));
    //engine.load(QUrl(QStringLiteral("qrc:/window_anim.qml")));
    //engine.load(QUrl(QStringLiteral("qrc:/window_swp.qml")));

    return app.exec();
}
