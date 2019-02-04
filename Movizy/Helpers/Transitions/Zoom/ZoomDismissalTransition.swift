import UIKit

class ZoomDismissalTransition: NSObject {
    
    private let fromImageView: UIImageView
    private var toImageView: UIImageView
    private var animatableImageview = UIImageView()
    private let duration = 0.3
    
    init(fromImageView: UIImageView, toImageView: UIImageView) {
        self.fromImageView = fromImageView
        self.toImageView = toImageView
        super.init()
    }
}

extension ZoomDismissalTransition: UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return duration
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let fromViewController = transitionContext.viewController(forKey: .from) else {
            return
        }
        
        let containerView = transitionContext.containerView
        
        let image = fromImageView.image ?? toImageView.image
        animatableImageview.image = image
        animatableImageview.frame = self.fromImageView.superview?.convert(self.fromImageView.frame, to: nil) ?? self.fromImageView.frame
        animatableImageview.contentMode = fromImageView.contentMode
        containerView.addSubview(animatableImageview)
        
        fromViewController.view.isHidden = true
        
        //swiftlint:disable closure_end_indentation
        animate {
            self.animatableImageview.contentMode = self.toImageView.contentMode
            self.animatableImageview.transform = .identity
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
