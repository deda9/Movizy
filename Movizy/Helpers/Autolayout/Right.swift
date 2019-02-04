import UIKit.UIView

public extension ViewConstraintErasure where Self: ViewConstraintProtocol, Self.ViewType: UIView {
    
    // MARK: - Right of
    static func right(of parent: UIView, offset: CGFloat) -> Self {
        return Self { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            let constraint = view.rightAnchor.constraint(equalTo: parent.rightAnchor, constant: offset)
            NSLayoutConstraint.activate([constraint])
            return view
        }
    }
    
    static func right(of parent: UIView) -> Self {
        return right(of: parent, offset: 0)
    }
}
