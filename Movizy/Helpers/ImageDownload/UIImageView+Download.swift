import UIKit.UIImageView

extension UIImageView {
    func download(url: String?, placeholder: UIImage? = nil) {
        
        func setPlaceholder() {
            self.image = placeholder
        }
        
        setPlaceholder()
        
        func downloadImage() throws {
            try ImageDownloader.default.download(url) { [weak self] _, result in
                guard let strongSelf = self else {
                    return
                }
                
                switch result {
                case .success(let image):
                    doMainAsync {
                        strongSelf.image = image
                    }
                case .failure:
                    break
                }
            }
        }
        
        try Movizy.perform(downloadImage(), onError: setPlaceholder())
    }
}
