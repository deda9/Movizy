import UIKit.UIButton

class IncreaseHitAreaButton: UIButton {

    private let margin: CGFloat = 15
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        let area = bounds.insetBy(dx: -margin, dy: -margin)
        return area.contains(point)
    }
}
