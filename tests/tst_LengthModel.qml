import QtQuick 2.0
import QtTest 1.0

import "../harbour-unitmaster/qml/pages"

TestCase {
    name: "LengthModelTest"

    LengthModel {
        id: model
    }

    function test_to_data() {
        return [
                    { to: 'kilometer', value: 50, res: 0.05 },
                    { to: 'decimeter', value: 1, res: 10 },
                    { to: 'centimeter', value: 1.256, res: 125.6 },
                    { to: 'millimeter', value: 0.1, res: 100 },
                    { to: 'thou', value: 1, res: 1/(25.4e-6) },
                    { to: 'inch', value: 1, res: 1/0.0254 },
                    { to: 'foot', value: 1, res: 1/0.3048 },
                    { to: 'yard', value: 1, res: 1/0.9144 },
                    { to: 'mile', value: 1, res: 1/1609.344 },
                    { to: 'nautical mile', value: 1, res: 1/1852 }
        ];
    }

    function test_to(data) {
        var result = model.to(data.to, data.value);
        compare(result, data.res);
    }

    function test_from_data() {
        return [
                    { from: 'kilometer', value: 1, res: 1000 },
                    { from: 'decimeter', value: 1, res: 0.1 },
                    { from: 'centimeter', value: 1, res: 0.01 },
                    { from: 'millimeter', value: 1, res: 0.001 },
                    { from: 'thou', value: 1, res: 25.4e-6 },
                    { from: 'inch', value: 1, res: 0.0254 },
                    { from: 'foot', value: 1, res: 0.3048 },
                    { from: 'yard', value: 1, res: 0.9144 },
                    { from: 'mile', value: 1, res: 1609.344 },
                    { from: 'nautical mile', value: 1, res: 1852 }
        ];
    }

    function test_from(data) {
        var result = model.from(data.from, data.value);
        compare(result, data.res);
    }

    function test_combined_data() {
        return [
                    { from: 'kilometer', fromval: 5, to: 'decimeter', toval: 5*1000*10 },
                    { from: 'kilometer', fromval: 1, to: 'foot', toval: 3280.839895 },
                    { from: 'kilometer', fromval: 1, to: 'yard', toval: 1093.613298 },
                    { from: 'mile', fromval: 1, to: 'yard', toval: 1760 }
        ];
    }

    function test_combined(data) {
        var result = model.from(data.from, data.fromval);
        result = model.to(data.to, result);
        compare(result, data.toval);
    }
}
