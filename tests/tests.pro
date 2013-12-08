TEMPLATE = app

# The name of your app
TARGET = tst-harbour-unitmaster

CONFIG += qmltestcase

TARGETPATH = /usr/bin
target.path = $$TARGETPATH

DEPLOYMENT_PATH = /usr/share/$$TARGET
qml.path = $$DEPLOYMENT_PATH
qml.files = *.qml

extra.path = $$DEPLOYMENT_PATH
extra.files = runTestsOnDevice.sh

# defining QUICK_TEST_SOURCE_DIR here doesn't work QtCreator keeps injecting another definition to command line (from CONFIG += qmltestcase ?)
#DEFINES += QUICK_TEST_SOURCE_DIR=\"\\\"\"$${DEPLOYMENT_PATH}/\"\\\"\"
DEFINES += DEPLOYMENT_PATH=\"\\\"\"$${DEPLOYMENT_PATH}/\"\\\"\"

# C++ sources
SOURCES += main.cpp

INSTALLS += target qml extra

OTHER_FILES += \
    tst_MassModel.qml \
    tst_AngleModel.qml \
    tst_LengthModel.qml \
    tst_PressureModel.qml \
    tst_TemperatureModel.qml
