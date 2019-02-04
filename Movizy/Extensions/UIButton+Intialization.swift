import UIKit.UIButton

extension UIButton {
    static var close: IncreaseHitAreaButton {
        let close = IncreaseHitAreaButton()
        close.setImage(ImageResource.closeButton.image?.withRenderingMode(.alwaysTemplate), for: .normal)
        close.tintColor = UIColor.gray
        return close
    }
}
