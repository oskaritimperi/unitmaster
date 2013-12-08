import QtQuick 2.0
import QtTest 1.0

import "../harbour-unitmaster/qml/pages"

TestCase {
    name: "TemperatureModelTest"

    TemperatureModel {
        id: model
    }

    function test_to_data() {
        return [
                    { to: "celcius", value: 50, res: 50-273.15 },
                    { to: "celcius", value: 0, res: -273.15 },
                    { to: "fahrenheit", value: 100, res: 100*9/5-459.67 },
                    { to: "rankine", value: 1, res: 1*9/5 }
        ];
    }

    function test_to(data) {
        var result = model.to(data.to, data.value);
        compare(result, data.res);
    }

    function test_from_data() {
        return [
                    { from: "celcius", value: 1, res: 1+273.15 },
                    { from: "fahrenheit", value: 1, res: (1+459.67)*5/9 },
                    { from: "rankine", value: 59, res: 59*5/9 }
        ];
    }

    function test_from(data) {
        var result = model.from(data.from, data.value);
        compare(result, data.res);
    }
}
