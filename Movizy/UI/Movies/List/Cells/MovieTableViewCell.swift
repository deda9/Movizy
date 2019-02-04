import UIKit

class MovieTableViewCell: BaseUITableViewCell {
    
    var posterImageView: UIImageView = UIImageView.posterThumnail
    var titleLabel: UILabel = UILabel.titleLabel
    var descriptionLabel: UILabel = UILabel.shortDescriptionLabel
    var popularityLabel: UILabel = UILabel.popularityLabel
    
    override func addSubViews() {
        [self.posterImageView,
         self.titleLabel,
         self.descriptionLabel,
         self.popularityLabel].forEach {
            self.addSubview($0)
        }
    }
    
    override func setLayoutConstraints() {
        self.setPosterImageViewConstraints()
        self.setTitleLabelConstraints()
        self.setDescriptionLabelConstraints()
        self.setPopularityLabelConstraints()
    }
    
    func configureCell(with model: Movie) {
        self.titleLabel.text = model.title
        self.popularityLabel.text = "★ " + model.voteAverage.toString()
        self.descriptionLabel.text = model.overview
        self.posterImageView.download(url: model.imageUrl, placeholder: ImageResource.logo.image)
    }
}
