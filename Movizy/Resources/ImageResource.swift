import UIKit.UIImage

enum ImageResource {
    case error
    case success
    case logo
    case closeButton
}

extension ImageResource {
    var name: String {
        switch self {
        case .error:
            return "ic_error"
        case .success:
            return "ic_success"
        case .logo:
            return "Logo"
        case .closeButton:
            return "close_button"
        }
    }
}

extension ImageResource {
    var image: UIImage? {
        return UIImage(named: self.name)
    }
}
