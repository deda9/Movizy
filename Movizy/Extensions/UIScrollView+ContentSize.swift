import UIKit.UIScrollView

extension UIScrollView {
    func updateContentViewSize() {
        var newHeight: CGFloat = 0
        
        self.subviews.first?.subviews.forEach {
            if let label = $0 as? UILabel {
                newHeight += label.text?.height(withConstrainedWidth: UIScreen.width, font: label.font) ?? 0
            } else if let textView = $0 as? UITextView, let font = textView.font {
                newHeight += textView.text?.height(withConstrainedWidth: UIScreen.width, font: font) ?? 0
            } else {
                newHeight += $0.frame.size.height
            }
        }
        let oldSize = contentSize
        let newSize = CGSize(width: oldSize.width, height: newHeight + newHeight / 8.5)
        contentSize = newSize
    }
}
