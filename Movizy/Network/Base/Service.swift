import Alamofire

extension DataResponse {
    enum Errors: Error {
        case unKnown
    }
    
    var inputDataNil: Error {
        guard let _ = self.error else {
            return Errors.unKnown
        }
        return AFError.responseSerializationFailed(reason: AFError.ResponseSerializationFailureReason.inputDataNil)
    }
}

class NetworkService<T: Codable> {
    class func execute(_ URLRequest: URLRequestConvertible, completion: @escaping (Result<T>) -> Void) {
        Alamofire.request(URLRequest).responseData { response in
            let decorder = JSONDecoder()
            let result: Result<T> = decorder.decodeResponse(from: response)
            completion(result)
        }
    }
}
