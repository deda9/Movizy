import UIKit.UIView

public extension ViewConstraintErasure where Self: ViewConstraintProtocol, Self.ViewType: UIView {
    
    static func left(rightOf parent: UIView, offset: CGFloat) -> Self {
        return Self { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            let constraint = view.leftAnchor.constraint(equalTo: parent.rightAnchor, constant: offset)
            NSLayoutConstraint.activate([constraint])
            return view
        }
    }
    
    static func left(rightOf parent: UIView) -> Self {
        return left(rightOf: parent, offset: 0)
    }
}
