import UIKit.UINavigationController

class MoviesListViewRouter: VIPERRouter {

    func openMovieDetailsView(_ movie: Movie, configuration: ZoomTransitionConfiguration) {
        let view = MovieDetailsViewController(movie, configuration: configuration)
        self.viewController?.present(view, animated: true, completion: nil)
    }
    
    func openSearchMoviesView(creator: SearchMovieCreator, transition: TransitionHandler) {
        
        let view = SearchMovieViewController()
        let nav = UINavigationController()
        nav.transitioningDelegate = transition
        nav.modalPresentationStyle = .custom
        nav.viewControllers = [view]
        view.viperBuilder = creator.create(parent: view)
        self.viewController?.present(nav, animated: true, completion: nil)
    }
}
