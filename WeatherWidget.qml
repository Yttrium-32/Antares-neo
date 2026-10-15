import Quickshell
import Quickshell.Widgets
import Quickshell.Io
import QtQuick.Layouts
import QtQuick

RowLayout {
    id: content
    FileView {
        id: weatherJson
        path: Quickshell.env("XDG_CACHE_HOME") + "/weather.json"

        watchChanges: true
        onFileChanged: reload()

        blockLoading: true
    }

    readonly property var weatherData: JSON.parse(weatherJson.text())

    readonly property var iconIdMap: {
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

    property var weatherInfo: {
        "city": content.weatherData.name,
        "icon": content.iconIdMap[content.weatherData.weather[0].icon],
        "main": content.weatherData.weather[0].main,

        "temp": Math.round(Number(content.weatherData.main.temp)),
        "wind_spd": Number(content.weatherData.wind.speed),
        "humidity": Math.round(Number(content.weatherData.main.humidity))
    }


    Rectangle {
        id: iconContent
        color: "transparent"

        implicitWidth: iconText.width + 5
        implicitHeight: iconText.height + 5

        Layout.leftMargin: 25

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
        Layout.leftMargin: 20

        Text {
            text: "The Weather in " + content.weatherInfo["city"] + " is " + content.weatherInfo["main"] + ", Temperature is " + content.weatherInfo["temp"] + "°C"
            color: "#FFFFFF"
            font.family: "Cantarell"
            font.pointSize: 9
        }

        Text {
            text: "The Wind Speed at your location is " + content.weatherInfo["wind_spd"] + "km/h"
            color: "#FFFFFF"
            font.family: "Cantarell"
            font.pointSize: 9
        }

        Text {
            text: "And Humidity is " + content.weatherInfo["humidity"] + "%"
            color: "#FFFFFF"
            font.family: "Cantarell"
            font.pointSize: 9
        }
    }
}
