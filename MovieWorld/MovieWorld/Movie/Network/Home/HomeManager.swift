//
//  HomeManager.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 7.03.2023.
//

import Foundation
import Alamofire

protocol HomeManagerProtocol {
    func getMovies(type: MovieCategory, onSuccess: @escaping(Movies?) -> (), onError: @escaping(AFError) -> ())
}

class HomeManager: HomeManagerProtocol {
    
    static let shared = HomeManager()
    
    func getMovies(type: MovieCategory, onSuccess: @escaping(Movies?) -> (), onError: @escaping(AFError) -> ()) {
        
        var url = ""
        switch type {
        case .nowPlaying:
            url = HomeEndPoint.nowPlaying.path
        case .upcoming:
            url = HomeEndPoint.upcoming.path
        case .popular:
            url = HomeEndPoint.popular.path
        case .topRated:
            url = HomeEndPoint.topRated.path
        }

        NetworkManager.shared.request(path: url) { (response: Movies) in
            print("osman1: basarili")
            onSuccess(response)
        } onError: { error in
            print("EMRE ERROR : \(error)")
        }
    }
}
