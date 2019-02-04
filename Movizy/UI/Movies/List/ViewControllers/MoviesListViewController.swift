import UIKit

class MoviesListViewController: BaseViewController {
    
    var viperBuilder: VIPERBuilder<MoviesListViewInteractor, MoviesListViewPresenter, MoviesListViewRouter>!
    var searchTransition: FadeTransitionHandler!
    
    var container: MoviesListView {
        return self.view as! MoviesListView
    }
    
    override func loadView() {
        self.addMoviesListView()
        self.addSearchBarView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viperBuilder.presenter.viewDidLoad()
    }
    
    private func addMoviesListView() {
        let moviesView = MoviesListView()
        moviesView.delegate = self
        self.view = moviesView
    }
    
    private func addSearchBarView() {
        let searchView = SearchMovieBarView()
        searchView.setupOnClickListener()
        searchView.delegate = self
        self.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: searchView)
    }
}

extension MoviesListViewController: MoviesListViewInputs {
    func onLoadingMovies() {
        super.showLoadingView(container.tableView)
    }
    
    func onErrorLoadingMovies() {
        super.showTryAgainErrorMessage()
    }
    
    func onSuccessLoadMovies(_ movies: [Movie]) {
        super.hideLoadingView(container.tableView)
        self.container.addMovies(movies)
    }
}

extension MoviesListViewController: MoviesListViewDelegate {
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

extension MoviesListViewController: UISearchBarDelegate {
    public func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.viperBuilder.router.openSearchMoviesView(creator: SearchMovieCreator(), transition: searchTransition)
    }
}
