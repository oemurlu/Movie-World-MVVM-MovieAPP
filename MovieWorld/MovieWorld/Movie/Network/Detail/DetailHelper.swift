//
//  DetailHelper.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 13.03.2023.
//

import Foundation

enum DetailEndPoint: String {
    case movie = "movie/"
    
    var path: String {
        switch self {
        case .movie:
            return NetworkHelper.shared.requestUrl(url: DetailEndPoint.movie.rawValue)
        }
    }
}
