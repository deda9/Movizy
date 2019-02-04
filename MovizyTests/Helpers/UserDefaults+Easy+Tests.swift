import Quick
import Nimble
import Foundation

@testable import Movizy
class UserDefaultsEasyTests: QuickSpec {
    
    override func spec() {
        
        describe("Test UserDefaults") {
           
            beforeEach {
                UserDefaults.standard.clear()
            }
            
            it("Test UserDefaults with int value should match") {
                let userDefaults = UserDefaults.standard
                let key = UserDefaults.Key<Int>("IntKey", default: 0)
                expect(userDefaults[key]).to(equal(0))
                userDefaults[key] = 19
                expect(userDefaults[key]).to(equal(19))
            }
            
            it("Test UserDefaults with string value should match") {
                let userDefaults = UserDefaults.standard
                let key = UserDefaults.Key<String>("StringKey", default: "NONE")
                expect(userDefaults[key]).to(equal("NONE"))
                userDefaults[key] = "Hallo"
                expect(userDefaults[key]).to(equal("Hallo"))
            }
            
            it("Test UserDefaults with doubel value should match") {
                let userDefaults = UserDefaults.standard
                let key = UserDefaults.Key<Double>("DoubleKey", default: 12.4)
                expect(userDefaults[key]).to(equal(12.4))
                userDefaults[key] = 22.3
                expect(userDefaults[key]).to(equal(22.3))
            }
        }
    }
}
