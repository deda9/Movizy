import UIKit

class Animator {
    private lazy var animationsList: AnimationLinkedList = AnimationLinkedList()
    
    init(_ action: @escaping Animation.Action) {
        let animation = Animation(action)
        self.animationsList.append(animation)
    }
    
    @discardableResult
    func then(_ action: @escaping Animation.Action) -> Self {
        let animation = Animation(action)
        self.animationsList.append(animation)
        return self
    }
    
    @discardableResult
    func delay(_ duration: Double) -> Self {
        self.animationsList.tail?.value.defaults.delay = duration
        return self
    }
    
    @discardableResult
    func duration(_ duration: Double) -> Self {
        self.animationsList.tail?.value.defaults.duration = duration
        return self
    }
    
    @discardableResult
    public func options(_ option: UIView.AnimationOptions) -> Self {
        self.animationsList.tail?.value.defaults.options.insert(option)
        return self
    }
    
    @discardableResult
    public func springDamping(_ damping: CGFloat) -> Animator {
        self.animationsList.tail?.value.defaults.springDamping = damping
        return self
    }
    
    public func initialVelocity(_ velocity: CGFloat) -> Animator {
        self.animationsList.tail?.value.defaults.initialVelocity = velocity
        return self
    }
    
    func completion(_ completion: Animation.Completion? = nil) -> Animator {
        self.animationsList.tail?.value.completion = completion
        return self
    }
    
}

extension Animator {
    func sync() {
        guard let current = self.animationsList.head else {
            return
        }
        self.animate(current.value) {
            guard let next = self.animationsList.head?.next else {
                return
            }
            self.animationsList.head = next
            self.sync()
        }
    }
    
    func async() {
        guard let current = self.animationsList.head else {
            return
        }
        self.animate(current.value)
        
        guard let next = self.animationsList.head?.next else {
            return
        }
        self.animationsList.head = next
        async()
    }
    
    private func animate(_ animation: Animation, whenDone: Animation.Done = nil) {
        guard animation.defaults.initialVelocity != 0.0, animation.defaults.springDamping != 0.0 else {
            animateNoraml(animation, whenDone: whenDone)
            return
        }
        animateWithSpringDamping(animation, whenDone: whenDone)
    }
    
    private func animateNoraml(_ animation: Animation, whenDone: Animation.Done = nil) {
        let completion: Animation.Completion = { isFinished in
            animation.completion?(true)
            if isFinished {
                whenDone?()
            }
        }
        
        UIView.animate(withDuration: animation.defaults.duration,
                       delay: animation.defaults.delay,
                       options: animation.defaults.options,
                       animations: animation.action,
                       completion: completion)
    }
    
    private func animateWithSpringDamping(_ animation: Animation, whenDone: Animation.Done = nil) {
        let completion: Animation.Completion = { _ in
            animation.completion?(true)
            whenDone?()
        }
        
        UIView.animate(withDuration: animation.defaults.duration,
                       delay: animation.defaults.delay,
                       usingSpringWithDamping: animation.defaults.springDamping,
                       initialSpringVelocity: animation.defaults.initialVelocity,
                       options: animation.defaults.options,
                       animations: animation.action,
                       completion: completion)
    }
}
