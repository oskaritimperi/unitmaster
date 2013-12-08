import QtQuick 2.0

QtObject {
    function from(title, value) {
        var functions = {
            "kelvin": function () { return value; },
            "celcius": function () { return value + 273.15; },
            "fahrenheit": function () { return (value + 459.67) * 5.0 / 9.0; },
            "rankine": function () { return value * 5.0 / 9.0; }
        };
        return functions[title]();
    }

    function to(title, value) {
        var functions = {
            "kelvin": function () { return value; },
            "celcius": function () { return value - 273.15; },
            "fahrenheit": function () { return value * 9.0 / 5.0 - 459.67; },
            "rankine": function () { return value * 9.0 / 5.0; }
        };
        return functions[title]();
    }

    property list<UnitElement> unitModel: [
        UnitElement {
            name: "kelvin"
            abbr: "K"
            min: 0
        },
        UnitElement {
            name: "celcius"
            abbr: "°C"
            min: -273.15
        },
        UnitElement {
            name: "fahrenheit"
            abbr: "F"
            min: -459.67
        },
        UnitElement {
            name: "rankine"
            abbr: "°R"
            min: 0
        }
    ]
}
