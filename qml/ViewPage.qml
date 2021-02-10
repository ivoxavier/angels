/*
 * Copyright (C) 2021  Ivo Xavier
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; version 3.
 *
 * angels is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */


import QtQuick 2.7
import Ubuntu.Components 1.3


Page{
    id:pagePushed;
    header: PageHeader {
        id: headerArchangelPage;
            Connections{
                target: archangelList
                onHeaderNameSender: headerArchangelPage.title = title
            }
        leadingActionBar.actions: Action {
            text: i18n.tr("Back");
            iconName: "back";
            onTriggered: pageStack.pop();
        }
        sections{
            model: {[i18n.tr("Photos"), i18n.tr("Info"), i18n.tr("Prayer")]} //photos - index 0, info - index 1, prayer - index 2
            selectedIndex: 0
            onSelectedIndexChanged: {
                if(sections.selectedIndex === 0){
                    photoArchangelPage.visible = true;
                    infoColumn.visible = false;
                    prayerColumn.visible = false;
                } else if (sections.selectedIndex === 1) {
                    photoArchangelPage.visible = false;
                    infoColumn.visible = true;
                    prayerColumn.visible = false;
                } else {
                    photoArchangelPage.visible = false;
                    infoColumn.visible = false;
                    prayerColumn.visible = true;
                }
            }
        }  
    }

   
    Image{
        id: photoArchangelPage;
        anchors.top: header.bottom;
        anchors.left: pagePushed.left
        anchors.right: pagePushed.right
        anchors.bottom: pagePushed.bottom
        fillMode: Image.Strech;
        Rectangle{
            id: photoCopyRight
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            width: parent.width / 3
            height: parent.height / 3
            color: "red"
        }
        Connections {
            target: archangelList
            onPhotoPathSender: photoArchangelPage.source = path;
        }
    }  
        


        
    Column{
        id: infoColumn;
        topPadding: units.gu(3);
        leftPadding: units.gu(1);
        rightPadding: units.gu(1);
        anchors.top: header.bottom;
        anchors.left: parent.left;
        anchors.right: parent.right;
        spacing: units.gu(2);
        visible: false
            
        Text{
            id: favColor
            Connections{
                target: archangelList
                onFavColorSender: favColor.text = color;
            }
        }

    
        Text{
            id: descArchangel
            width: infoColumn.width; 
            wrapMode: Text.Wrap;
            horizontalAlignment: Text.AlignJustify
            rightPadding: units.gu(2)
            Connections{
                target:archangelList
                onDescSender: descArchangel.text = desc
            }
        }
    }

        Column{
            id: prayerColumn;
            topPadding: units.gu(3);
            leftPadding: units.gu(1);
            rightPadding: units.gu(1);
            anchors.top: header.bottom;
            anchors.left: parent.left;
            anchors.right: parent.right;
            spacing: units.gu(2);
            visible: false;
    
        Text{
            id: prayerArchangel
            width: prayerColumn.width; 
            wrapMode: Text.Wrap;
            horizontalAlignment: Text.AlignJustify
            rightPadding: units.gu(2)
            Connections{
                target: archangelList
                onPrayerSender: prayerArchangel.text = prayer
            }
        }
    }
}
