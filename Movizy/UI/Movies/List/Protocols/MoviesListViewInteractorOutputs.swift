protocol MoviesListViewInteractorOutputs: AnyObject {
    func onLoadingMovies()
    func onErrorLoadingMovies()
    func onSuccessLoadMovies(_ movies: [Movie])
}
