class SearchMovieViewPresenter: VIPERPresenter {
    var inputs: SearchMovieViewInteractorInputs? {
        return interactor as? SearchMovieViewInteractorInputs
    }
    
    var outputs: SearchMovieViewInputs? {
        return viewController as? SearchMovieViewInputs
    }
}

extension SearchMovieViewPresenter: SearchMovieViewPresenterInputs {
    func loadMoreMovies() {
        self.inputs?.loadMoreMovies()
    }
    
    func searchMovies(_ text: String) {
        guard !text.isEmpty else {
            return
        }
        self.inputs?.searchMovie(text)
    }
}

extension SearchMovieViewPresenter: SearchMovieViewInteractorOutputs {
    func onSuccessLoadMoreMovies(_ movies: [Movie]) {
        self.outputs?.onSuccessLoadMoreMovies(movies)
    }
    
    func onSearchingMovies() {
        self.outputs?.onSearchingMovies()
    }
    
    func onErrorSearchingMovies() {
        self.outputs?.onErrorSearchingMovies()
    }
    
    func onSuccessSearchMovies(_ movies: [Movie]) {
        self.outputs?.onSuccessSearchMovies(movies)
    }
}
