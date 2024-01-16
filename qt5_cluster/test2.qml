import QtQuick 2.15
import QtQuick.Controls 2.15

ApplicationWindow {
    // 定義全局變數
    property string messageFromServiceText: "1234567"

    title: qsTr("Test")
    visible: true
    width: 1280
    height: 720
    color:"black"

    Text {
        id:displayText
        x:100;y:100;
        width:500
        height:50
        visible:true
        font.pixelSize:90
        text: messageFromServiceText // 使用全局變數
        color: "yellow"
    }

    Connections {
        target: qtAndroidService
        function onMessageFromService(message) {
            console.log("dawi_qml_onMessageFromService: " + message);
            messageFromServiceText = message;
        }
    }
}
