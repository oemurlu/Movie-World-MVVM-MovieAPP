//
//  WatchListMovieModel.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 18.03.2023.
//

import Foundation

// MARK: - OneMovieDetail
struct MovieDetailModel: Codable, WatchLaterCellProtocol {
    
    let adult: Bool?
    let backdropPath: String?
    let budget: Int?
    let genres: [Genre]?
    let homepage: String?
    let id: Int?
    let imdbID, originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate: String?
    let revenue, runtime: Int?
    let status, tagline, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case budget, genres, homepage, id
        case imdbID = "imdb_id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case revenue, runtime
        case status, tagline, title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
    
    var watchLaterImage: String { "https://image.tmdb.org/t/p/original/\(posterPath ?? "")" }
    
    var watchLaterTitle: String { originalTitle ?? "" }
    
    var watchLaterRelease: String { releaseDate ?? ""}
    
    var watchLaterRating: String { 
        let formatted = String(format: "%.1f", voteAverage ?? 0)
        return "⭐️\(formatted)"
    }

}

// MARK: - Genre
struct Genre: Codable {
    let id: Int?
    let name: String?
}
