import Quick
import Nimble

@testable import Movizy
class ArrayQueryTests: QuickSpec {
    
    override func spec() {
        
        describe("Test Array query") {
            
            it("Test the value of the array with out of index should equal nil") {
                var array: [Int] = []
                expect(array[of: 0]).to(beNil())
                array.append(12)
                expect(array[of: 0]).to(equal(12))
            }
        }
    }
}
