import UIKit

class BaseViewController: UIViewController {
    
    lazy var activityIndicatorView: UIActivityIndicatorView = {
        let activityIndicatorView = UIActivityIndicatorView()
        activityIndicatorView.color = UIColor.red
        activityIndicatorView.sizeToFit()
        return activityIndicatorView
    }()
    
    fileprivate lazy var messageToastView: ToastView = {
        return ToastView.instance(with: self.view)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func showTryAgainErrorMessage() {
        showErrorMessage("someThingIsWrong".localize())
    }
    
    func showErrorMessage(_ message: String) {
        messageToastView.updateData(message, type: .error)
        messageToastView.showToast()
    }
    
    func showMessage(_ message: String) {
        messageToastView.updateData(message, type: .success)
        messageToastView.showToast()
    }
    
    func showLoadingView(_ tableView: UITableView) {
        tableView.sectionFooterHeight = 60
        tableView.tableFooterView = activityIndicatorView
        activityIndicatorView.startAnimating()
    }
    
    func hideLoadingView(_ tableView: UITableView) {
        if activityIndicatorView.isDescendant(of: tableView) {
            activityIndicatorView.stopAnimating()
            activityIndicatorView.removeFromSuperview()
            tableView.tableFooterView = nil
        }
    }
}
