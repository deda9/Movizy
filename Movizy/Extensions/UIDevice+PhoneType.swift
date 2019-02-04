import UIKit.UIDevice

extension UIDevice {
    static var isIphoneX: Bool {
        return UIScreen.main.nativeBounds.height >= 1136
    }
}
