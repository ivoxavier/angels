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
                if(sections.selectedIndex === 1){
                    infoColumn.visible = false;
                    prayerColumn.visible = true;
                } else {
                    infoColumn.visible = true;
                    prayerColumn.visible = false;
                }
            }
        }  
    }

   
    Image{
        id: photoArchangelPage;
        anchors.top: header.bottom;
        //anchors.horizontalCenter: parent.horizontalCenter;
        
        fillMode: Image.Tile;
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
            anchors.top: photoArchangelPage.bottom;
            anchors.left: parent.left;
            anchors.right: parent.right;
            spacing: units.gu(2);
            
            
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
            anchors.top: photoArchangelPage.bottom;
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