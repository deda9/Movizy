import UIKit

class ZoomTransition: NSObject, Transition {
    
    enum Mode {
        case present
        case dismiss
    }
    
    var duration: TimeInterval = 0.4
    var transitionMode: FadeTransition.Mode = .present
    
    private let fromImageView: UIImageView!
    private let toImageView: UIImageView!
    fileprivate var animatableImageview = UIImageView()
    
    init(_ fromImageView: UIImageView, toImageView: UIImageView) {
        self.fromImageView = fromImageView
        self.toImageView = toImageView
    }
}

extension ZoomTransition: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: .to) else {
            return
        }
        
        let containerView = transitionContext.containerView
        
        let image = fromImageView.image
        animatableImageview.image = image
        animatableImageview.frame = self.fromImageView.superview?.convert(self.fromImageView.frame, to: nil) ?? self.fromImageView.frame
        animatableImageview.contentMode = fromImageView.contentMode
        
        toViewController.view.frame = containerView.frame
        containerView.addSubview(toViewController.view)
        containerView.addSubview(animatableImageview)
        
        toViewController.view.isHidden = false
        self.toImageView.isHidden = true
        
        //swiftlint:disable closure_end_indentation
        animate {
            self.animatableImageview.contentMode = self.toImageView.contentMode
            toViewController.view.isHidden = false
            self.animatableImageview.frame = self.toImageView.superview?.convert(self.toImageView.frame, to: nil) ?? self.toImageView.frame
            }
            .options([.curveEaseInOut])
            .duration(duration)
            .completion { _ in
                self.toImageView.isHidden = false
                self.animatableImageview.removeFromSuperview()
                transitionContext.completeTransition(true)
            }.async()
    }
}
