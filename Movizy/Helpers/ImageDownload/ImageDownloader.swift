import Alamofire
import UIKit.UIImage

public typealias ImageDownloadHandler = (_ url: URL, _ result: Result<UIImage>) -> Void

class ImageDownloader {
    public static let `default` = ImageDownloader(ImageDownloaderCreator())
    
    private var imageCash: ImageCachable!
    private var imageDecoder: ImageDecoder!
    private var downloadingTasks: [String: URLSessionDataTask] = [:]
    private var session: URLSession
    private var configuration: URLSessionConfiguration
    
    private init(_ creator: ImageDownloaderCreator) {
        self.imageCash = creator.create()
        self.imageDecoder = creator.create()
        self.configuration = URLSessionConfiguration.default
        self.configuration.urlCache = URLCache(memoryCapacity: imageCash.memoryCapacity,
                                               diskCapacity: imageCash.diskCapacity,
                                               diskPath: imageCash.dishPath)
        self.session = URLSession(configuration: self.configuration)
    }
    
    func download(_ url: String?, options: ImageDecoderOptions? = nil, completion: ImageDownloadHandler?) throws {
        
        guard let urlString = url,
            let url: URL = URL(string: urlString) else {
                throw ImageDownloaderErrors.invalidURL
        }
        
        let id = url.absoluteString
        if let image = self.imageCash.image(id: id) {
            completion?(url, Result.success(image))
            return
        }
        
        if let task = self.downloadingTasks[id] {
            switch task.state {
            case .suspended:
                task.resume()
            default:
                break
            }
        }
        
        let task = self.session.dataTask(with: url) { [weak self] data, _, _ in
            guard let strongSelf = self else {
                return
            }
            guard let data = data else {
                completion?(url, Result.failure(ImageDownloaderErrors.dataIsNil))
                return
            }
            strongSelf.downloadingTasks[id] = nil
            
            func decodeImage() throws {
                if let image = try strongSelf.imageDecoder.decode(from: data, options: options) {
                    completion?(url, Result.success(image))
                    DispatchQueue.global(qos: .background).async {
                        strongSelf.imageCash.saveImage(image, with: id)
                    }
                }
                completion?(url, Result.failure(ImageDownloaderErrors.noImage))
            }
            
            func onErrorDecodeImage() {
                completion?(url, Result.failure(ImageDecoderError.failedDecodingImage))
            }
            
            try? Movizy.perform(decodeImage(), onError: onErrorDecodeImage())
        }
        self.downloadingTasks[id] = task
        task.resume()
    }
}

enum ImageDownloaderErrors: Error {
    case invalidURL
    case dataIsNil
    case noImage
}
