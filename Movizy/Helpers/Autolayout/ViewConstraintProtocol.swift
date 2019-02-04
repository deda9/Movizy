
public protocol ViewConstraintProtocol {
    associatedtype ViewType
    
    typealias Constraint = (ViewType) -> ViewType
    var constraint: Constraint { get }
    
    init(constraint: @escaping Constraint)
}
