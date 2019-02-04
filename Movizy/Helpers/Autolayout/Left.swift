import UIKit.UIView

public extension ViewConstraintErasure where Self: ViewConstraintProtocol, Self.ViewType: UIView {
    
    // MARK: - Left of
    static func left(of parent: UIView, offset: CGFloat) -> Self {
        return Self { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            let constraint = view.leftAnchor.constraint(equalTo: parent.leftAnchor, constant: offset)
            NSLayoutConstraint.activate([constraint])
            return view
        }
    }
    
    static func left(of parent: UIView) -> Self {
        return left(of: parent, offset: 0)
    }
}
