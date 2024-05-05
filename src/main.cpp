#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlEngine>
#include <QQmlContext>
#include "model/blancomodel.h"
#include "controller/blancocontroller.h"

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif
    QGuiApplication app(argc, argv);
    qmlRegisterSingletonType(QUrl("qrc:/Common.qml"), "Malvavisco", 1, 0, "Common");

    BlancoModel* blancoModel = new BlancoModel();
    blancoModel->init(":/json/blancoStatic.json");
    BlancoController *blancoController = new BlancoController();
    blancoController->setModel(blancoModel);

    QQmlApplicationEngine engine;
    engine.rootContext()->setContextProperty("BlancoModel", blancoModel);
    engine.rootContext()->setContextProperty("BlancoController", blancoController);
    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
