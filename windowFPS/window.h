#ifndef WINDOW_H
#define WINDOW_H

#include <QWindow>
#include <QElapsedTimer>

class Window : public QWindow
{
    Q_OBJECT

public:
    Window();

    void exposeEvent(QExposeEvent *) Q_DECL_OVERRIDE;

    bool event(QEvent *e) Q_DECL_OVERRIDE;

    void render();

private:
    QOpenGLContext *gl;
    QElapsedTimer timer;
    int frameCount;
};

#endif // WINDOW_H
