import Quick
import Nimble
import UIKit

@testable import Movizy
class DIContainerTests: QuickSpec {
    
    class RegisterTest {
        var title = "Testing regsiter"
    }
    
    override func spec() {
        
        describe("Test DIContainer") {
            
            it("Test regsiter new object in DI container and resolve it should success") {
               let container = Container()
                container.register(RegisterTest.self, factory: { _ in
                    return RegisterTest()
                })
                
                let resolved = container.resolve(RegisterTest.self)
                expect(resolved).notTo(beNil())
            }
            
            it("Test relove object from DI container, should return its properties too") {
                let container = Container()
                container.register(RegisterTest.self, factory: { _ in
                    return RegisterTest()
                })
                
                let resolved = container.resolve(RegisterTest.self)
                expect(resolved?.title).to(equal("Testing regsiter"))
            }
            
            it("Test regsiter new object with new properties in DI container and resolve it should success") {
                let container = Container()
                container.register(RegisterTest.self, factory: { _ in
                    let object = RegisterTest()
                    object.title = "New Title"
                    return object
                })
                
                let resolved = container.resolve(RegisterTest.self)
                expect(resolved?.title).to(equal("New Title"))
            }
        }
    }
}
