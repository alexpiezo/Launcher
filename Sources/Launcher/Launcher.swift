import AppKit
import Foundation
import ServiceManagement

public class Launcher: NSObject {
    public static var shared = Launcher()
    public var debug = false
    private let launcherBundleId = "\(Bundle.main.bundleIdentifier!)-Launcher"
    
    @objc public dynamic var isEnabled: Bool {
        get {
            guard let jobs = (SMCopyAllJobDictionaries(kSMDomainUserLaunchd).takeRetainedValue() as? [[String: AnyObject]]) else {
                return false
            }
            
            let job = jobs.first { $0["Label"] as! String == launcherBundleId }
            return job?["OnDemand"] as? Bool ?? false
        }
        set {
            willChangeValue(forKey: "isEnabled")
            let result = SMLoginItemSetEnabled(launcherBundleId as CFString, newValue)
            if debug {
                notify("\(newValue ? "Enable" : "Disable") success :\(result)", text: "\(Bundle.main.bundleIdentifier!)-Launcher")
            }
            didChangeValue(forKey: "isEnabled")
        }
    }
    
    public func launch(bundleID: String, AppName: String) {
        guard NSWorkspace.shared.runningApplications.contains(where: { $0.bundleIdentifier == bundleID }) == false else {
            NSApp.terminate(nil)
            return
        }
        
        let path = Bundle.main.bundlePath as NSString
        var components = path.pathComponents
        components.removeLast(3)
        components.append("MacOS")
        components.append(AppName)
        
        let mainPath = NSString.path(withComponents: components)
        let result = NSWorkspace.shared.launchApplication(mainPath)
        
        if debug {
            notify("Launch success: \(result)", text: mainPath)
        }
        
        NSApp.terminate(nil)
    }
    
    private func notify(_ title: String, text: String) {
        let notification = NSUserNotification()
        notification.title = title
        notification.informativeText = text
        NSUserNotificationCenter.default.deliver(notification)
    }
}
