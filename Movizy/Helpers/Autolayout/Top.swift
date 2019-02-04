import UIKit.UIView

public extension ViewConstraintErasure where Self: ViewConstraintProtocol, Self.ViewType: UIView {
    
    // MARK: - Top of
    static func top(of parent: UIView, offset: CGFloat, applySafeArea: Bool = true) -> Self {
        return Self { view in
            view.translatesAutoresizingMaskIntoConstraints = false
            var topConstraint: NSLayoutConstraint
            
            if applySafeArea {
                if #available(iOS 11, *) {
                    topConstraint = view.topAnchor.constraint(equalTo: parent.safeAreaLayoutGuide.topAnchor, constant: offset)
                } else {
                    topConstraint = view.topAnchor.constraint(equalTo: parent.layoutMarginsGuide.topAnchor, constant: offset)
                }
            } else {
                topConstraint = view.topAnchor.constraint(equalTo: parent.topAnchor, constant: offset)
            }
            
            NSLayoutConstraint.activate([topConstraint])
            return view
        }
    }
    
    static func top(of parent: UIView, applySafeArea: Bool = true) -> Self {
        return top(of: parent, offset: 0, applySafeArea: applySafeArea)
    }
}
