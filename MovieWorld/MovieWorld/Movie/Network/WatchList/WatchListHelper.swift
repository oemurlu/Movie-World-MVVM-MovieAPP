//
//  WatchListHelper.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 18.03.2023.
//

import Foundation

enum WatchListEndPoint: String {
    case id = "movie/"
    
    var path: String {
        switch self {
        case .id:
            print("return path: \(NetworkHelper.shared.requestUrl(url: WatchListEndPoint.id.rawValue))")
            return NetworkHelper.shared.requestUrl(url: WatchListEndPoint.id.rawValue)
        }
    }
}
