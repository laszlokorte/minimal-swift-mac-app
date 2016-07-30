import Cocoa

extension NSWindow {
    public func setFrameOriginToPositionWindowInCenterOfScreen() {
        if let screenSize = screen?.frame.size {
            self.setFrameOrigin(NSPoint(x: (screenSize.width-frame.size.width)/2, y: (screenSize.height-frame.size.height)/2))
        }
    }
}

class AppDelegate: NSObject, NSApplicationDelegate {
    var mainWindow: NSWindow?

    var title: String

    init(title: String) {
        self.title = title
    }

    func quit() {
    	NSApplication.shared().terminate(self)
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {

    	// Menubar
    	let menuBar = NSMenu(title: self.title)

    	// Main Menu
    	let appMenuParent = NSMenuItem(title: "Main", action: nil, keyEquivalent: "")
    	let appMenu = NSMenu(title: "About \(self.title)");
    	let appInfoItem = NSMenuItem(title: "Info", action: nil, keyEquivalent: "")
    	appMenu.addItem(appInfoItem)
    	let appQuitItem = NSMenuItem(title: "Quit \(self.title)", action: #selector(quit), keyEquivalent: "q")
    	appQuitItem.keyEquivalentModifierMask = [.command]
    	appMenu.addItem(appQuitItem)
    	appMenuParent.submenu = appMenu
    	menuBar.addItem(appMenuParent)

    	
    	NSApplication.shared().menu = menuBar

        let window = NSWindow(contentRect: NSMakeRect(0, 0, 800, 500),
                              styleMask: [.titled, .closable, .miniaturizable, .fullSizeContentView],
                              backing: .buffered,
                              defer: true)
        window.orderFrontRegardless()
        self.mainWindow = window

        window.setFrameOriginToPositionWindowInCenterOfScreen()
        window.title = self.title
        window.contentView = MainView()

        window.makeKeyAndOrderFront(window)

        NSApp.activateIgnoringOtherApps(true)
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ app: NSApplication) -> Bool {
        return true
    }
}