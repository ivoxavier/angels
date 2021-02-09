import QtQuick 2.7
import Ubuntu.Components 1.3
import Ubuntu.Components.Popups 1.3



Dialog {
    id: archangelDayDialog
    text: "<b>"+i18n.tr("Each day of week has an specific archangel.")

    Rectangle {
        id: rectangleDialog
        width: 180;
        height: 50
        Item{
            Column{
                spacing: units.gu(1)
                Row{
                    spacing: units.gu(8)
            
                    Button {
                        id: closeButton
                        text: i18n.tr("Close")
                        onClicked: PopupUtils.close(archangelDayDialog)
                    }
                    
                    Button {
                        id: importButton
                        text: i18n.tr("Open")
                        color: UbuntuColors.orange
                        signal pushIndexChanged (int indexPush)
                        property var indexReceivedFromAction
                        Connections{
                            target: matchingAction
                            onMatchedDay: importButton.indexReceivedFromAction = index;
                        }
                        onClicked: {
                            pushIndexChanged(indexReceivedFromAction);
                            console.log("Dialog is sending: " + indexReceivedFromAction + " to Main.qml")
                            PopupUtils.close(archangelDayDialog)
                        }
                    }
                }
            }
        }
    }
}
