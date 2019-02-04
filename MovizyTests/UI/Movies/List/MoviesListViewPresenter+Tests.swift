import Quick
import Nimble
import UIKit

@testable import Movizy
class MoviesListViewPresenterTests: QuickSpec {
    
    override func spec() {
        var sutViperBuilder: VIPERBuilder<MoviesListViewInteractorMock, MoviesListViewPresenter, MoviesListViewRouter>!
        var sutView: MoviesListViewControllerMock!
        
        describe("Test MoviesListViewController LifeCyle") {
            beforeEach {
                sutView = MoviesListViewControllerMock(nibName: nil, bundle: nil)
                sutViperBuilder = VIPERBuilder(controller: sutView)
                _ = sutView.view
            }
            
            it("Test loaded movies count should match number of tableview's row") {
                let numBeforeLoad = getTableViewItemsCount()
                expect(numBeforeLoad).to(equal(0))
                
                sutViperBuilder.presenter.viewDidLoad()
                
                let numAfterLoad = getTableViewItemsCount()
                expect(numAfterLoad).to(equal(20))
            }
            
            it("Test first tableview's cell should not equal nil") {
                sutViperBuilder.presenter.viewDidLoad()
                let cell = getFirstTabelViewCell()
                expect(cell).notTo(beNil())
            }
            
            it("Test first tableview's cell data should match first movie") {
                sutViperBuilder.presenter.viewDidLoad()
                let cell = getFirstTabelViewCell()
                
                let firstMovie = self.getFirstMovie()
                
                expect(cell?.titleLabel.text).to(equal(firstMovie.title))
                expect(cell?.descriptionLabel.text).to(equal(firstMovie.overview))
                expect(cell?.popularityLabel.text).to(equal("★ " + firstMovie.voteAverage.toString()))
            }
            
            it("Test load more movies") {
                sutViperBuilder.presenter.viewDidLoad()
                let numAfterLoad = getTableViewItemsCount()
                expect(numAfterLoad).to(equal(20))
                
                sutViperBuilder.presenter.loadMoreMovies()
                let numAfterLoadMore = getTableViewItemsCount()
                expect(numAfterLoadMore).to(beGreaterThan(20))
            }
        }
        
        func getTableView() -> UITableView {
            return sutView.container.tableView
        }
        
        func getTableViewItemsCount() -> Int {
            return getTableView().dataSource?.tableView(getTableView(), numberOfRowsInSection: 0) ?? -1
        }
        
        func getFirstTabelViewCell() -> MovieTableViewCell? {
            let cell: MovieTableViewCell =
                cast(getTableView().dataSource?.tableView(getTableView(), cellForRowAt: IndexPath(row: 0, section: 0)))
            return cell
        }
    }
}
