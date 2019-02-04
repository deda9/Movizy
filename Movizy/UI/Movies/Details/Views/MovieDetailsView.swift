import UIKit.UIView

protocol MovieDetailsViewDelegate: AnyObject {
    func closeView(_ movieDetailsView: MovieDetailsView)
}

class MovieDetailsView: UIView {
    
    weak var delegate: MovieDetailsViewDelegate?
    var closeButton: IncreaseHitAreaButton = UIButton.close
    var posterImageView: UIImageView = UIImageView.posterImageView
    var titleLabel: UILabel = UILabel.titleLabel
    var descriptionLabel: UILabel = UILabel.fullDescriptionLabel
    var popularityLabel: UILabel = UILabel.popularityLabel
    
    lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView(frame: self.frame)
        scrollView.isScrollEnabled = true
        scrollView.isUserInteractionEnabled = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.showsVerticalScrollIndicator = false
        return scrollView
    }()
    
    lazy var contentView: UIView = {
        let view = UIView()
        return view
    }()
    
    convenience init() {
        self.init(frame: .zero)
        setupUI()
    }
    
    func configureView(with movie: Movie) {
        self.titleLabel.text = movie.title
        self.popularityLabel.text = "★ " + movie.voteAverage.toString()
        self.descriptionLabel.text = movie.overview
        self.scrollView.updateContentViewSize()
    }
    
    private func setupUI() {
        self.backgroundColor = UIColor.white
        self.addSubviews()
    }
    
    private func addSubviews() {
        self.addScrollView()
        self.addCloseButton()
        self.addPosterImageView()
        self.addTitle()
        self.addPopularityTitle()
        self.addDescriptionTitle()
    }
    
    private func addCloseButton() {
        self.addSubview(self.closeButton)
        self.setCloseButtonConstraints()
        self.closeButton.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(closeView)))
    }
    
    @objc private func closeView() {
        self.delegate?.closeView(self)
    }
    
    private func addScrollView() {
        self.scrollView.addSubview(self.contentView)
        self.addSubview(self.scrollView)
        self.setScrollViewConstrains()
    }
    
    private func addPosterImageView() {
        self.contentView.addSubview(self.posterImageView)
        self.setPosterImageViewConstraints()
    }
    
    private func addTitle() {
        self.contentView.addSubview(self.titleLabel)
        self.setTitleConstraints()
    }
    
    private func addPopularityTitle() {
        self.contentView.addSubview(self.popularityLabel)
        self.setPopularityConstraints()
    }
    
    private func addDescriptionTitle() {
        self.contentView.addSubview(self.descriptionLabel)
        self.setDescriptionConstraints()
    }
}
