import Foundation
import UIKit

open class JSONHelper {
    static func parseData<T: Codable>(of type: T.Type, from data: Data) -> T {
        do {
            let model = try JSONDecoder().decode(T.self, from: data)
            return model
        } catch let err {
            fatalError("Error while parsing data: \(err)")
        }
    }
    
    static func getJSONData(fileName: String, bundle: Bundle, fileExtesion: String = "json") -> Data {
        guard let path = bundle.path(forResource: fileName, ofType: fileExtesion) else {
            fatalError("\(fileName).json not found")
        }
        guard let josnString = try? NSString(contentsOfFile: path, encoding: String.Encoding.utf8.rawValue) else {
            fatalError("cant convert \(fileName).json to string")
        }
        guard let jsonData = josnString.data(using: String.Encoding.utf8.rawValue) else {
            fatalError("Unable to convert \(fileName).json to NSData")
        }
        return jsonData
    }
    
    static func getImageData(fileName: String, bundle: Bundle, fileExtesion: String = "json") -> Data {
        guard let path = bundle.path(forResource: fileName, ofType: fileExtesion) else {
            fatalError("\(fileName).txt not found")
        }
        guard let imageString = try? String(contentsOfFile: path) else {
            fatalError("cant convert \(fileName) to string")
        }
        let trimmedText = imageString.replacingOccurrences(of: "\n", with: "")
        guard let imageData = Data(base64Encoded: trimmedText) else {
            fatalError("Unable to convert \(fileName) to NSData")
        }
        return imageData
    }
}

enum JSONMockData: String {
    case movies = "MoviesListResponseMockData"
}
