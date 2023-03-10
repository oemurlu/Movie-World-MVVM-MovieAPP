//
//  SearchManager.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 10.03.2023.
//

import Foundation
import Alamofire

protocol SearchManagerProtocol {
    func getSearchResults(text: String, onSuccess: @escaping(Movies?) -> (), onError: @escaping(AFError) -> ())
}

class SearchManager: SearchManagerProtocol {
    
    static let shared = SearchManager()
    
    func getSearchResults(text: String, onSuccess: @escaping (Movies?) -> (), onError: @escaping(AFError) -> ()) {
        let url = SearchEndPoint.search.path + "&query=\(text)"
        NetworkManager.shared.request(path: url) { (response: Movies) in
            onSuccess(response)
        } onError: { error in
            onError(error)
        }
    }
}
