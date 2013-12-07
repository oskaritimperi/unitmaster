import QtQuick 2.0

ListModel {
    function from(title, value) {
        var functions = {
            "radian": function () { return value; },
            "degree": function () { return value*Math.PI/180.0; },
            "gon": function () { return value*Math.PI/200.0; },
            "arcminute": function () { return value*Math.PI/10800; },
            "arcsecond": function () { return value*Math.PI/648000; }
        };
        return functions[title]();
    }

    function to(title, value) {
        var functions = {
            "radian": function () { return value; },
            "degree": function () { return value*180.0/Math.PI; },
            "gon": function () { return value*200.0/Math.PI; },
            "arcminute": function () { return value*10800/Math.PI; },
            "arcsecond": function () { return value*648000/Math.PI; }
        };
        return functions[title]();
    }

    ListElement {
        title: "radian"
        abbr: "rad"
    }

    ListElement {
        title: "degree"
        abbr: "deg"
    }

    ListElement {
        title: "gon"
        abbr: ""
    }

    ListElement {
        title: "arcminute"
        abbr: ""
    }

    ListElement {
        title: "arcsecond"
        abbr: ""
    }
}
