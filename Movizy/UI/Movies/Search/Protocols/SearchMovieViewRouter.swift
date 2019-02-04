class SearchMovieViewRouter: VIPERRouter {
    func openMovieDetailsView(_ movie: Movie, configuration: ZoomTransitionConfiguration) {
        let view = MovieDetailsViewController(movie, configuration: configuration)
        self.viewController?.present(view, animated: true, completion: nil)
    }
    
    func dismissSearchMovieView() {
        self.viewController?.navigationController?.dismiss(animated: true, completion: nil)
    }
}
