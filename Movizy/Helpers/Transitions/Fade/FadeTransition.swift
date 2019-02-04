import UIKit

class FadeTransition: NSObject, Transition {
    
    enum Mode {
        case present
        case dismiss
    }
    
    var duration: TimeInterval = 0.4
    var transitionMode: FadeTransition.Mode = .present
}

extension FadeTransition: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromViewController = transitionContext.viewController(forKey: .from) else {
            return
        }
        guard let toViewController = transitionContext.viewController(forKey: .to) else {
            return
        }
        
        let containerView = transitionContext.containerView
        
        switch self.transitionMode {
        case .present:
            animatePresent(toViewController, containerView, transitionContext)
        case .dismiss:
            animteDismiss(fromViewController, transitionContext)
        }
    }
    
    fileprivate func animatePresent(_ toViewController: UIViewController,
                                    _ containerView: UIView,
                                    _ transitionContext: UIViewControllerContextTransitioning) {
        toViewController.view.alpha = 0
        containerView.addSubview(toViewController.view)
        animate { toViewController.view.alpha = 1 }
            .duration(self.duration)
            .completion { _ in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
            .async()
    }
    
    fileprivate func animteDismiss(_ fromViewController: UIViewController,
                                   _ transitionContext: UIViewControllerContextTransitioning) {
        fromViewController.view.alpha = 1
        animate { fromViewController.view.alpha = 0 }
            .duration(self.duration)
            .completion { _ in
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
            }
            .async()
    }
}
