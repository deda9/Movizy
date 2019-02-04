import Foundation

@testable import Movizy
class MoviesListViewInteractorMock: MoviesListViewInteractor {

    private var moviesList: [Movie] = []
    override func loadPopluarMovies() {
        self.outputs?.onLoadingMovies()
        self.moviesList = self.getMoviesResponse().moviesList
        self.outputs?.onSuccessLoadMovies(self.moviesList)
    }
    
    override func loadMorePopluarMovies() {
        self.outputs?.onLoadingMovies()
        self.moviesList += self.getMoviesResponse().moviesList
        self.outputs?.onSuccessLoadMovies(self.moviesList)
    }
    
    func getMoviesResponse() -> MoviesResponse {
        let data = JSONHelper.getJSONData(fileName: JSONMockData.movies.rawValue, bundle: Bundle(for: MoviesListViewInteractorMock.self))
        return JSONHelper.parseData(of: MoviesResponse.self, from: data)
    }
}
