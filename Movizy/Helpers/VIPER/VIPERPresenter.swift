import UIKit.UIViewController
import Foundation.NSObject

class VIPERPresenter: NSObject {
    weak var interactor: VIPERInteractor?
    weak var viewController: UIViewController?
    
    required override init() {
        super.init()
    }
}
