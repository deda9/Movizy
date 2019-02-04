import Quick
import Nimble

@testable import Movizy
class MovieTests: QuickSpec {
    
    //swiftlint:disable function_body_length
    override func spec() {
        var sutResponse: Movie!
        
        describe("Test Movie properties should not be nil") {
            beforeEach {
                sutResponse = self.getFirstMovie()
            }
            
            it("Test Movie voteCount should NOT equal to zero") {
                expect(sutResponse.voteCount).notTo(equal(0))
            }
            
            it("Test Movie id should NOT equal to zero") {
                expect(sutResponse.id).notTo(equal(0))
            }
            
            it("Test Movie video should NOT equal to nil") {
                expect(sutResponse.video).notTo(beNil())
            }
            
            it("Test Movie voteAverage should NOT equal to zero") {
                expect(sutResponse.voteAverage).notTo(equal(0))
            }
            
            it("Test Movie title should NOT equal to nil") {
                expect(sutResponse.title).notTo(beNil())
            }
            
            it("Test Movie popularity should NOT equal to zero") {
                expect(sutResponse.popularity).notTo(equal(0))
            }
            
            it("Test Movie posterPath should NOT equal to nil") {
                expect(sutResponse.posterPath).notTo(beNil())
            }
            
            it("Test Movie originalTitle should NOT equal to nil") {
                expect(sutResponse.originalTitle).notTo(beNil())
            }
            
            it("Test Movie originalLanguage should NOT equal to nil") {
                expect(sutResponse.originalLanguage).notTo(beNil())
            }
            
            it("Test Movie genreIDS count should NOT equal to zero") {
                expect(sutResponse.genreIDS.count).notTo(equal(0))
            }
            
            it("Test Movie backdropPath should NOT equal to nil") {
                expect(sutResponse.backdropPath).notTo(beNil())
            }
            
            it("Test Movie adult should NOT equal to nil") {
                expect(sutResponse.adult).notTo(beNil())
            }
            
            it("Test Movie overview should NOT equal to nil") {
                expect(sutResponse.overview).notTo(beNil())
            }
            
            it("Test Movie releaseDate should NOT equal to nil") {
                expect(sutResponse.releaseDate).notTo(beNil())
            }
        }
        
        describe("Test Movie properties should match their values") {
            beforeEach {
                sutResponse = self.getFirstMovie()
            }
            
            it("Test Movie voteCount should match value") {
                expect(sutResponse.voteCount).to(equal(1686))
            }
            
            it("Test Movie id should match value") {
                expect(sutResponse.id).to(equal(1493))
            }
            
            it("Test Movie video should match value") {
                expect(sutResponse.video).to(equal(false))
            }
            
            it("Test Movie voteAverage match value") {
                expect(sutResponse.voteAverage).to(equal(6.4))
            }
            
            it("Test Movie title should match value") {
                expect(sutResponse.title).to(equal("Miss Congeniality"))
            }
            
            it("Test Movie popularity should match value") {
                expect(sutResponse.popularity).to(equal(12.237))
            }
            
            it("Test Movie posterPath should match value") {
                expect(sutResponse.posterPath).to(equal("/7ujgPH708pOGvl2Y5IYvXeAGPC2.jpg"))
            }
            
            it("Test Movie originalTitle should match value") {
                expect(sutResponse.originalTitle).to(equal("Miss Congeniality"))
            }
            
            it("Test Movie originalLanguage should match value") {
                expect(sutResponse.originalLanguage).to(equal("en"))
            }
            
            it("Test Movie genreIDS count should match value") {
                expect(sutResponse.genreIDS.count).to(equal(3))
            }
            
            it("Test Movie backdropPath should match value") {
                expect(sutResponse.backdropPath).to(equal("/p25mxAO1ArY8bgZX6Y7B2r3vo0k.jpg"))
            }
            
            it("Test Movie adult should match value") {
                expect(sutResponse.adult).to(equal(false))
            }
            
            it("Test Movie overview should match value") {
                //swiftlint:disable line_length
                let text = "When the local FBI office receives a letter from a terrorist known only as 'The Citizen', it's quickly determined that he's planning his next act at the Miss America beauty pageant. Because tough-as-nails Gracie Hart is the only female Agent at the office, she's chosen to go undercover as the contestant from New Jersey."
                expect(sutResponse.overview).to(equal(text))
            }
            
            it("Test Movie releaseDate should match value") {
                expect(sutResponse.releaseDate).to(equal("2000-12-14"))
            }
        }
    }
}
