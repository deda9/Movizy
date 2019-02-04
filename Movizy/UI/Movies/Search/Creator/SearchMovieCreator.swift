import UIKit.UIViewController

class SearchMovieCreator: Creator {
    
    func create(parent: UIViewController) -> VIPERBuilder<SearchMovieViewInteractor, SearchMovieViewPresenter, SearchMovieViewRouter> {
        let viper = VIPERBuilder<SearchMovieViewInteractor, SearchMovieViewPresenter, SearchMovieViewRouter>(controller: parent)
        viper.interactor.throttler = create()
        return viper
    }
    
    func create() -> Throttler {
        let container = AppDelegate.shared.container
        let throttlerType = Throttler.self
        
        if let throttler = container.resolve(throttlerType) {
            return throttler
        } else {
            let throttler = Throttler(maxInterval: 0.9)
            container.register(throttlerType) { _ in return throttler }
            return throttler
        }
    }
    
    func create() -> FadeTransitionHandler {
        let container = AppDelegate.shared.container
        let transitionType = FadeTransitionHandler.self
        
        if let transition = container.resolve(transitionType) {
            return transition
        } else {
            let transition = FadeTransitionHandler()
            container.register(transitionType) { _ in return transition }
            return transition
        }
    }
}
