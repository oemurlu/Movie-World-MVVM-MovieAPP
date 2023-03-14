//
//  Movies.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 7.03.2023.
//

import Foundation

// MARK: - Movie
struct Movies: Codable {
    let page: Int?
    let results: [MovieResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct MovieResult: Codable, HorizontalMovieCellProtocol, VerticalMovieCellProtocol, SearchMovieCellProtocol, DetailControllerProtocol {
    
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let posterPath, releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    var horizontalCellImage: String { "https://image.tmdb.org/t/p/original/\(posterPath ?? "")" }
    var horizontalCellTitle: String { originalTitle ?? "" }
    var horizontalCellRelease: String { releaseDate ?? "" }
    var horizontalCellRating: String {
        if let voteAverage = voteAverage {
            return "\(voteAverage)"
        }
        return ""
    }
    
    var verticalCellImage: String { "https://image.tmdb.org/t/p/original/\(posterPath ?? "")" }
    var searchCellImage: String { "https://image.tmdb.org/t/p/original/\(posterPath ?? "")" }
    
    // - detail controller protocol
    var detailViewImage: String { "https://image.tmdb.org/t/p/original/\(posterPath ?? "")" }
    var detailViewTitle: String { originalTitle ?? "" }
    var detailViewRelease: String {
        // i just wanna get year
        let prefixLength = 4
        return String(releaseDate?.prefix(prefixLength) ?? "")
        
    }
    var detailViewRating: String { "\(voteAverage ?? 0)" }
    var detailViewOverview: String { overview ?? "" }
    //--
    
    
    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}
