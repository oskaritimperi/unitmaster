import QtQuick 2.0

ListModel {
    function from(title, value) {
        var functions = {
            "kilogram": function () { return value; },
            "gram": function () { return value/1000.0; },
            "tonne": function () { return value*1000.0; },
            "pound": function () { return value*0.45359237; },
            "ounce": function () { return value*0.028349523125; }
        };
        return functions[title]();
    }

    function to(title, value) {
        var functions = {
            "kilogram": function () { return value; },
            "gram": function () { return value*1000.0; },
            "tonne": function () { return value/1000.0; },
            "pound": function () { return value/0.45359237; },
            "ounce": function () { return value/0.028349523125; }
        };
        return functions[title]();
    }

    ListElement {
        title: "kilogram"
        abbr: "kg"
    }

    ListElement {
        title: "gram"
        abbr: "g"
    }

    ListElement {
        title: "tonne"
        abbr: "t"
    }

    ListElement {
        title: "pound"
        abbr: "lb"
    }

    ListElement {
        title: "ounce"
        abbr: "oz"
    }
}
