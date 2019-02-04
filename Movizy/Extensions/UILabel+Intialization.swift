import UIKit.UILabel

extension UILabel {
    
    static var titleLabel: UILabel {
        let label = UILabel(frame: .zero)
        label.font = UIFont.title
        label.textColor = UIColor.black
        label.numberOfLines = 2
        return label
    }
    
    static var shortDescriptionLabel: UILabel {
        let label = UILabel(frame: .zero)
        label.font = UIFont.desciption
        label.textColor = UIColor.black.withAlphaComponent(0.7)
        label.numberOfLines = 2
        return label
    }
    
    static var fullDescriptionLabel: UILabel {
        let label = UILabel(frame: .zero)
        label.font = UIFont.desciption
        label.textColor = UIColor.black.withAlphaComponent(0.7)
        label.numberOfLines = 0
        return label
    }
    
    static var popularityLabel: UILabel {
        let label = UILabel(frame: .zero)
        label.font = UIFont.popularity
        label.textColor = UIColor.black.withAlphaComponent(0.5)
        label.numberOfLines = 2
        return label
    }
}
