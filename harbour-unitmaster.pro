# The name of your app.
# NOTICE: name defined in TARGET has a corresponding QML filename.
#         If name defined in TARGET is changed, following needs to be
#         done to match new name:
#         - corresponding QML filename must be changed
#         - desktop icon filename must be changed
#         - desktop filename must be changed
#         - icon definition filename in desktop file must be changed
TARGET = harbour-unitmaster

QT += quick qml

target.path = /usr/bin

qml.files = qml
qml.path = /usr/share/$${TARGET}

desktop.files = $${TARGET}.desktop
desktop.path = /usr/share/applications

icon.files = $${TARGET}.png
icon.path = /usr/share/icons/hicolor/86x86/apps

INSTALLS += target qml desktop icon

CONFIG += link_pkgconfig
PKGCONFIG += sailfishapp
INCLUDEPATH += /usr/include/sailfishapp

OTHER_FILES += $$files(rpm/*) \
    qml/pages/AboutPage.qml

#CONFIG += sailfishapp

SOURCES += src/unitmaster.cpp

OTHER_FILES += \
    qml/pages/QuantityModel.qml \
    qml/pages/MassModel.qml \
    qml/pages/SelectQuantityPage.qml \
    qml/pages/QuantityPage.qml \
    qml/pages/helpers.js \
    qml/pages/LengthModel.qml \
    qml/pages/TemperatureModel.qml \
    harbour-unitmaster.desktop \
    qml/harbour-unitmaster.qml \
    rpm/harbour-unitmaster.yaml \
    rpm/harbour-unitmaster.spec

