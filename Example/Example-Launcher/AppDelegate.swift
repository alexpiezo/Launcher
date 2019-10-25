import Cocoa
import Launcher

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        Launcher.debug = false
        Launcher.launch(bundleID: "my.piezo.Example", AppName: "Example")
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

