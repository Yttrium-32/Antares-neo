import QtQuick
import QtQuick.Layouts
import Quickshell.Io

RowLayout {
    id: monitorRoot
    property int memPerc: 0

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

    Process {
        id: memProc
        command: [
            "awk",
            "/^MemTotal:/ {total = $2} /^MemAvailable:/ {available = $2} END { used = total - available; perc = (used / total) * 100; printf \"%.0f\", perc}",
            "/proc/meminfo"
        ]

        running: true

        stdout: StdioCollector {
            onStreamFinished: monitorRoot.memPerc = parseInt(this.text)
        }
    }

    Timer {
        interval: 1000
        running: true
        repeat: true
        onTriggered: memProc.running = true
    }

    Ring {
        id: memMonitor

        color: "#7fff00"

        centerX: 26
        centerY: 38

        angle: 360 * (monitorRoot.memPerc / 100)

        Layout.leftMargin: 23
    }

    Text {
        id: memMonitorText

        text: "Mem:\n" + monitorRoot.memPerc + "%"

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
