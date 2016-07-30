import Cocoa

class MainView : NSView {
	override func draw(_ dirtyRect: NSRect) {
		NSColor.gray().set()

		NSBezierPath.fill(dirtyRect)
	}
}