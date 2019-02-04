import Alamofire

enum MoviesAPIs: URLRequestBuilder {
    case getPopularList(Int)
    case searchMovie(String, Int)
}

extension MoviesAPIs {
    var path: String {
        switch self {
        case .getPopularList:
            return Constants.Pathes.Movies.popularList
        case .searchMovie:
            return Constants.Pathes.Movies.searchMovie
        }
    }
}

extension MoviesAPIs {
    var parameters: Parameters? {
        switch self {
        case .getPopularList(let page):
            return ["language": Constants.Language.en,
                    "api_key": Constants.Keys.MovieDB,
                    "page": page
            ]
        case .searchMovie(let query, let page):
            return ["language": Constants.Language.en,
                    "api_key": Constants.Keys.MovieDB,
                    "query": query,
                    "page": page
            ]
        }
    }
}

extension MoviesAPIs {
    var method: HTTPMethod {
        switch self {
        case .getPopularList:
            return HTTPMethod.get
        case .searchMovie:
            return HTTPMethod.get
        }
    }
}
