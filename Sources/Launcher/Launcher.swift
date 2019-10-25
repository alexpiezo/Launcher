import AppKit
import Foundation
import ServiceManagement

public struct Launcher {
    public static var debug = false
    
    public static func launch(bundleID: String, AppName: String) {
        
        guard  NSWorkspace.shared.runningApplications.contains(where: { $0.bundleIdentifier == bundleID })  == false else{
            NSApp.terminate(nil)
            return
        }
                
        let path = Bundle.main.bundlePath as NSString
        var components = path.pathComponents
        components.removeLast()
        components.removeLast()
        components.removeLast()
        components.append("MacOS")
        components.append(AppName)
        
        let mainPath = NSString.path(withComponents: components)
        let result = NSWorkspace.shared.launchApplication(mainPath)
        
        if debug {
            notify("Launch success: \(result)", text: mainPath)
        }
        
        NSApp.terminate(nil)
    }
    
    public static func enableLaunchAtLogin() -> Bool {
        let result = SMLoginItemSetEnabled("\(Bundle.main.bundleIdentifier!)-Launcher" as CFString, true)
        if debug {
            notify("Enable success :\(result)", text: "\(Bundle.main.bundleIdentifier!)-Launcher")
        }
        return result
    }
    
    public static func disableLaunchAtLogin() -> Bool {
        let result = SMLoginItemSetEnabled("\(Bundle.main.bundleIdentifier!)-Launcher" as CFString, false)
        if debug {
            notify("Disable success :\(result)", text: "\(Bundle.main.bundleIdentifier!)-Launcher")
        }
        return result
    }
    
    private static func notify(_ title: String, text: String) {
        let notification = NSUserNotification()
        notification.title = title
        notification.informativeText = text
        NSUserNotificationCenter.default.deliver(notification)
    }
}
