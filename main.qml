import QtQuick 1.1
import com.nokia.meego 1.1

PageStackWindow {
    id: window

    Component.onCompleted: {
        var paths = fileBrowserUtils.pathsToHome();
        console.log(paths)
        for (var i = 0; i < paths.length; ++i) {
            var path = paths[i]
            console.log(path)
            cdInto(path, true)
        }
        console.log(paths)
    }

    // TODO: immediate should not be a bool, should take a hash of params.
    // root should be set by a param, not by knowledge of /. that is not x-platform!
    function cdInto(path, immediate)
    {
        var component = Qt.createComponent("Directory.qml");
        if (component.status == Component.Ready) {
            // TODO: error handling
            var dirPage = component.createObject(window, {"path": path, "isRootDirectory": path == "/" ? true : false});
            pageStack.push(dirPage, {}, immediate)
        }
    }
}