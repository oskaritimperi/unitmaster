import QtQuick 2.0
import Sailfish.Silica 1.0
import "helpers.js" as H

Page {
    id: page

    QuantityModel {
        id: quantityModel
    }

    SilicaListView {
        anchors.fill: parent
        model: quantityModel
        spacing: Theme.paddingLarge
        delegate: BackgroundItem {
            width: ListView.view.width
            Label {
                x: Theme.paddingLarge
                text: H.capitalize(title)
                anchors.verticalCenter: parent.verticalCenter
            }
            onClicked: {
                var props = {
                    "first": true,
                    "modelFilename": model,
                    "quantityName": title
                };
                pageStack.push(Qt.resolvedUrl("QuantityPage.qml"), props);
            }
        }
        header: PageHeader {
            title: "Quantity"
        }
        VerticalScrollDecorator {}

        PullDownMenu {
            MenuItem {
                text: "About"
                onClicked: pageStack.push(Qt.resolvedUrl("AboutPage.qml"))
            }
        }
    }
}


