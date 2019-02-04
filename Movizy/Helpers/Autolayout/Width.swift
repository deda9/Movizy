import UIKit.UIView

public extension ViewConstraintErasure where Self: ViewConstraintProtocol, Self.ViewType: UIView {
    
    // MARK: - Width
    static func width(_ width: CGFloat) -> Self {
        return Self { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            let constraint = view.widthAnchor.constraint(equalToConstant: width)
            NSLayoutConstraint.activate([constraint])
            return view
        }
    }
}
