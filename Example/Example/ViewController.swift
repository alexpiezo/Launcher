import Cocoa
import Launcher

class ViewController: NSViewController {
    @objc dynamic var launcher = Launcher.shared

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var representedObject: Any? {
        didSet {
            // Update the view, if already loaded.
        }
    }
}

