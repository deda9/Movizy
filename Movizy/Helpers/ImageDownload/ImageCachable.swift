import UIKit.UIImage

protocol ImageCachable {
    var diskCapacity: Int { get set }
    var dishPath: String? { get set }
    var memoryCapacity: Int { get set }
    
    func saveImage(_ image: UIImage, with id: String)
    func image(id: String) -> UIImage?
    func remove(id: String)
    func removeAll()
}
