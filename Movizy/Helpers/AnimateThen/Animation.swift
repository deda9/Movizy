import UIKit

class Animation {
  
    typealias Action = () -> Void
    typealias Completion = (Bool) -> Void
    typealias Done = (() -> Void)?
    
    private(set) var action: Animation.Action
    var completion: Animation.Completion?
    
    var defaults = Defaults()
    
    init(_ action: @escaping Animation.Action) {
        self.action = action
    }
}

// MARK: - Helpers
extension Animation {
    struct Defaults {
        var duration: Double = 0.5
        var options: UIView.AnimationOptions = []
        var delay: Double = 0.0
        var springDamping: CGFloat = 0.0
        var initialVelocity: CGFloat = 0.0
    }
}

func animate(_ action: @escaping Animation.Action) -> Animator {
    let animator = Animator(action)
    return animator
}

extension UIView {
    func animate(_ action: @escaping Animation.Action) -> Animator {
        let animator = Animator(action)
        return animator
    }
}
