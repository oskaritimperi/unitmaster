import QtQuick 2.0

ListModel {
    function from (title, value) {
        var functions = {
            "meter": function () { return value; },
            "kilometer": function () { return value*1000.0; },
            "decimeter": function () { return value/10.0; },
            "centimeter": function () { return value/100.0; },
            "millimeter": function () { return value/1000.0; },
            "thou": function () { return value*(25.4e-6); },
            "inch": function () { return value*0.0254; },
            "foot": function () { return value*0.3048; },
            "yard": function () { return value*0.9144; },
            "mile": function () { return value*1609.344; },
            "nautical mile": function () { return value*1852.0; }
        }
        return functions[title]();
    }

    function to (title, value) {
        var functions = {
            "meter": function () { return value; },
            "kilometer": function () { return value/1000.0; },
            "decimeter": function () { return value*10.0; },
            "centimeter": function () { return value*100.0; },
            "millimeter": function () { return value*1000.0; },
            "thou": function () { return value/(25.4e-6); },
            "inch": function () { return value/0.0254; },
            "foot": function () { return value/0.3048; },
            "yard": function () { return value/0.9144; },
            "mile": function () { return value/1609.344; },
            "nautical mile": function () { return value/1852.0; }
        };
        return functions[title]();
    }

    ListElement {
        title: "meter"
        abbr: "m"
    }

    ListElement {
        title: "kilometer"
        abbr: "km"
    }

    ListElement {
        title: "decimeter"
        abbr: "dm"
    }

    ListElement {
        title: "centimeter"
        abbr: "cm"
    }

    ListElement {
        title: "millimeter"
        abbr: "mm"
    }

    ListElement {
        title: "thou"
        abbr: "thou"
    }

    ListElement {
        title: "inch"
        abbr: "inch"
    }

    ListElement {
        title: "foot"
        abbr: "ft"
    }

    ListElement {
        title: "yard"
        abbr: "yd"
    }

    ListElement {
        title: "mile"
        abbr: ""
    }

    ListElement {
        title: "nautical mile"
        abbr: ""
    }
}
