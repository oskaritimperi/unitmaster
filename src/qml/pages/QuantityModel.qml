import QtQuick 2.0

ListModel {
    ListElement {
        title: "mass"
        model: "MassModel.qml"
    }

    ListElement {
        title: "length"
        model: "LengthModel.qml"
    }

    ListElement {
        title: "temperature"
        model: "TemperatureModel.qml"
    }

//    ListElement {
//        title: "time"
//        model: "TimeModel.qml"
//    }

//    ListElement {
//        title: "current"
//        model: "CurrentModel.qml"
//    }

    ListElement {
        title: "area"
        model: "AreaModel.qml"
    }

    ListElement {
        title: "angle"
        model: "AngleModel.qml"
    }

    ListElement {
        title: "pressure"
        model: "PressureModel.qml"
    }
}
