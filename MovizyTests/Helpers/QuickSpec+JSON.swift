import Quick

@testable import Movizy
extension QuickSpec {
    
    class Test {}
    
    func getMoviesResponse() -> MoviesResponse {
        let data = JSONHelper.getJSONData(fileName: JSONMockData.movies.rawValue, bundle: Bundle(for: Test.self))
        return JSONHelper.parseData(of: MoviesResponse.self, from: data)
    }
    
    func getMoviesList() -> [Movie] {
        return self.getMoviesResponse().moviesList
    }
    
    func getFirstMovie() -> Movie {
        let movies = self.getMoviesList()
        guard !movies.isEmpty else {
            fatalError("Cant get the first Movie while getting the movies list for testing")
        }
        return movies[0]
    }
}
