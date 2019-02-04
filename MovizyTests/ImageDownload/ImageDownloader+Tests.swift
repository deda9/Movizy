import Quick
import Nimble
import UIKit
import OHHTTPStubs

@testable import Movizy
class ImageDownloaderTests: QuickSpec {
    
    override func spec() {
        describe("Test ImageDownloader") {
            var image: UIImage?
            let imageUrl = "https://image.tmdb.org/t/p/w500/kqjL17yufvn9OVLyXYpvtyrFfak.jpg"

            beforeEach {
                let imageData = JSONHelper.getImageData(fileName: "ImageMockData",
                                                        bundle: Bundle(for: ImageDownloaderTests.self),
                                                        fileExtesion: "txt")
                
                _ = stub(condition: isHost("image.tmdb.org")) { _ in
                    return OHHTTPStubsResponse(data: imageData, statusCode: 200, headers: nil)
                }
                
                waitUntil { done in
                    do {
                        try ImageDownloader.default.download(imageUrl) { _, result in
                            switch result {
                            case .success(let imageValue):
                                image = imageValue
                                done()
                            case .failure:
                                break
                            }
                        }
                    } catch {
                        fail()
                        done()
                    }
                }
            }
          
            it("Test downloaded image should not be nil even with broken url cause its mocked") {
                expect(image).notTo(beNil())
            }
        }
    }
}
