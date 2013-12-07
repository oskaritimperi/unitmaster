import QtQuick 2.0
import QtTest 1.0

import "../harbour-unitmaster/qml/pages"

TestCase {
    name: "MassModelTest"

    MassModel {
        id: model
    }

    function test_to_data() {
        return [
                    { to: 'pound', value: 1, res: 2.2046226 },
                    { to: 'ounce', value: 1, res: 35.273961 },
                    { to: 'tonne', value: 1000, res: 1 },
                    { to: 'gram', value: 1, res: 1000 }
        ];
    }

    function test_to(data) {
        var result = model.to(data.to, data.value);
        compare(result, data.res);
    }

    function test_from_data() {
        return [
                    { from: 'pound', value: 1, res: 0.4536 },
                    { from: 'ounce', value: 1, res: 0.02835 },
                    { from: 'tonne', value: 1, res: 1000 },
                    { from: 'gram', value: 1, res: 0.001 }
        ];
    }

    function test_from(data) {
        var result = model.from(data.from, data.value);
        compare(result, data.res);
    }
}
