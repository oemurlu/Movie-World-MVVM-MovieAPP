//
//  NetworkHelper.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 7.03.2023.
//

import Foundation

enum NetworkEndPoint: String {
    case BASE_URL = "https://api.themoviedb.org/3/"
    case API_KEY = "api_key=bc2c270a5fe89e16e06dbf88dd4cea81"
}

class NetworkHelper {
    static let shared = NetworkHelper()
    
    func requestUrl(url: String) -> String {
        return "\(NetworkEndPoint.BASE_URL.rawValue)\(url)\(NetworkEndPoint.API_KEY.rawValue)"
    }
    
}

//https://api.themoviedb.org/3/movie/550?api_key=bc2c270a5fe89e16e06dbf88dd4cea81
