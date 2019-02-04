import Quick
import Nimble
import UIKit

@testable import Movizy
class ImageDecoderTests: QuickSpec {
    
    override func spec() {
        
        describe("Test ImageDecoder") {
            
            it("Test ImageDecoder image should not be nil") {
                let decoder = DefaultImageDecoder()
                let image = ImageResource.logo.image
                let imageData = image?.pngData()
                do {
                    //swiftlint:disable force_unwrapping
                    let decodedImage = try decoder.decode(from: imageData!, options: nil)
                    expect(decodedImage).notTo(beNil())
                    expect(decodedImage?.pngData()).notTo(beNil())
                } catch {
                    fail()
                }
            }
        }
    }
}
