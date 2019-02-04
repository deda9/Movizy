import Quick
import Nimble
import UIKit

@testable import Movizy
class MoviesListViewControllerTests: QuickSpec {
    
    override func spec() {
        var sutView: MoviesListViewController!
        
        describe("Test MoviesListViewController LifeCyle") {
            beforeEach {
                sutView = Storyboard.Main.instantiate(MoviesListViewController.self)
                let creator = MoviesCreator()
                sutView.searchTransition = creator.create()
                sutView.viperBuilder = creator.create(parent: sutView)
                _ = sutView.view
            }
            
            it("Test Movies list view should NOT nil") {
                expect(sutView.view).notTo(beNil())
            }
            
            it("Test Movies list searchTransition should NOT nil") {
                expect(sutView.searchTransition).notTo(beNil())
            }
            
            it("Test Movies list viperBuilder should NOT nil") {
                expect(sutView.viperBuilder).notTo(beNil())
            }
            
            it("Test Movies list container should NOT nil") {
                expect(sutView.container).notTo(beNil())
            }
            
            it("Test Movies list tableView should NOT nil") {
                expect(sutView.container.tableView).notTo(beNil())
            }
        }
    }
}
