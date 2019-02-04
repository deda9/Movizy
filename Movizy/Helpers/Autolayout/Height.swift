import UIKit.UIView

public extension ViewConstraintErasure where Self: ViewConstraintProtocol, Self.ViewType: UIView {
    
    // MARK: - Height
    static func height(_ height: CGFloat) -> Self {
        return Self { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            let constraint = view.heightAnchor.constraint(equalToConstant: height)
            NSLayoutConstraint.activate([constraint])
            return view
        }
    }
}
