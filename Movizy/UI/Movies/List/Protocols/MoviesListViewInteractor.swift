import Foundation

class MoviesListViewInteractor: VIPERInteractor {
    private var currentPage: Int = 1
    private var isLoadingMore: Bool = false

    var outputs: MoviesListViewInteractorOutputs? {
        return presenter as? MoviesListViewInteractorOutputs
    }
}

extension MoviesListViewInteractor: MoviesListViewInteractorInputs {
    @objc func loadPopluarMovies() {
        loadPopularMovies(page: 1)
    }
    
   @objc func loadMorePopluarMovies() {
        guard !isLoadingMore else {
            return
        }
        self.isLoadingMore = true
        self.currentPage += 1
        loadPopularMovies(page: self.currentPage)
    }
    
    private func loadPopularMovies(page: Int) {
        self.notifyLoadingPopularMoviews()
        
        NetworkService<MoviesResponse>.execute(MoviesAPIs.getPopularList(page)) { result in
            switch result {
            case .success(let response):
                weakify(self, self.onSuccessLoadPopularMoviews(response))()
            case .failure(let error):
                weakify(self, self.onFailedLoadPopularMoviews(error))()
            }
        }
    }
    
    private func notifyLoadingPopularMoviews() {
        self.outputs?.onLoadingMovies()
    }
    
    private func onSuccessLoadPopularMoviews(_ response: MoviesResponse) {
        self.outputs?.onSuccessLoadMovies(response.moviesList)
        self.isLoadingMore = false
    }
    
    private func onFailedLoadPopularMoviews(_ error: Error) {
        self.outputs?.onErrorLoadingMovies()
        self.isLoadingMore = false
    }
}
