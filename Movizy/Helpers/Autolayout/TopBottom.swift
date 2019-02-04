import UIKit.UIView

public extension ViewConstraintErasure where Self: ViewConstraintProtocol, Self.ViewType: UIView {
    
    static func top(bottomOf parent: UIView, offset: CGFloat) -> Self {
        return Self { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            let constraint = view.topAnchor.constraint(equalTo: parent.bottomAnchor, constant: offset)
            NSLayoutConstraint.activate([constraint])
            return view
        }
    }
    
    static func top(bottomOf parent: UIView) -> Self {
        return top(bottomOf: parent, offset: 0)
    }
}
