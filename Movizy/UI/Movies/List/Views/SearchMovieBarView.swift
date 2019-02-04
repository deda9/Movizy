import UIKit.UISearchBar

class SearchMovieBarView: UISearchBar {
    
    override weak open var delegate: UISearchBarDelegate? {
        didSet {
            super.delegate = delegate
        }
    }
    
    private var searchBarShouldBeginEditing: Bool = true
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init() {
        let frame = CGRect(x: 0, y: 0, width: UIScreen.width, height: 20)
        super.init(frame: frame)
        setup()
    }
    
    private func setup() {
        self.placeholder = "MoviesListView.SearchBarView.Placeholder".localize()
    }
    
    func enableCancelButton() {
        self.showsCancelButton = true
    }
    
    func enableFirstResponder() {
        self.becomeFirstResponder()
    }
    
    func setupOnClickListener() {
        self.searchBarShouldBeginEditing = false
        self.subviews.forEach {
            $0.subviews.forEach {
                $0.isUserInteractionEnabled = true
                $0.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(didClickSearchBar)))
            }
        }
        self.isUserInteractionEnabled = true
    }
    
    @objc private func didClickSearchBar() {
        self.delegate?.searchBarSearchButtonClicked?(self)
    }
}
