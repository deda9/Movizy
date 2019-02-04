import Foundation

class MoviesListViewPresenter: VIPERPresenter {
    var inputs: MoviesListViewInteractorInputs? {
        return interactor as? MoviesListViewInteractorInputs
    }
    
    var outputs: MoviesListViewInputs? {
        return viewController as? MoviesListViewInputs
    }
}

extension MoviesListViewPresenter: MoviesListViewPresenterInputs {
    @objc func viewDidLoad() {
        self.inputs?.loadPopluarMovies()
    }
    
    func loadMoreMovies() {
        self.inputs?.loadMorePopluarMovies()
    }
}

extension MoviesListViewPresenter: MoviesListViewInteractorOutputs {
    func onLoadingMovies() {
        self.outputs?.onLoadingMovies()
    }
    
    func onErrorLoadingMovies() {
        self.outputs?.onErrorLoadingMovies()
    }
    
    func onSuccessLoadMovies(_ movies: [Movie]) {
        self.outputs?.onSuccessLoadMovies(movies)
    }
}
