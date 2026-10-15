import QtQuick
import QtQuick.Layouts

RowLayout {
    id: monitorRoot

    Ring {
        id: cpuMonitor
        color: "#7fff00"

        centerX: 26
        centerY: 38

        angle: 90
    }

    Text {
        id: cpuMonitorText

        text: "CPU:\n0%"
        color: "#FFFFFF"
        font.family: "Cantarell"
        font.pointSize: 8

        Layout.leftMargin: 5
    }

    Ring {
        id: memMonitor

        color: "#7fff00"

        centerX: 26
        centerY: 38

        angle: 90

        Layout.leftMargin: 23
    }

    Text {
        id: memMonitorText

        text: "Mem:\n0%"

        color: "#FFFFFF"
        font.family: "Cantarell"
        font.pointSize: 8

        Layout.leftMargin: 5
    }

    DoubleRing {
        id: homeMonitor

        color: "#7fff00"

        centerX: 26
        centerY: 38

        angle: 90

        Layout.leftMargin: 23
    }

    Text {
        id: homeMonitorText

        text: "Home:\n0%"

        color: "#FFFFFF"
        font.family: "Cantarell"
        font.pointSize: 8

        Layout.leftMargin: 5
    }
}
