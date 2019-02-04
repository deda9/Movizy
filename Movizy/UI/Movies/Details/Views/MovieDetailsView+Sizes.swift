import UIKit.UIView

extension MovieDetailsView {
    struct Sizes {
        struct PosterImageView {
            static let height: CGFloat = 500
            struct Margins {
                static let right: CGFloat = 20
            }
        }
        
        struct CloseButton {
            static let height: CGFloat = 24
            static let width: CGFloat = 24
            
            struct Margins {
                static let top: CGFloat = 20
                static let right: CGFloat = 20
            }
        }
        
        struct TitleLabel {
            struct Margins {
                static let top: CGFloat = 14
                static let left: CGFloat = 20
                static let right: CGFloat = 20
            }
        }
        
        struct PopularityLabel {
            struct Margins {
                static let top: CGFloat = 14
                static let left: CGFloat = 20
                static let right: CGFloat = 20
            }
        }
        
        struct DescriptionLabel {
            struct Margins {
                static let left: CGFloat = 20
                static let top: CGFloat = 14
                static let right: CGFloat = 20
            }
        }
    }
}
