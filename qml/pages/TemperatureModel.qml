import QtQuick 2.0

ListModel {
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

    ListElement {
        title: "kelvin"
        abbr: "K"
    }

    ListElement {
        title: "celcius"
        abbr: "°C"
    }

    ListElement {
        title: "fahrenheit"
        abbr: "F"
    }

    ListElement {
        title: "rankine"
        abbr: "°R"
    }
}
