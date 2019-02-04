import UIKit.UIView

protocol MoviesListViewDelegate: AnyObject {
    func loadMoreMovies(_ view: MoviesListView)
    func openMovieDetailsView(_ cell: MovieTableViewCell, movie: Movie)
}

class MoviesListView: UIView {
    var tableView: UITableView = {
        return Init(UITableView()) {
            $0.showsVerticalScrollIndicator = false
            $0.keyboardDismissMode = .onDrag
        }
    }()
    
    weak var delegate: MoviesListViewDelegate?
    private let tableViewDataSource = GenericDataSource<Movie, MovieTableViewCell>()
    
    convenience init() {
        self.init(frame: .zero)
        setupUI()
    }
    
    func scrollTableViewToTop() {
        self.tableView.scrollsToTop()
    }
    
    func setMovies(_ movies: [Movie]) {
        self.tableViewDataSource.setMovies(movies, in: self.tableView)
    }
    
    func addMovies(_ movies: [Movie]) {
        self.tableViewDataSource.addItems(movies, in: self.tableView)
    }
    
    private func setupUI() {
        self.addSubviews()
        self.setupTableViewDelegates()
    }
    
    private func addSubviews() {
        self.addSubview(tableView)
        self.tableView.setConstraint(.matchParent(self))
    }
    
    private func setupTableViewDelegates() {
        self.tableViewDataSource.onConfigureCell = { cell, model, index in
            cell.configureCell(with: model)
        }
        self.tableViewDataSource.onDidSelectCell = { cell, model, index in
            if let delegate = self.delegate {
                weakify(self, delegate.openMovieDetailsView(cell, movie: model))()
            }
        }
        self.tableViewDataSource.loadMoreOffset = {
            return 10
        }
        self.tableViewDataSource.loadMoreHandler = {
            if let delegate = self.delegate {
                weakify(self, delegate.loadMoreMovies(self))()
            }
        }
        self.tableView.estimatedRowHeight = 100
        self.tableView.register(cell: MovieTableViewCell.self)
        self.tableView.registerDelegate(with: tableViewDataSource)
    }
}
