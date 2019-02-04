import UIKit.UIView

public extension ViewConstraintErasure where Self: ViewConstraintProtocol, Self.ViewType: UIView {
    
    static func bottom(of parent: UIView, offset: CGFloat) -> Self {
        return Self { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            var bottomConstraint: NSLayoutConstraint

            if #available(iOS 11, *) {
                bottomConstraint = view.bottomAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.bottomAnchor, constant: offset)

            } else {
                bottomConstraint = view.bottomAnchor.constraint(equalTo: parent.layoutMarginsGuide.bottomAnchor, constant: offset)
            }
            
            NSLayoutConstraint.activate([bottomConstraint])
            return view
        }
    }
    
    static func bottom(of parent: UIView) -> Self {
        return bottom(of: parent, offset: 0)
    }
}
