import UIKit.UIImage

class ImageCache: ImageCachable {
    
    var memoryCapacity: Int = 10 * 1024 * 1024
    var diskCapacity: Int = 50 * 1024 * 1024
    var dishPath: String?
    private let cache = NSCache<NSString, UIImage>()
    
    func saveImage(_ image: UIImage, with id: String) {
        cache.setObject(image, forKey: id as NSString)
    }
    
    func image(id: String) -> UIImage? {
        let image = cache.object(forKey: id as NSString)
        return image
    }
    
    func remove(id: String) {
        cache.removeObject(forKey: id as NSString)
    }
    
    func removeAll() {
        cache.removeAllObjects()
    }
}
