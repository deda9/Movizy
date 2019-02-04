import UIKit

class ZoomTransitionConfiguration {
    var imageView: UIImageView?
    typealias ConfigurationClosure = (ZoomTransitionConfiguration) -> Void
    
    init(configurationClosure: ConfigurationClosure) {
        configurationClosure(self)
    }
}
