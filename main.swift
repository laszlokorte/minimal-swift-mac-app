import Cocoa

autoreleasepool {
  let app = NSApplication.shared()
  app.setActivationPolicy(.regular)

  let delegate = AppDelegate(title: "My Minimal App")
  app.delegate = delegate

  app.run()
}