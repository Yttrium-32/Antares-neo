import Quickshell
import Quickshell.Widgets
import Quickshell.Io
import QtQuick.Layouts
import QtQuick

RowLayout {
    Rectangle {
        id: content
        color: "transparent"

        implicitWidth: iconText.width + 5
        implicitHeight: iconText.height + 5

        Layout.margins: 10

        FileView {
            id: weatherJson
            path: "./weather.json"

            watchChanges: true
            onFileChanged: reload()

            blockLoading: true
        }

        readonly property var weatherData: JSON.parse(weatherJson.text())

        property var iconIdMap: {
             "01d": "" ,
             "01n": "" ,
             "02d": "" ,
             "02n": "" ,
             "03d": "" ,
             "03n": "" ,
             "04d": "" ,
             "04n": "" ,
             "09d": "" ,
             "09n": "" ,
             "10d": "" ,
             "10n": "" ,
             "11d": "" ,
             "11n": "" ,
             "13d": "" ,
             "13n": "" ,
             "50d": "" ,
             "50n": ""
        }

        Text {
            id: iconText
            anchors.centerIn: parent
            text: content.iconIdMap[content.weatherData.weather[0].icon]
            color: "#7fff00"
            font.family: "Weather Icons"
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
