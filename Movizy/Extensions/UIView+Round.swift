import UIKit.UIView

extension UIView {
    func round(by value: CGFloat) {
        self.layer.cornerRadius = value
        self.clipsToBounds = true
    }
    
    public func centerCrop() {
        contentMode = .scaleAspectFill
        clipsToBounds = true
    }
}
