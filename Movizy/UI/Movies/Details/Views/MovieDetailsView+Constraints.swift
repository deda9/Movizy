import UIKit

extension MovieDetailsView {
    
    func setCloseButtonConstraints() {
        self.closeButton.setConstraint(
            .top(of: self, offset: Sizes.CloseButton.Margins.top) +
                .right(of: self, offset: -Sizes.CloseButton.Margins.right) +
                .width(Sizes.CloseButton.width) +
                .height(Sizes.CloseButton.height))
    }
    
    func setScrollViewConstrains() {
        self.scrollView.setConstraint(
            .left(of: self) +
                .width(UIScreen.width) +
                .top(of: self, applySafeArea: false) +
                .bottom(of: self))
    }
    
    func setPosterImageViewConstraints() {
        self.posterImageView.setConstraint(
            .top(of: self.contentView, applySafeArea: false) +
                .left(of: self.contentView) +
                .right(of: self) +
                .height(Sizes.PosterImageView.height))
    }
    
    func setTitleConstraints() {
        self.titleLabel.setConstraint(
            .top(bottomOf: self.posterImageView, offset: Sizes.TitleLabel.Margins.top) +
                .left(of: self.contentView, offset: Sizes.TitleLabel.Margins.left) +
                .right(of: self, offset: -Sizes.TitleLabel.Margins.right))
    }
    
    func setPopularityConstraints() {
        self.popularityLabel.setConstraint(
            .top(bottomOf: self.titleLabel, offset: Sizes.PopularityLabel.Margins.top) +
                .left(of: self.contentView, offset: Sizes.PopularityLabel.Margins.left) +
                .right(of: self, offset: -Sizes.PopularityLabel.Margins.right))
    }
    
    func setDescriptionConstraints() {
        self.descriptionLabel.setConstraint(
            .top(bottomOf: self.popularityLabel, offset: Sizes.DescriptionLabel.Margins.top) +
                .left(of: self.contentView, offset: Sizes.DescriptionLabel.Margins.left) +
                .right(of: self, offset: -Sizes.DescriptionLabel.Margins.right))
        
    }
}
