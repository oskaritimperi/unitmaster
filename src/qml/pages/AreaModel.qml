import QtQuick 2.0

ListModel {
    function from(title, value) {
        var functions = {
            "square meter": function () { return value; },
            "square kilometer": function () { return value*(1000*1000); },
            "square feet": function () { return value*0.09290304; },
            "square yard": function () { return value*0.83612736; },
            "square mile": function () { return value*2.589988110336e6; },
            "are": function () { return value*100; },
            "hectare": function () { return value*10000; },
            "international acre": function () { return value*4046.8564224; },
            "survey acre": function () { return value*4046.872609874252; }
        };
        return functions[title]();
    }

    function to(title, value) {
        var functions = {
            "square meter": function () { return value; },
            "square kilometer": function () { return value/(1000*1000); },
            "square feet": function () { return value/0.09290304; },
            "square yard": function () { return value/0.83612736; },
            "square mile": function () { return value/2.589988110336e6; },
            "are": function () { return value/100; },
            "hectare": function () { return value/10000; },
            "international acre": function () { return value/4046.8564224; },
            "survey acre": function () { return value/4046.872609874252; }
        };
        return functions[title]();
    }

    ListElement {
        title: "square meter"
        abbr: "m²"
    }

    ListElement {
        title: "square kilometer"
        abbr: "km²"
    }

    ListElement {
        title: "square feet"
        abbr: "ft²"
    }

    ListElement {
        title: "square yard"
        abbr: "yd²"
    }

    ListElement {
        title: "square mile"
        abbr: "mi²"
    }

    ListElement {
        title: "are"
        abbr: "a"
    }

    ListElement {
        title: "hectare"
        abbr: "ha"
    }

    ListElement {
        title: "international acre"
        abbr: ""
    }

    ListElement {
        title: "survey acre"
        abbr: ""
    }
}
