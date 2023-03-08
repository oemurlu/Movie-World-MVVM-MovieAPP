//
//  HomeHelper.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 7.03.2023.
//

import Foundation

// HomeViewModel'de getCategory func icin
enum MovieCategory {
    case nowPlaying
    case popular
    case topRated
    case upcoming
}

enum HomeEndPoint: String {
    case nowPlaying = "movie/now_playing?"
    case popular = "movie/popular?"
    case topRated = "movie/topRated?"
    case upcoming = "movie/upcoming?"
    
    var path: String {
        switch self {
        case .nowPlaying:
            return NetworkHelper.shared.requestUrl(url: HomeEndPoint.nowPlaying.rawValue)
        case .popular:
            return NetworkHelper.shared.requestUrl(url: HomeEndPoint.popular.rawValue)
        case .topRated:
            return NetworkHelper.shared.requestUrl(url: HomeEndPoint.popular.rawValue)
        case .upcoming:
            return NetworkHelper.shared.requestUrl(url: HomeEndPoint.upcoming.rawValue)
        }
    }
}


