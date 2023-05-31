#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include "blancocontroller.h"
#include <QQmlEngine>
#include <QList>
#include <algorithm>
#include <random>
int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    qmlRegisterType<BlancoController>("BlancoController", 1,0, "BlancoController");
    qmlRegisterSingletonType(QUrl("qrc:/Common.qml"), "Malvavisco", 1, 0, "Common");

    QQmlApplicationEngine engine;
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
