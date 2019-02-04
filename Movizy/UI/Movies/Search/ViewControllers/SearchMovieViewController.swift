import UIKit

class SearchMovieViewController: BaseViewController {
    
    var viperBuilder: VIPERBuilder<SearchMovieViewInteractor, SearchMovieViewPresenter, SearchMovieViewRouter>!
    
    var container: MoviesListView {
        return self.view as! MoviesListView
    }
 
    override func loadView() {
        self.addMoviesListView()
        self.addSearchBarView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func addMoviesListView() {
        let moviesView = MoviesListView()
        moviesView.delegate = self
        self.view = moviesView
    }
    
    private func addSearchBarView() {
        let searchView = SearchMovieBarView()
        searchView.enableCancelButton()
        searchView.enableFirstResponder()
        searchView.delegate = self
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: searchView)
    }
    
    deinit {
        debugPrint("DE-INIT \(String(describing: type(of: self))) is calling to make sure all is good")
    }
}

extension SearchMovieViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        self.viperBuilder.router.dismissSearchMovieView()
    }
    
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.container.scrollTableViewToTop()
        self.viperBuilder.presenter.searchMovies(searchText)
    }
}

extension SearchMovieViewController: SearchMovieViewInputs {
    func onSearchingMovies() {
        super.showLoadingView(container.tableView)
    }
    
    func onErrorSearchingMovies() {
        super.showTryAgainErrorMessage()
    }
    
    func onSuccessSearchMovies(_ movies: [Movie]) {
        super.hideLoadingView(container.tableView)
        self.container.setMovies(movies)
    }
    
    func onSuccessLoadMoreMovies(_ movies: [Movie]) {
        super.hideLoadingView(container.tableView)
        self.container.addMovies(movies)
    }
}

extension SearchMovieViewController: MoviesListViewDelegate {
    func loadMoreMovies(_ view: MoviesListView) {
        self.viperBuilder.presenter.loadMoreMovies()
    }
    
    func openMovieDetailsView(_ cell: MovieTableViewCell, movie: Movie) {
        let configuration = ZoomTransitionConfiguration { config in
            config.imageView = cell.posterImageView
        }
        self.viperBuilder.router.openMovieDetailsView(movie, configuration: configuration)
    }
}
