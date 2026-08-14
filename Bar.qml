import Quickshell
import QtQuick

Scope {
    Variants {
        model: Quickshell.screens

        PanelWindow {
            required property var modelData
            screen: modelData

            color: "transparent"

            anchors {
                bottom: true
                right: true
            }

			implicitWidth: content.width
			implicitHeight: content.height

            aboveWindows: false

            ClockWidget {
                anchors.centerIn: parent
            }
        }
    }
}
