import Quick
import Nimble
import OHHTTPStubs

@testable import Movizy
class NetworkServiceTests: QuickSpec {
    
    //swiftlint:disable function_body_length
    override func spec() {
        
        var sutResponse: MoviesResponse!
        var sutError: Error?
        
        describe("Test NetworkService") {
            
            beforeEach {
                let movieData = JSONHelper.getJSONData(fileName: JSONMockData.movies.rawValue, bundle: Bundle(for: NetworkServiceTests.self))
                _ = stub(condition: isHost("api.themoviedb.org")) { _ in
                    return OHHTTPStubsResponse(data: movieData, statusCode: 200, headers: nil)
                }
                
                waitUntil { done in
                    NetworkService<MoviesResponse>.execute(MoviesAPIs.getPopularList(1)) { result in
                        switch result {
                        case .success(let response):
                            sutResponse = response
                            done()
                        case .failure(let error):
                            sutError = error
                            done()
                        }
                    }
                }
            }
            
            it("Test NetworkService for getting popular movies list should success") {
                expect(sutResponse).notTo(beNil())
                expect(sutError).to(beNil())
            }
            
            it("Test NetworkService for getting popular movies list count should not equal zero") {
                expect(sutResponse.moviesList.count).to(equal(20))
            }
            
            it("Test Movie voteCount should match value") {
                expect(sutResponse.moviesList[0].voteCount).to(equal(1686))
            }
            
            it("Test Movie id should match value") {
                expect(sutResponse.moviesList[0].id).to(equal(1493))
            }
            
            it("Test Movie video should match value") {
                expect(sutResponse.moviesList[0].video).to(equal(false))
            }
            
            it("Test Movie voteAverage match value") {
                expect(sutResponse.moviesList[0].voteAverage).to(equal(6.4))
            }
            
            it("Test Movie title should match value") {
                expect(sutResponse.moviesList[0].title).to(equal("Miss Congeniality"))
            }
            
            it("Test Movie popularity should match value") {
                expect(sutResponse.moviesList[0].popularity).to(equal(12.237))
            }
            
            it("Test Movie posterPath should match value") {
                expect(sutResponse.moviesList[0].posterPath).to(equal("/7ujgPH708pOGvl2Y5IYvXeAGPC2.jpg"))
            }
            
            it("Test Movie originalTitle should match value") {
                expect(sutResponse.moviesList[0].originalTitle).to(equal("Miss Congeniality"))
            }
            
            it("Test Movie originalLanguage should match value") {
                expect(sutResponse.moviesList[0].originalLanguage).to(equal("en"))
            }
            
            it("Test Movie genreIDS count should match value") {
                expect(sutResponse.moviesList[0].genreIDS.count).to(equal(3))
            }
            
            it("Test Movie backdropPath should match value") {
                expect(sutResponse.moviesList[0].backdropPath).to(equal("/p25mxAO1ArY8bgZX6Y7B2r3vo0k.jpg"))
            }
            
            it("Test Movie adult should match value") {
                expect(sutResponse.moviesList[0].adult).to(equal(false))
            }
        
            it("Test Movie releaseDate should match value") {
                expect(sutResponse.moviesList[0].releaseDate).to(equal("2000-12-14"))
            }
        }
    }
}
