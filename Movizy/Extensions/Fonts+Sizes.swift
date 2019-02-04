import UIKit.UIFont

// MARK: - Fonts
extension UIFont {
    
    static var title: UIFont {
        let fontSize = UIFont.getTitlFontSize()
        let font = UIFont.systemFont(ofSize: fontSize)
        return font
    }
    
    static var desciption: UIFont {
        let fontSize = UIFont.getDescriptionFontSize()
        let font = UIFont.systemFont(ofSize: fontSize)
        return font
    }
    
    static var popularity: UIFont {
        let fontSize = UIFont.getPopularityFontSize()
        let font = UIFont.systemFont(ofSize: fontSize)
        return font
    }
}

// MARK: - Font sizes
fileprivate extension UIFont {
    
    /**
     * IN PRODUCTION CODE:
     * this should be sync with the design specs for each iPhone screen (Designer Review)
     */
    static func getTitlFontSize() -> CGFloat {
        return 18
    }
    
    static func getDescriptionFontSize() -> CGFloat {
        return 16
    }
    
    static func getPopularityFontSize() -> CGFloat {
        return 14
    }
}
