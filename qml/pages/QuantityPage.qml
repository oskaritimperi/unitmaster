import QtQuick 2.0
import Sailfish.Silica 1.0
import "helpers.js" as Helpers

Page {
    id: page

    property string modelFilename
    property string quantityName

    function formatText(value, unit) {
        return value.toPrecision(5) + " " + pluralize(unit, value);
    }

    function updateResult() {
        var f = parseFloat(fromField.text);

        if (fromField.text.length === 0) {
            f = 0.0;
        }

        if (fromCombo.value.length === 0 || toCombo.value.length === 0)
            return;

        var model = modelLoader.item;

        var fromUnit = model.get(fromCombo.currentIndex).title;
        var toUnit = model.get(toCombo.currentIndex).title;

        var result = model.from(fromUnit, f);
        result = model.to(toUnit, result);

        resultLabel.text = formatText(result, toUnit);
    }

    function pluralize(s, n) {
        if (n !== 1) {
            if (s === "inch") {
                return "inches";
            } else if (s === "foot") {
                return "feet";
            } else if (s === "celcius") {
                return s;
            }
            return s + "s";
        }

        return s;
    }

    function makeTitle(title, abbr) {
        if (abbr.length > 0) {
            return title + " (" + abbr + ")";
        }

        return title;
    }

    Component.onCompleted: {
        modelLoader.setSource(modelFilename);
    }

    Loader {
        id: modelLoader
        onLoaded: {
            fromRepeater.model = modelLoader.item;
            toRepeater.model = modelLoader.item;
        }
    }

    Column {
        id: column
        spacing: Theme.paddingLarge
        anchors.fill: parent

        PageHeader {
            title: Helpers.capitalize(page.quantityName)
        }

        ComboBox {
            id: fromCombo
            width: parent.width
            label: "From"
            menu: ContextMenu {
                Repeater {
                    id: fromRepeater
                    delegate: MenuItem {
                        text: makeTitle(title, abbr)
                    }
                }
            }
            onValueChanged: updateResult()
        }

        TextField {
            id: fromField
            width: parent.width
            placeholderText: "enter " + pluralize(fromRepeater.model.get(fromCombo.currentIndex).title, 0)
            inputMethodHints: Qt.ImhFormattedNumbersOnly
            EnterKey.onClicked: {
                parent.focus = true;
                updateResult();
            }
        }

        ComboBox {
            id: toCombo
            width: parent.width
            label: "To"
            menu: ContextMenu {
                Repeater {
                    id: toRepeater
                    delegate: MenuItem {
                        text: makeTitle(title, abbr)
                    }
                }
            }
            onValueChanged: updateResult()
        }

        SectionHeader {
            text: "Result"
        }

        Label {
            id: resultLabel
            height: Theme.itemSizeSmall
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }
}


