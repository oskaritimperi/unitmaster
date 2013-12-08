import QtQuick 2.0
import QtTest 1.0

import "../harbour-unitmaster/qml/pages"

TestCase {
    name: "AngleModelTest"

    AngleModel {
        id: model
    }

    function test_to_data() {
        return [
                    { to: 'degree', value: 1, res: 180.0/Math.PI },
                    { to: 'gon', value: 1, res: 200.0/Math.PI },
                    { to: 'arcminute', value: 1, res: 10800/Math.PI },
                    { to: 'arcsecond', value: 1, res: 648000/Math.PI }
        ];
    }

    function test_to(data) {
        var result = model.to(data.to, data.value);
        compare(result, data.res);
    }

    function test_from_data() {
        return [
                    { from: 'degree', value: 1, res: Math.PI/180.0 },
                    { from: 'gon', value: 1, res: Math.PI/200.0 },
                    { from: 'arcminute', value: 1, res: Math.PI/10800 },
                    { from: 'arcsecond', value: 1, res: Math.PI/648000 }
        ];
    }

    function test_from(data) {
        var result = model.from(data.from, data.value);
        compare(result, data.res);
    }
}
