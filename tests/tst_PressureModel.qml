import QtQuick 2.0
import QtTest 1.0

import "../harbour-unitmaster/qml/pages"

TestCase {
    name: "PressureModelTest"

    PressureModel {
        id: model
    }

    function test_to_data() {
        return [
                    { to: "kilopascal", value: 1234, res: 1.234 },
                    { to: "bar", value: 1, res: 1e-5 },
                    { to: "millibar", value: 1, res: 0.01 },
                    { to: "pounds per square inch", value: 1, res: 1.450377e-4 },
                    { to: "technical atmosphere", value: 1, res: 1.0197e-5 },
                    { to: "standard atmosphere", value: 1, res: 9.8692e-6 },
                    { to: "torr", value: 1, res: 7.5006e-3 }
        ];
    }

    function test_to(data) {
        var result = model.to(data.to, data.value);
        compare(result, data.res);
    }

    function test_from_data() {
        return [
                    { from: "kilopascal", value: 1, res: 1000 },
                    { from: "bar", value: 1, res: 1e5 },
                    { from: "millibar", value: 1, res: 100 },
                    { from: "pounds per square inch", value: 1, res: 6.8948e3 },
                    { from: "technical atmosphere", value: 1, res: 0.980665e5 },
                    { from: "standard atmosphere", value: 1, res: 1.01325e5 },
                    { from: "torr", value: 1, res: 133.3224 }
        ];
    }

    function test_from(data) {
        var result = model.from(data.from, data.value);
        compare(result, data.res);
    }
}
