import Quickshell
import QtQuick

Scope {
    id: root
    readonly property string day: {
        Qt.formatDateTime(clock.date, "dddd")
    }

    readonly property string date: {
        Qt.formatDateTime(clock.date, "dd MMMM yyyy")
    }

    readonly property string time: {
        Qt.formatDateTime(clock.date, "hh:mm ap")
    }

    SystemClock {
        id: clock
        precision: SystemClock.Minutes
    }
}
