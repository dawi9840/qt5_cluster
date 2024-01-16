import QtQuick 2.0
import QtQuick.Controls 1.4
import QtQuick.Controls.Styles 1.4
//import Qt5Compat.GraphicalEffects
import QtGraphicalEffects 1.15

Item {
    id:root
    width: 90
    height:480
    property alias volumeBgColor:volumeBarbg.color
    property alias maxVol:progressBar.maximumValue
    property alias minVol:progressBar.minimumValue
    property alias currVol:progressBar.value
    property real sound:0
    visible: false
    Rectangle {
        id:volumeBarbg
        anchors.fill: parent
        radius: 12
        layer.enabled: true
        layer.effect: DropShadow {
            transparentBorder: true
            horizontalOffset: 0
            verticalOffset: 0
            radius: 8
            color: '#000000'
            opacity: 0.5
        }
    }

    Image {
        id:volumeIcon
        x:15;y:405
        width: 60; height:60
        source: "qrc:/assets/icon_volume_2.png"
        sourceSize.width: 60
        sourceSize.height: 60
    }

    ProgressBar {
        id: progressBar
        orientation: Qt.Vertical
        x: 39
        y: 30
        maximumValue: 100
        minimumValue: 0
        value: 10
        style: ProgressBarStyle{
            background: Rectangle {
                radius: 6
                color: "#FFFFFF"
                opacity: 0.1
                implicitWidth: 360
                implicitHeight: 12
            }
            progress: Rectangle {
                radius: 6
                color: '#FFFFFF'
                opacity: 0.75
            }
        }

    }

    onCurrVolChanged: {
        if (root.currVol === 0) {
            volumeIcon.source = "qrc:/assets/icon_volume_mute.png";
        } else {
            root.sound = root.currVol/(root.maxVol-root.minVol);
            console.log("sound = " + root.sound);
            if (root.sound > 0 && root.sound < 0.33) {
                volumeIcon.source = "qrc:/assets/icon_volume_1.png";
            } else if (root.sound >= 0.33 && root.sound < 0.66) {
                volumeIcon.source = "qrc:/assets/icon_volume_2.png";
            } else if (root.sound >= 0.66) {
                volumeIcon.source = "qrc:/assets/icon_volume_3.png";
            }

        }
    }
}
