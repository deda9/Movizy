import UIKit.UIViewController
import Foundation.NSObject

class VIPERBuilder<Interactor: VIPERInteractor, Presenter: VIPERPresenter, Router: VIPERRouter>: NSObject {
    private(set) var interactor: Interactor
    private(set) var presenter: Presenter
    private(set) var router: Router
    
    init(controller: UIViewController) {
        self.interactor = Interactor()
        self.presenter = Presenter()
        self.router = Router()
        super.init()
        
        self.interactor.presenter = self.presenter
        self.interactor.router = self.router
        
        self.presenter.viewController = controller
        self.presenter.interactor = self.interactor
        
        self.router.viewController = controller
    }
}
