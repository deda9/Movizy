import Quick
import Nimble

@testable import Movizy
class StringIntTests: QuickSpec {
    
    override func spec() {
        
        describe("Test String to Int") {
            
            it("Test Convert String into Int should not equal nil and should match") {
                let string = "12"
                expect(string.toInt).notTo(beNil())
                expect(string.toInt).to(equal(12))
            }
        }
    }
}
