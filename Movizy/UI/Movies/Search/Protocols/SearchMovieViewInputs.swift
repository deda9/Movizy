protocol SearchMovieViewInputs {
    func onSearchingMovies()
    func onErrorSearchingMovies()
    func onSuccessSearchMovies(_ movies: [Movie])
    func onSuccessLoadMoreMovies(_ movies: [Movie])
}
