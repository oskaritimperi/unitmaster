#ifdef QT_QML_DEBUG
#include <QtQuick>
#endif

#include <sailfishapp.h>

#include "settings.h"

#define STRINGIFY(X) #X

int main(int argc, char *argv[])
{
    QCoreApplication::setOrganizationName("oswjk");
    QCoreApplication::setApplicationName("unitmaster");
    QCoreApplication::setApplicationVersion(STRINGIFY(UNITMASTER_VERSION));

    QGuiApplication *app = SailfishApp::application(argc, argv);
    QQuickView *view = SailfishApp::createView();

    Settings settings;
    view->rootContext()->setContextProperty("settings", &settings);

    view->setSource(SailfishApp::pathTo("qml/harbour-unitmaster.qml"));

    view->showFullScreen();

    return app->exec();
}

