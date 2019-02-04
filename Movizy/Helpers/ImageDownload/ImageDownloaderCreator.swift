class ImageDownloaderCreator: Creator {
    func create() -> ImageDecoder {
        let container = AppDelegate.shared.container
        let decoderType = DefaultImageDecoder.self
        
        if let decoder = container.resolve(decoderType) {
            return decoder
        } else {
            let decoder = DefaultImageDecoder()
            container.register(decoderType) { _ in return decoder }
            return decoder
        }
    }
    
    func create() -> ImageCachable {
        let container = AppDelegate.shared.container
        let cachType = ImageCache.self
        
        if let cach = container.resolve(cachType) {
            return cach
        } else {
            let cach = ImageCache()
            container.register(cachType) { _ in return cach }
            return cach
        }
    }
}
