import QtQuick 2.0
import Sailfish.Silica 1.0
import "helpers.js" as Helpers

Page {
    id: page

    property string modelFilename
    property string quantityName

    function formatText(value, unit) {
        return "%1 %2".arg(value.toPrecision(5)).arg(pluralize(unit, value));
    }

    function updateResult() {
        var f = parseFloat(fromField.text);

        if (fromField.text.length === 0) {
            f = 0.0;
        }

        if (fromCombo.value.length === 0 || toCombo.value.length === 0)
            return;

        var model = modelLoader.item.unitModel;

        var fromUnit = model[fromCombo.currentIndex].name;
        var toUnit = model[toCombo.currentIndex].name;

        var result = modelLoader.item.from(fromUnit, f);
        result = modelLoader.item.to(toUnit, result);

        resultLabel.text = formatText(result, toUnit);

        var min = model[fromCombo.currentIndex].min;
        var max = model[fromCombo.currentIndex].max;

        if (f < min) {
            fromField.label = "minimum value %1".arg(min);
        } else if (f > max) {
            fromField.label = "maximum value %1".arg(max);
        } else
        {
            fromField.label = "";
        }
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
            return "%1 (%2)".arg(title).arg(abbr);
        }

        return title;
    }

    Component.onCompleted: {
        modelLoader.setSource(modelFilename);
    }

    Loader {
        id: modelLoader
        onLoaded: {
            fromRepeater.model = modelLoader.item.unitModel;
            toRepeater.model = modelLoader.item.unitModel;
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
                        text: makeTitle(model.modelData.name, model.modelData.abbr)
                    }
                }
            }
            onValueChanged: {
                fromFieldValidator.bottom = modelLoader.item.unitModel[fromCombo.currentIndex].min;
                fromFieldValidator.top = modelLoader.item.unitModel[fromCombo.currentIndex].max;
                updateResult()
            }
        }

        TextField {
            id: fromField
            width: parent.width
            placeholderText: "enter " + pluralize(fromRepeater.model[fromCombo.currentIndex].name, 0)
            inputMethodHints: Qt.ImhFormattedNumbersOnly
            validator: DoubleValidator {
                id: fromFieldValidator
            }
            EnterKey.onClicked: {
                parent.focus = true;
                updateResult();
            }
            onTextChanged: {
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
                        text: makeTitle(model.modelData.name, model.modelData.abbr)
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


