import Foundation
import Alamofire

extension JSONDecoder {
    func decodeResponse<T: Codable>(from response: DataResponse<Data>) -> Result<T> {
        switch response.result {
        case .success(let data):
            do {
                let item = try decode(T.self, from: data)
                return Result.success(item)
            } catch {
                return Result.failure(error)
            }
        case .failure(let error):
            return Result.failure(error)
        }
    }
}
