import Quickshell.Widgets
import QtQuick.Layouts
import QtQuick

RowLayout {
    id: content

    Rectangle {
        color: "teal"

        implicitWidth: iconText.width + 5
        implicitHeight: iconText.height + 5

        Layout.margins: 10

        Text {
            id: iconText
            anchors.centerIn: parent
            text: "Icon"
            color: "#7fff00"
            font.family: "Metropolis Black"
            font.pointSize: 17
        }
    }

    ColumnLayout {
        Text {
            text: "The weather is blah blah blah, and some other shit about the weather, you know the whole spiel."
            color: "#FFFFFF"
            font.family: "Cantarell"
            font.pointSize: 9
        }
        Text {
            text: "This text doesn't actually have to make sense, jut be long enough to prove a point."
            color: "#FFFFFF"
            font.family: "Cantarell"
            font.pointSize: 9
        }
        Text {
            text: "Although I don't think it'll wrap properly."
            color: "#FFFFFF"
            font.family: "Cantarell"
            font.pointSize: 9
        }
    }
}
