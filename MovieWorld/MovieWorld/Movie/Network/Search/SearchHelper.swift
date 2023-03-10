//
//  SearchHelper.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 10.03.2023.
//

import Foundation

enum SearchEndPoint: String {
    case search = "search/movie?"
    
    var path: String {
        switch self {
        case .search:
            return NetworkHelper.shared.requestUrl(url: SearchEndPoint.search.rawValue)
        }
    }
}
