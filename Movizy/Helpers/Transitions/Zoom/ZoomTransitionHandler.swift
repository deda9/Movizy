import UIKit

class ZoomTransitionHandler: NSObject, UIViewControllerTransitioningDelegate, TransitionHandler {
    
    private var transition: ZoomTransition
    private var dismissalTransition: ZoomDismissalTransition
    
    init(fromImageView: UIImageView, toImageView: UIImageView) {
        self.transition = ZoomTransition(fromImageView, toImageView: toImageView)
        self.dismissalTransition = ZoomDismissalTransition(fromImageView: toImageView,
                                                           toImageView: fromImageView)
    }
    
    func animationController(forPresented presented: UIViewController,
                             presenting: UIViewController,
                             source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return transition
    }
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return dismissalTransition
    }
}
