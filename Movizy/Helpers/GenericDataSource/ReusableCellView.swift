import UIKit

@objc public protocol ReusableCellView {}

extension ReusableCellView {
    static var resuableID: String {
        return String(describing: self)
    }
}

extension UIScrollView {
    func scrollsToTop() {
        self.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
    }
}

extension UITableView {
    
    func register(cell: ReusableCellView.Type) {
        self.register(cell, forCellReuseIdentifier: cell.resuableID)
    }
    
    func registerDelegate(with dataSource: BasicDataSource) {
        self.dataSource = dataSource
        self.delegate = dataSource
    }
}

extension UITableViewCell: ReusableCellView {}
