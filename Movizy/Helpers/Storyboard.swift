
import UIKit

//swiftlint:disable identifier_name
//swiftlint:disable force_unwrapping
enum Storyboard: String {
    case Main
    
    public func instantiate<VC: UIViewController>(_ viewController: VC.Type,
                                                  inBundle bundle: Bundle = .framework) -> VC {
        guard
            let vc = UIStoryboard(name: self.rawValue, bundle: Bundle(identifier: bundle.bundleID))
                .instantiateViewController(withIdentifier: VC.storyboardIdentifier) as? VC
            else { fatalError("Couldn't instantiate \(VC.storyboardIdentifier) from \(self.rawValue)") }
        
        return vc
    }
}

fileprivate extension Bundle {
    static var framework: Bundle {
        class Test {}
        return Bundle(for: Test.self)
    }
    
    var bundleID: String {
        return Bundle.framework.bundleIdentifier!
    }
}

fileprivate extension UIViewController {
     static var storyboardIdentifier: String {
        return self.description().components(separatedBy: ".").dropFirst().joined(separator: ".")
    }
}
