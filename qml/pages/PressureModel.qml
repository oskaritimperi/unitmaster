import QtQuick 2.0

ListModel {
    function from(title, value) {
        var functions = {
            "pascal": function () { return value; },
            "kilopascal": function () { return value*1000; },
            "bar": function () { return value*1e5; },
            "millibar": function () { return value*100.0; },
            "pounds per square inch": function () { return value*(6.8948e3); },
            "technical atmosphere": function () { return value*0.980665e5; },
            "standard atmosphere": function () { return value*1.01325e5; },
            "torr": function () { return value*133.3224; }
        };
        return functions[title]();
    }

    function to(title, value) {
        var functions = {
            "pascal": function () { return value; },
            "kilopascal": function () { return value/1000; },
            "bar": function () { return value/1e5; },
            "millibar": function () { return value/100.0; },
            "pounds per square inch": function () { return value/(6.8948e3); },
            "technical atmosphere": function () { return value/(0.980665e5); },
            "standard atmosphere": function () { return value/(1.01325e5); },
            "torr": function () { return value/133.3224; }
        };
        return functions[title]();
    }

    ListElement {
        title: "pascal"
        abbr: "Pa"
    }

    ListElement {
        title: "kilopascal"
        abbr: "kPa"
    }

    ListElement {
        title: "bar"
        abbr: ""
    }

    ListElement {
        title: "millibar"
        abbr: "mbar"
    }

    ListElement {
        title: "pounds per square inch"
        abbr: "psi"
    }

    ListElement {
        title: "technical atmosphere"
        abbr: "at"
    }

    ListElement {
        title: "standard atmosphere"
        abbr: "atm"
    }

    ListElement {
        title: "torr"
        abbr: ""
    }
}
