import UIKit

class BaseUITableViewCell: UITableViewCell {
    
    // MARK: - Lifecycle
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        self.addSubViews()
        self.setLayoutConstraints()
    }
    
    func setLayoutConstraints() {
        /**
         * override this in the subclass to apply the constraint for the view
         */
        fatalError("Should override " + #function + " in " + String(describing: type(of: self)))
    }
    
    func addSubViews() {
        /**
         * override this in the subclass to add subviews
         */
        fatalError("Should override " + #function + " in " + String(describing: type(of: self)))
    }
}
