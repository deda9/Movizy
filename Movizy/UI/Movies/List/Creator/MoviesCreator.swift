import UIKit.UIViewController

class MoviesCreator: Creator {
    func create(parent: UIViewController) -> VIPERBuilder<MoviesListViewInteractor, MoviesListViewPresenter, MoviesListViewRouter> {
        let container = AppDelegate.shared.container
        let viperType = VIPERBuilder<MoviesListViewInteractor, MoviesListViewPresenter, MoviesListViewRouter>.self
        
        if let viper = container.resolve(viperType) {
            return viper
        } else {
            let viper = VIPERBuilder<MoviesListViewInteractor, MoviesListViewPresenter, MoviesListViewRouter>(controller: parent)
            container.register(viperType) { _ in return viper }
            return viper
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
