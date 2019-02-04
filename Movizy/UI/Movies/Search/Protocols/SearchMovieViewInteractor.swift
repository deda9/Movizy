class SearchMovieViewInteractor: VIPERInteractor {
    var throttler: Throttler!
    private var currentPage: Int = 1
    private var isLoadingMore: Bool = false
    private var searchText: String = ""
    
    var outputs: SearchMovieViewInteractorOutputs? {
        return presenter as? SearchMovieViewInteractorOutputs
    }
}

extension SearchMovieViewInteractor: SearchMovieViewInteractorInputs {
    func searchMovie(_ text: String) {
        self.throttler.throttle {
            doMainAsync { [weak self] in
                guard let strongSelf = self else {
                    return
                }
                strongSelf.searchText = text
                strongSelf.searchMovie(text, page: 1)
            }
        }
    }
    
    func loadMoreMovies() {
        guard !isLoadingMore else {
            return
        }
        self.isLoadingMore = true
        self.currentPage += 1
        searchMovie(self.searchText, page: self.currentPage)
    }
    
    private func searchMovie(_ text: String, page: Int) {
        self.notifySearchingMoviews()
        
        NetworkService<MoviesResponse>.execute(MoviesAPIs.searchMovie(text, page)) { result in
            switch result {
            case .success(let response):
                weakify(self, self.onSuccessSearchingMoviews(response))()
            case .failure(let error):
                weakify(self, self.onFailedSearchingMoviews(error))()
            }
        }
    }
    
    private func notifySearchingMoviews() {
        self.outputs?.onSearchingMovies()
    }
    
    private func onSuccessSearchingMoviews(_ response: MoviesResponse) {
        if self.isLoadingMore {
            self.outputs?.onSuccessLoadMoreMovies(response.moviesList)
            self.isLoadingMore = false
        } else {
            self.outputs?.onSuccessSearchMovies(response.moviesList)
        }
    }
    
    private func onFailedSearchingMoviews(_ error: Error) {
        self.outputs?.onErrorSearchingMovies()
        self.isLoadingMore = false
    }
}
