import UIKit

class MovieDetailsViewController: BaseViewController {
    
    private var movie: Movie!
    private var configuration: ZoomTransitionConfiguration!
    private var transitionHandler: ZoomTransitionHandler!

    var container: MovieDetailsView {
        return self.view as! MovieDetailsView
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(_ movie: Movie, configuration: ZoomTransitionConfiguration) {
        super.init(nibName: nil, bundle: nil)
        self.movie = movie
        self.configuration = configuration
        self.modalPresentationStyle = .overFullScreen
        self.modalTransitionStyle = .crossDissolve
        self.modalPresentationCapturesStatusBarAppearance = true
    }
    
    override func loadView() {
        self.addMovieDetailsView()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTransitions()
        self.setContainerData()
    }
    
    private func addMovieDetailsView() {
        let detailsView = MovieDetailsView()
        detailsView.delegate = self
        self.view = detailsView
    }
    
    private func setContainerData() {
        self.container.configureView(with: movie)
        self.container.posterImageView.image = self.configuration.imageView?.image
    }
    
    private func setupTransitions() {
        guard let imageView = configuration?.imageView else { return }
        transitionHandler = ZoomTransitionHandler(fromImageView: imageView, toImageView: self.container.posterImageView)
        transitioningDelegate = transitionHandler
    }
    
    deinit {
        debugPrint("DE-INIT \(String(describing: type(of: self))) is calling to make sure all is good")
    }
}

extension MovieDetailsViewController: MovieDetailsViewDelegate {
    func closeView(_ movieDetailsView: MovieDetailsView) {
        self.dismiss(animated: true, completion: nil)
    }
}
