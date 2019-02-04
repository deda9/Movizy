import Foundation.NSObject

class VIPERInteractor: NSObject {
    weak var router: VIPERRouter?
    weak var presenter: VIPERPresenter?
    
    required override init() {
        super.init()
    }
}
