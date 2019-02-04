import Quick
import Nimble
import UIKit.UIViewController

@testable import Movizy
class VIPERBuilderTests: QuickSpec {
    
    override func spec() {
        
        describe("Test VIPERBuilder") {
            
            it("Test viper components should not equal nil") {
                let viewController = UIViewController()
                let viper = VIPERBuilder<VIPERInteractorMock, VIPERPresenterMock, VIPERRouterMock>(controller: viewController)
                
                expect(viper.interactor).notTo(beNil())
                expect(viper.interactor.presenter).notTo(beNil())
                expect(viper.interactor.router).notTo(beNil())

                expect(viper.presenter).notTo(beNil())
                expect(viper.presenter.interactor).notTo(beNil())
                expect(viper.presenter.viewController).notTo(beNil())
                
                expect(viper.router).notTo(beNil())
                expect(viper.router.viewController).notTo(beNil())
            }
        }
    }
}
