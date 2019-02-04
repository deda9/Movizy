import Quick
import Nimble

@testable import Movizy
class DoubleStringTest: QuickSpec {
    
    override func spec() {
        
        describe("Test Double to String") {
            
            it("Test Convert Double into String should not equal nil and should match") {
                let double: Double = 12
                expect(double.toString()).notTo(beNil())
                expect(double.toString()).to(equal("12.0"))
            }
        }
    }
}
