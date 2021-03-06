
struct Movie: Codable {
    let voteCount, id: Int
    let video: Bool
    let voteAverage: Double
    let title: String
    let popularity: Double
    let posterPath, originalTitle: String?
    let originalLanguage: String?
    let genreIDS: [Int]
    let backdropPath: String?
    let adult: Bool
    let overview, releaseDate: String
    var imageUrl: String? {
        return Constants.Pathes.Movies.imageBaseUrl + (self.posterPath ?? "")
    }
    
    enum CodingKeys: String, CodingKey {
        case voteCount = "vote_count"
        case id, video
        case voteAverage = "vote_average"
        case title, popularity
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case backdropPath = "backdrop_path"
        case adult, overview
        case releaseDate = "release_date"
    }
}
