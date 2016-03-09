import QtQuick 2.0
import Ubuntu.Components 1.1
import Ubuntu.Components.ListItems 1.0 as ListItem

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "sortfiltermodel.liu-xiao-guo"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: units.gu(60)
    height: units.gu(85)

    Page {
        title: i18n.tr("sortfiltermodel")

        ListModel {
            id: movies
            ListElement {
                title: "Esign"
                producer: "Chris Larkee"
            }
            ListElement {
                title: "Elephants Dream"
                producer: "Blender"
            }
            ListElement {
                title: "Big Buck Bunny"
                producer: "blender"
            }
        }

        SortFilterModel {
            id: sortedMovies
            model: movies
            sort.property: "title"
            sort.order: Qt.DescendingOrder
            filter.property: "producer"
            filter.pattern: /blender/i
        }

        ListView {
            model: sortedMovies
            anchors.fill: parent
            delegate: ListItem.Subtitled {
                text: title
                subText: producer
            }
            section.delegate: ListItem.Header { text: i18n.tr(section) }
            section.property: "title"
            section.criteria: ViewSection.FirstCharacter
        }
    }
}

