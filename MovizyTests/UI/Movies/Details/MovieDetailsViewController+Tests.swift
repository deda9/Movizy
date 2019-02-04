import Quick
import Nimble
import UIKit

@testable import Movizy
class MovieDetailsViewControllerTests: QuickSpec {
    
    override func spec() {
        
        var sutView: MovieDetailsViewController!
        let firstMovie = self.getFirstMovie()
        let imageView: UIImageView = {
            let imageView = UIImageView()
            imageView.image = ImageResource.logo.image
            return imageView
        }()
        
        describe("Test MovieDetailsViewController") {
            beforeEach {
                let configuration = ZoomTransitionConfiguration { config in
                    config.imageView = imageView
                }
                sutView = MovieDetailsViewController(firstMovie, configuration: configuration)
                _ = sutView.view
            }
            
            it("Test Movie details container should not be nil") {
                expect(sutView.container).notTo(beNil())
            }
            
            it("Test Movie details container data should match movie data") {
                expect(sutView.container.posterImageView.image).to(equal(imageView.image))
                expect(sutView.container.titleLabel.text).to(equal(firstMovie.title))
                expect(sutView.container.descriptionLabel.text).to(equal(firstMovie.overview))
                expect(sutView.container.popularityLabel.text).to(equal("★ " + firstMovie.voteAverage.toString()))
            }
            
        }
    }
}
