import QtQuick
import QtQuick.Layouts
import Quickshell

ShellRoot {
    Time { id: timeSource }
    Variants {
        model: Quickshell.screens

        PanelWindow {
            id: w

            property var modelData
            screen: modelData

            aboveWindows: false

            anchors {
                right: true
                bottom: true
            }

            margins {
                right: 50
                left: 50
                bottom: 150
            }

            implicitWidth: content.width
            implicitHeight: content.height

            color: "transparent"

            // Give the window an empty click mask so all clicks pass through it.
            mask: Region {}

            ColumnLayout {
                id: content

                RowLayout {
                    Text {
                        text: timeSource.day
                        color: "#FFFFFF"
                        font.family: "Metropolis Black"
                        font.pointSize: 60
                    }

                    Text {
                        text: "."
                        color: "#7fff00"
                        font.family: "Metropolis Black"
                        font.pointSize: 60
                    }
                }

                Text {
                    text: timeSource.date
                    color: "#FFFFFF"
                    font.family: "Cantarell"
                    font.pointSize: 15
                }

                WeatherWidget {
                    id: weatherWidget
                    Layout.topMargin: 11
                    Layout.bottomMargin: 19
                }

                Rectangle {
                    width: 300
                    height: 1
                    color: "#FFFFFF"

                    Layout.bottomMargin: 10
                }

                Text {
                    text: "Time is " + timeSource.time
                    color: "#FFFFFF"
                    font.family: "Metropolis Medium"
                    font.pointSize: 14
                }
            }
        }
    }
}
