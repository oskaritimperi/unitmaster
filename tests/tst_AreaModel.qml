import QtQuick 2.0
import QtTest 1.0

import "../harbour-unitmaster/qml/pages"

TestCase {
    name: "AreaModelTest"

    AreaModel {
        id: model
    }

    function test_to_data() {
        return [
                    { to: "square kilometer", value: 1, res: 1/(1000*1000) },
                    { to: "square feet", value: 1, res: 10.763911 },
                    { to: "square yard", value: 1, res: 1.195990 },
                    { to: "square mile", value: 1, res: 1/2589988.110336 },
                    { to: "are", value: 1, res: 0.01 },
                    { to: "hectare", value: 1, res: 0.0001 },
                    { to: "international acre", value: 1, res: 1/4046.8564224 },
                    { to: "survey acre", value: 1, res: 1/4046.872609874252 }
        ];
    }

    function test_to(data) {
        var result = model.to(data.to, data.value);
        compare(result, data.res);
    }

    function test_from_data() {
        return [
                    { from: "square kilometer", value: 1, res: 1000*1000 },
                    { from: "square feet", value: 1, res: 0.09290304 },
                    { from: "square yard", value: 1, res: 0.83612736 },
                    { from: "square mile", value: 1, res: 2589988.110336 },
                    { from: "are", value: 1, res: 100 },
                    { from: "hectare", value: 1, res: 10000 },
                    { from: "international acre", value: 1, res: 4046.8564224 },
                    { from: "survey acre", value: 1, res: 4046.872609874252 }
        ];
    }

    function test_from(data) {
        var result = model.from(data.from, data.value);
        compare(result, data.res);
    }

    function test_combined_data() {
        return [
                    { from: 'square mile', fromval: 1, to: 'square feet', toval: 27878400 },
                    { from: 'square mile', fromval: 1, to: 'square yard', toval: 3097600 },
                    { from: 'square mile', fromval: 1, to: 'hectare', toval: 258.9988110336 },
                    { from: 'square mile', fromval: 1, to: 'square kilometer', toval: 2.589988110336 },
                    { from: 'international acre', fromval: 1, to: 'hectare', toval: 0.40468564224 },
                    { from: 'survey acre', fromval: 1, to: 'hectare', toval: 0.404687261 },
                    { from: 'hectare', fromval: 1, to: 'are', toval: 100 },
                    { from: 'hectare', fromval: 1, to: 'international acre', toval:  2.4710538 },
        ];
    }

    function test_combined(data) {
        var sq_meters = model.from(data.from, data.fromval);
//        console.log('sq_meters: ', sq_meters);
        var result = model.to(data.to, sq_meters);
//        console.log('result', result);
        compare(result, data.toval);
    }
}
