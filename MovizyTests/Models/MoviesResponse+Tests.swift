import Quick
import Nimble

@testable import Movizy
class MoviesResponseTests: QuickSpec {
    
    override func spec() {
        var sutResponse: MoviesResponse!
        
        describe("Test Movies response properties should not be nil") {
            beforeEach {
                sutResponse = self.getMoviesResponse()
            }
            
            it("Test Movies response page should NOT equal to zero") {
                expect(sutResponse.page).notTo(equal(0))
            }
            
            it("Test Movies response totalResults should NOT equal to zero") {
                expect(sutResponse.totalResults).notTo(equal(0))
            }
            
            it("Test Movies response totalPages should NOT equal to zero") {
                expect(sutResponse.totalPages).notTo(equal(0))
            }
            
            it("Test Movies response moviesList count should NOT equal to zero") {
                expect(sutResponse.moviesList.count).notTo(equal(0))
            }
            
            it("Test Movies response moviesList count should equal to 20") {
                expect(sutResponse.moviesList.count).to(equal(20))
            }
        }
    }
}
