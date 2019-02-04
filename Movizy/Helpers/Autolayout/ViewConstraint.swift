import UIKit.UIView

public struct ViewConstraint: ViewConstraintProtocol {
  
    public typealias ViewType = UIView
    public var constraint: Constraint
  
    public init(constraint: @escaping Constraint) {
        self.constraint = constraint
    }
}

public protocol ViewConstraintErasure {}

extension ViewConstraint: ViewConstraintErasure {}
