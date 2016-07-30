import Cocoa

enum Key : UInt16 {
	case arrowLeft = 123 
	case arrowRight = 124
	case arrowDown = 125
	case arrowUp = 126
}

struct Vec2d {
	var x : Double = 0
	var y : Double = 0
}

func clamp(_ val: Double, min: Double, max: Double) -> Double {
	if(min > val) {
		return min
	} else if(max < val) {
		return max
	} else {
		return val
	}
}

func clamp(_ vec: Vec2d, min: Vec2d, max: Vec2d) -> Vec2d {
	return Vec2d(x: clamp(vec.x, min: min.x, max: max.x), y: clamp(vec.y, min: min.y, max: max.y))
}

func +(lhs: Vec2d, rhs: Vec2d) -> Vec2d {
	return Vec2d(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
}

class MainView : NSView {
	override var acceptsFirstResponder: Bool { return true }

	var position = Vec2d(x: 100, y: 100)

	override func draw(_ dirtyRect: NSRect) {
		NSColor.gray().set()

		NSBezierPath.fill(dirtyRect)


		NSColor.black().set()

		NSBezierPath.fill(CGRect(x: CGFloat(position.x)-10, y: self.frame.height-CGFloat(position.y)-10, width: 20, height: 20))
	}


	override func keyDown(_ event: NSEvent) {
		guard let key = Key(rawValue: event.keyCode) else {
			return
		}

		let delta : Vec2d
		switch key {
			case .arrowLeft: delta = Vec2d(x: -20, y:0)
			case .arrowRight: delta = Vec2d(x: 20, y:0)
			case .arrowUp: delta = Vec2d(x: 0, y:-20)
			case .arrowDown: delta = Vec2d(x: 0, y:20)
		}

		position = clamp(position + delta, min: Vec2d(x: 50, y: 50), max: Vec2d(x: Double(self.frame.width)-50, y: Double(self.frame.height)-50))

		needsDisplay = true
	}
}