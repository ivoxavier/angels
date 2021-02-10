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
//import QtQuick.Controls 2.2
import QtQuick.Layouts 1.3
import Qt.labs.settings 1.0
import Ubuntu.Components.Popups 1.3
import Ubuntu.Components.ListItems 1.3 as ListItem


MainView {
    id: root
    objectName: 'mainView'
    applicationName: 'angels.ivoxavier'
    automaticOrientation: false

    ViewPage{
        id: archangelPage
        visible:false
    }

    Component{
        id: archangelDayDialogPage
        ArchangelDayDialog{}
    }

    width: units.gu(45)
    height: units.gu(75)
  PageStack{
      id: pageStack
      Component.onCompleted: push(mainPage)
    Page {
        id:mainPage
        anchors.fill: parent
        header: PageHeader {
            id: header
            title: i18n.tr('Angels & Archangels')
            property var locale: Qt.locale()
            property date thisDeviceCurrentDate: new Date();
            property var deviceDay: thisDeviceCurrentDate.toLocaleDateString(locale, 'dddd');
            property var jophielDay: locale.dayName(0) /// Sunday
            property var chamuelDay: locale.dayName(1) /// Monday
            property var michaelDay: locale.dayName(2) /// Tuesday
            property var raphaelDay: locale.dayName(3) /// wednesday
            property var urielDay: locale.dayName(4) ///// Thursday
            property var gabrielDay: locale.dayName(5) /// Friday
            property var zadkielDay: locale.dayName(6) /// Saturday
            ActionBar {
                anchors.right: parent.right
                numberOfSlots: 1
                actions: [
                    Action {
                        id: matchingAction
                        iconName: "info"
                        text: i18n.tr("Archangel of the day")
                        signal matchedDay (int index)
                        visible: false
                        onTriggered:{
                           var variableWeekDay = header.deviceDay;
                           const constWeekDay = [header.jophielDay, header.chamuelDay, header.michaelDay, header.raphaelDay, header.urielDay, header.gabrielDay, header.zadkielDay];
                           for(var i = 0; i < constWeekDay.length; i++){
                               if(variableWeekDay === constWeekDay[i]){
                                    console.log("match neste dia da semana: "+header.locale.dayName(i));
                                    PopupUtils.open(archangelDayDialogPage)
                                    matchingAction.matchedDay(i)
                               }else{console.log("noMatch")}
                           }
                        }
                    }
                ]
            }
        }


        Connections{
                    target: ArchangelDayDialog.rectangleDialog.indexReceivedFromAction
                    ignoreUnknownSignals: true
                    onPushIndexChanged: {
                        archangelList.selectedIndex = indexPush;
                        console.log("Received index: " + archangelList.selectedIndex, change)
                    }
                }


        Column {
            anchors.top: header.bottom
            anchors.left: parent.left
            anchors.right: parent.right
            spacing: units.gu(2)

            ListItem.ItemSelector {
                id: archangelList
                expanded: true
                model: [
                i18n.tr("Archangel Jophiel"),// index: 0
                i18n.tr("Archangel Chamuel"),// index: 1
                i18n.tr("Archangel Michael"),// index: 2
                i18n.tr("Archangel Raphael"),// index: 3
                i18n.tr("Archangel Uriel"),//// index: 4
                i18n.tr("Archangel Gabriel"),// index: 5
                i18n.tr("Archangel Zadkiel"),// index: 6
                i18n.tr("Guardian Angel")////// index: 7
                ]

                property var photoUrlJophiel : "https://en.wikipedia.org/wiki/Jophiel"
                property var colorJophiel : i18n.tr("Color: Yellow")
                property var descJophiel : i18n.tr("Jophiel's talents include the flame of wisdom, intuition, insight, joy,happiness and enlightenment of the soul. Summon Jofiel when you need more creativity, to avoid feelings of low self-esteem, inertia or mental confusion. It helps to absorb new information. We can invoke the flame of wisdom to help us in any situation that requires a clear mental perception, insight or inspiration.");
                property var prayerJophiel : i18n.tr("Archangel Jophiel, fill my body, mind and spirit with light!\nArchangel Jophiel, help me in the search for enlightenment!\nArchangel Jophiel, unveil me the divine kingdoms!\Archangel Jophiel, reveal to me the greatest wisdom!\nArchangel Jophiel, fill me with joy and laughter!");
                property var photoUrlChamuel : "https://en.wikipedia.org/wiki/Camael"
                property var colorChamuel : i18n.tr("Color: Pink")
                property var descChamuel : i18n.tr("Archangel Chamuel helps to renew and improve loving relationships with other people,contributing to the development of the Heart Chakra. It does so by means of the beautiful pink that represents the ability to love and nurture other people, as well as giving and receiving unconditional love, without any selfish interest. It is a love that transcends and transforms the self and makes us move with compassion towards the divine state of maturity emotional. Many people are afraid to open the Heart Chakra. Those that manage to overcome that fear have a warm and charismatic attitude that makes people feel comforted and peaceful.")
                property var prayerChamuel : i18n.tr("In the name of God, I AM THAT I AM,in the name of Archangel Chamuel: Kick back, Anti-Love forces!(Repeat this second part nine times or more)");
                property var photoUrlMichael : "https://pt.wikipedia.org/wiki/Miguel_(arcanjo)"
                property var colorMichael : i18n.tr("Color: Blue")
                property var descMichael : i18n.tr("The mighty Archangel Michael is the protector of humanity, the supreme commander and incorruptible of all the Archangels and the leader of the celestial forces - their <legions of light> - against the bad. Its main color is solar yellow; in fact, your domain is the fiery power of the plexus but as it has a sword made of sapphire, the blue flame, it is often associated with power and the development of the Throat and Third Eye Chakras")
                property var prayerMichael : i18n.tr("Saint Michael ahead, Saint Michael behind,Saint Michael on the right, Saint Michael on the left,Saint Michael above, Saint Michael below,Saint Michael, Saint Michael, wherever I go! I am your Love that protects me here! I am your Love that protects me here! I am your Love that protects me here!(3x, 9x, 2x)");
                property var photoUrlRaphael: "https://pt.wikipedia.org/wiki/Rafael_(arcanjo)"
                property var colorRaphael : i18n.tr("Color: Green")
                property var descRaphael : i18n.tr("Archangel Raphael is known as the Angel of Science, Knowledge and Healing. The Jewish texts claim that he revealed to Noah the healing power of plants, healed a blind man and imprisoned a demon. Catholics revere him as the angel who healed the sick in the Bethesda. The Book of Enoch tells us that his responsibilities include healing wounds and mens diseases.")
                property var prayerRaphael : i18n.tr("Archangel Raphael, heal my wounds from the past!\nArchangel Raphael, help my body to heal!\nArchangel Raphael, heal my wounded spirit!\nArchangel Raphael, cure my physical / mental / emotional pain!\nArchangel Raphael, help me to heal and restore my relationship with ...!\nArchangel Raphael, make me complete again!\nArchangel Raphael, assist me in my healing work!");
                property var photoUrlUriel : "https://en.wikipedia.org/wiki/Uriel"
                property var colorUriel : i18n.tr("Color: Red")
                property var descUriel : i18n.tr("Uriel and Aurora and the Angels of Peace are gigantic beings - like those that were seen by Soviet cosmonauts. They can bring Peace to troubled areas of the world, your home and even a troubled spirit or mind. They act quickly and with great power. Angels act with the precision of a microsurger in the problems of home, family and psychology. They may help you maintain peace in your home and in your mind and remove pockets of disagreement in the family and to directly reach the cause of the restlessness in your soul. They will be able to give strength to overcome the anger, irritation, self-destructive behaviors, feelings of despair, conscious fears or unconscious and to get rid of old hurts and wounds. See the big changes they they can bring when you invite them into your life.")
                property var prayerUriel : i18n.tr("Archangel Uriel, fill me with peace! Archangel Uriel, free me from my fears! Archangel Uriel, bring me prosperity! Archangel Uriel, bring peace to the world! Archangel Uriel, help me to serve others to fulfill the divine purpose!");
                property var photoUrlGabriel : "https://en.wikipedia.org/wiki/Gabriel"
                property var colorGabriel : i18n.tr("Color: White")
                property var descGabriel : i18n.tr("St. Gabriel is an angel who serves as a messenger for God to certain people. He is one of the three archangels. Gabriel is mentioned in both the Old and the New Testaments of the Bible. First, in the Old Testament, Gabriel appears to the prophet Daniel to explain his visions. Gabriel is described as, <one who looked like man,> as he interprets Daniel's visions. He speaks to Daniel while he is sleeping. After Gabriel's first visit, Daniel becomes tired and sick for days. Gabriel later visits Daniel again providing him with more insight and understanding in an answered prayer.")
                property var prayerGabriel : i18n.tr("Archangel Gabriel, guide me along the path of my soul! Archangel Gabriel, reveal the purpose of my life! Archangel Gabriel, help me to interpret my visions! Archangel Gabriel, inspire me and guide me through the coming changes! Archangel Gabriel, purify my body, mind and spirit! Archangel Gabriel, cleanse my body of toxic substances! Archangel Gabriel, clear my mind of impure thoughts! Archangel Gabriel, save me from psychic attacks! (3x, 9x, 2x)");
                property var photoUrlZadkiel: "https://en.wikipedia.org/wiki/Zadkiel"
                property var colorZadkiel : i18n.tr("Color: Violet")
                property var descZadkiel : i18n.tr("The Violet Ray can summon Archangel ZadKiel, who promotes the Transformation of energy negative and the day is Saturday.\nYou can ask Archangel Zadkiel and Amethyst and their angels to increase your tolerance towards other people.\nArches: Amethyst (soul mate) divine complement of Archangel Zadkiel)");
                property var prayerZadkiel : i18n.tr("Welcome Michael and faith! Enter my life and my home!(3x)\nLegions of Michael and faith, get down to earth and get me with your protection!(3x)\nArchangel Zadkiel, bath me completely with the transmuting violet light,and clean and cure all my body. Archangel Zadkiel and Amethysy!(9x)");
                property var photoUrlguardianAngel : "https://en.wikipedia.org/wiki/Guardian_angel"
                property var colorguardianAngel : i18n.tr("Color: not specified")
                property var descguardianAngel : i18n.tr("It is very likely that, as a child, we had the Guardian Angel. It is very common, at least in our culture Judeo-Christian. Certainly, many of us prayed at night, before sleeping, the prayer that our parents, grandparents or an uncle or aunt taught us")
                property var prayerguardianAngel : i18n.tr("Guardian Angel, Sweet company,Don't strip me,Not by night, not by day.If you forsake me. What will become of me? Guardian Angel Pray to God for me.");

                selectedIndex: -1 // keeps selection clean on mainPage.onCompleted()
                
                function resetIndex(){this.selectedIndex = -1} // clean the selection on pageStack.pop()
                signal photoSource (string wikiUrl)
                signal headerNameSender (string title)
                signal photoPathSender (string path)
                signal favColorSender (string color)
                signal descSender (string desc)
                signal prayerSender (string prayer)

                onSelectedIndexChanged:{
                    switch (selectedIndex) {
                        case 0:
                            console.log(selectedIndex);
                            pageStack.push(Qt.resolvedUrl("ViewPage.qml"));
                            headerNameSender(i18n.tr("Archangel Jophiel"));
                            photoPathSender("./img/img_jophiel.png");
                            photoSource(photoUrlJophiel);
                            favColorSender(colorJophiel);
                            descSender(descJophiel);
                            prayerSender(prayerJophiel);
                            resetIndex();
                            break;
                        case 1:
                            console.log(selectedIndex);
                            pageStack.push(Qt.resolvedUrl("ViewPage.qml"));
                            headerNameSender(i18n.tr("Archangel Chamuel"));
                            photoPathSender("./img/img_chamuel.png");
                            photoSource(photoUrlChamuel);
                            favColorSender(colorChamuel);
                            descSender(descChamuel);
                            prayerSender(prayerChamuel);
                            resetIndex();
                            break;
                        case 2:
                            console.log(selectedIndex);
                            pageStack.push(Qt.resolvedUrl("ViewPage.qml"));
                            headerNameSender(i18n.tr("Archangel Michael"));
                            photoPathSender("./img/img_michael.png");
                            photoSource(photoUrlMichael);
                            favColorSender(colorMichael);
                            descSender(descMichael);
                            prayerSender(prayerMichael);
                            resetIndex();
                            break;
                        case 3:
                            console.log(selectedIndex);
                            pageStack.push(Qt.resolvedUrl("ViewPage.qml"));
                            headerNameSender(i18n.tr("Archangel Raphael"));
                            photoPathSender("./img/img_raphael.png");
                            photoSource(photoUrlRaphael);
                            favColorSender(colorRaphael);
                            descSender(descRaphael);
                            prayerSender(prayerRaphael);
                            resetIndex();
                            break;
                        case 4:
                            console.log(selectedIndex);
                            pageStack.push(Qt.resolvedUrl("ViewPage.qml"));
                            headerNameSender(i18n.tr("Archangel Uriel"));
                            photoPathSender("./img/img_uriel.png");
                            favColorSender(colorUriel)
                            photoSource(photoUrlUriel);
                            descSender(descUriel);
                            prayerSender(prayerUriel);
                            resetIndex();
                            break;
                        case 5:
                            console.log(selectedIndex);
                            pageStack.push(Qt.resolvedUrl("ViewPage.qml"));
                            headerNameSender(i18n.tr("Archangel Gabriel"));
                            photoPathSender("./img/img_gabriel.png");
                            favColorSender(colorGabriel)
                            photoSource(photoUrlGabriel);
                            descSender(descGabriel);
                            prayerSender(prayerGabriel);
                            resetIndex();
                            break;
                        case 6:
                            console.log(selectedIndex);
                            pageStack.push(Qt.resolvedUrl("ViewPage.qml"));
                            headerNameSender(i18n.tr("Archangel Zadkiel"));
                            photoPathSender("./img/img_zadkiel.png");
                            favColorSender(colorZadkiel)
                            photoSource(photoUrlZadkiel);
                            descSender(descZadkiel);
                            prayerSender(prayerZadkiel);
                            resetIndex();
                            break;
                        case 7:
                            console.log(selectedIndex);
                            pageStack.push(Qt.resolvedUrl("ViewPage.qml"));
                            headerNameSender(i18n.tr("Archangel Guardian Angel"));
                            photoPathSender("./img/img_guardianAngel.png");
                            favColorSender(colorguardianAngel)
                            photoSource(photoUrlguardianAngel);
                            descSender(descguardianAngel);
                            prayerSender(prayerguardianAngel);
                            resetIndex();
                            break;
                        default:
                            console.log("index Reseted");
                            break;
                    } 
                }
            }
        }
    }
    }    
}