import UIKit.UIView

public extension UIView {
    func setConstraint(_ constraint: ViewConstraint) {
        _ = constraint.constraint(self)
    }
}

public func +<View: ViewConstraintProtocol>(lhs: View, rhs: View) -> View {
    return View { view in
        return rhs.constraint(lhs.constraint(view))
    }
}
