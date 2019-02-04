import UIKit.UIView

extension MovieTableViewCell {
    struct Sizes {
        struct PosterImageView {
            static let width: CGFloat = 100
            static let height: CGFloat = 120
            
            struct Margins {
                static let top: CGFloat = 16
                static let left: CGFloat = 16
                static let bottom: CGFloat = 16
            }
        }
        
        struct TitleLabel {
            struct Margins {
                static let top: CGFloat = 16
                static let left: CGFloat = 16
                static let right: CGFloat = 16
            }
        }
        
        struct Popularity {
            struct Margins {
                static let top: CGFloat = 10
            }
        }
        
        struct Description {
            struct Margins {
                static let top: CGFloat = 10
                static let bottom: CGFloat = 16
            }
        }
    }
}
