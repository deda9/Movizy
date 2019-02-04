import UIKit.UIView

public extension ViewConstraintErasure where Self: ViewConstraintProtocol, Self.ViewType: UIView {
    
    static func matchParent(_ parent: UIView) -> Self {
        return Self { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            let offset: CGFloat = 0.0
            let constraintTop = view.leftAnchor.constraint(equalTo: parent.leftAnchor, constant: offset)
            let constraintBottom = view.rightAnchor.constraint(equalTo: parent.rightAnchor, constant: offset)
            let constraintLeft = view.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: offset)
            let constraintRight = view.topAnchor.constraint(equalTo: parent.topAnchor, constant: offset)
            NSLayoutConstraint.activate([constraintTop, constraintBottom, constraintLeft, constraintRight])
            return view
        }
    }
}
