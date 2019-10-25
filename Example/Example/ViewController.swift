import Cocoa
import Launcher

class ViewController: NSViewController {
    @objc dynamic var launchAtLogin: Bool = true {
        didSet {
            if launchAtLogin {
                _ = Launcher.enableLaunchAtLogin()
            } else {
                _ = Launcher.disableLaunchAtLogin()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
}

