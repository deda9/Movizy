import UIKit
import ImageIO

protocol ImageDecoder {
    func decode(from data: Data, options: ImageDecoderOptions?) throws -> UIImage?
}

struct DefaultImageDecoder: ImageDecoder {
    func decode(from data: Data, options: ImageDecoderOptions?) throws -> UIImage? {
        guard let options = options else {
            return UIImage(data: data)
        }
        
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else {
            throw ImageDecoderError.failedCreatedImageSource
        }
        
        var decoderOptions: CFDictionary?
        
        if options.composeImage {
            let maxPixel = max(options.outputSize.width, options.outputSize.height)
            let options = [
                kCGImageSourceThumbnailMaxPixelSize: maxPixel
            ]
            decoderOptions = options as CFDictionary?
        }
        
        guard let cgImage = CGImageSourceCreateImageAtIndex(source, 0, decoderOptions) else {
            throw ImageDecoderError.failedCreatedImage
        }
        return UIImage(cgImage: cgImage)
    }
}

struct ImageDecoderOptions {
    var composeImage: Bool {
        return outputSize != CGSize.zero
    }
    var outputSize: CGSize = CGSize.zero
    var isOpaque = false
}

enum ImageDecoderError: Error {
    case failedCreatedImage
    case failedCreatedImageSource
    case failedDecodingImage
}
