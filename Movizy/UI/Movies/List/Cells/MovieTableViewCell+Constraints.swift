import UIKit.UIView

extension MovieTableViewCell {
    func setPosterImageViewConstraints() {
        self.posterImageView.setConstraint(
            .top(of: self, offset: Sizes.PosterImageView.Margins.top) +
                .bottom(of: self, offset: -Sizes.PosterImageView.Margins.bottom) +
                .left(of: self, offset: Sizes.PosterImageView.Margins.left))
        
        self.posterImageView.setConstraint(.width(Sizes.PosterImageView.width))
        self.posterImageView.setConstraint(.height(Sizes.PosterImageView.height))
    }
    
    func setTitleLabelConstraints() {
        self.titleLabel.setConstraint(
            .left(rightOf: self.posterImageView, offset: Sizes.TitleLabel.Margins.left) +
                .top(of: self, offset: Sizes.TitleLabel.Margins.top) +
                .right(of: self, offset: -Sizes.TitleLabel.Margins.right))
    }
    
    func setDescriptionLabelConstraints() {
        self.descriptionLabel.setConstraint(
            .left(of: self.titleLabel) +
                .top(bottomOf: self.popularityLabel, offset: Sizes.Description.Margins.top) +
                .right(of: self.titleLabel) +
                .bottom(of: self, offset: -Sizes.Description.Margins.bottom))
    }
    
    func setPopularityLabelConstraints() {
        self.popularityLabel.setConstraint(
            .left(of: self.titleLabel) +
                .top(bottomOf: self.titleLabel, offset: Sizes.Popularity.Margins.top) +
                .right(of: self.titleLabel))
    }
}
