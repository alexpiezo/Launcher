import Cocoa
import Launcher

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        Launcher.shared.debug = true
        Launcher.shared.launch(bundleID: "my.piezo.Example", AppName: "Example")
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }


}

