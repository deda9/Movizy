protocol MoviesListViewInputs: AnyObject {
    func onLoadingMovies()
    func onErrorLoadingMovies()
    func onSuccessLoadMovies(_ movies: [Movie])
}
