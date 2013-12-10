import QtQuick 2.0
import Sailfish.Silica 1.0
import "helpers.js" as H

Page {
    id: page

    SilicaFlickable {
        anchors.fill: parent

        Column {
            width: parent.width
            spacing: Theme.paddingLarge

            PageHeader {
                title: "About"
            }

            TextArea {
                readOnly: true
                width: parent.width
                horizontalAlignment: TextEdit.AlignHCenter
                text: "Unit Master\nCopyright 2013 Oskari Timperi\n\nThe
application icon is derived from the Meanicons Icon Set\n(http://www.meanicons.com/).\n\n
You can report bugs and feature requests on github. If you feel like it, fork it!"
            }

            Button {
                anchors.horizontalCenter: parent.horizontalCenter
                text: "github.com"
                onClicked: {
                    Qt.openUrlExternally("http://github.com/oswjk/unitmaster")
                }
            }
        }

    }
}


