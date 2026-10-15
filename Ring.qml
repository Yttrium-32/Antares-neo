import QtQuick
import QtQuick.Layouts
import QtQuick.Shapes

Shape {
    id: ringRoot

    Layout.bottomMargin: 10
    preferredRendererType: Shape.CurveRenderer

    property var color: "black"
    property var angle: 0

    property var centerX: 0
    property var centerY: 0

    readonly property var strokeWidth: 7

    readonly property var radiusX: 20
    readonly property var radiusY: 20

    ShapePath {
        fillColor: "transparent"
        strokeColor: "#50808080"
        strokeWidth: ringRoot.strokeWidth
        capStyle: ShapePath.FlatCap

        PathAngleArc {
            centerX: ringRoot.centerX; centerY: ringRoot.centerY
            radiusX: ringRoot.radiusX; radiusY: ringRoot.radiusY
            startAngle: 0
            sweepAngle: 360
        }
    }

    ShapePath {
        fillColor: "transparent"
        strokeColor: ringRoot.color
        strokeWidth: ringRoot.strokeWidth
        capStyle: ShapePath.FlatCap

        PathAngleArc {
            centerX: ringRoot.centerX; centerY: ringRoot.centerY
            radiusX: ringRoot.radiusX; radiusY: ringRoot.radiusY
            startAngle: -90
            sweepAngle: ringRoot.angle
        }
    }
}

