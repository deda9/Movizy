import UIKit.UIView

public extension ViewConstraintErasure where Self: ViewConstraintProtocol, Self.ViewType: UIView {
    
    // MARK: - Center
    static func center(in parent: UIView) -> Self {
        return Self { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            let centerXConstraint = view.centerXAnchor.constraint(equalTo: parent.centerXAnchor, constant: 0)
            let centerYConstraint = view.centerYAnchor.constraint(equalTo: parent.centerYAnchor, constant: 0)
            NSLayoutConstraint.activate([centerXConstraint, centerYConstraint])
            return view
        }
    }
    
    // MARK: - CenterX
    static func centerX(in parent: UIView, offset: CGFloat) -> Self {
        return Self { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            let centerXConstraint = view.centerXAnchor.constraint(equalTo: parent.centerXAnchor, constant: offset)
            NSLayoutConstraint.activate([centerXConstraint])
            return view
        }
    }
    
    static func centerX(in parent: UIView) -> Self {
        return centerX(in: parent, offset: 0)
    }
    
    // MARK: - CenterY
    static func centerY(in parent: UIView, offset: CGFloat) -> Self {
        return Self { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            let centerYConstraint = view.centerYAnchor.constraint(equalTo: parent.centerYAnchor, constant: offset)
            NSLayoutConstraint.activate([centerYConstraint])
            return view
        }
    }
    
    static func centerY(in parent: UIView) -> Self {
        return centerY(in: parent, offset: 0)
    }
}
