//
//  MovieDetail.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 13.03.2023.
//

import Foundation

// MARK: - MovieDetail
struct MovieDetail: Codable {
    let page: Int?
    let results: [DetailResult]?
    let totalPages, totalResults: Int?

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct DetailResult: Codable, DetailControllerProtocol, SearchMovieCellProtocol {
    
    let adult: Bool?
    let backdropPath: String?
    let genreIDS: [Int]?
    let id: Int?
    let originalLanguage, originalTitle, overview: String?
    let popularity: Double?
    let posterPath: String?
    let releaseDate, title: String?
    let video: Bool?
    let voteAverage: Double?
    let voteCount: Int?

    //
    var searchCellImage: String { "https://image.tmdb.org/t/p/original/\(posterPath ?? "")" }
    //
    
    
    // - detail controller protocol
    var detailViewImage: String { "https://image.tmdb.org/t/p/original/\(posterPath ?? "")" }
    var detailViewTitle: String { originalTitle ?? "" }
    var detailViewRelease: String {
        // i just wanna get year
        let prefixLength = 4
        return String(releaseDate?.prefix(prefixLength) ?? "")
    }
    var detailViewOverview: String { overview ?? ""}
    var detailViewId: String { "\(id ?? 1)" }
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

