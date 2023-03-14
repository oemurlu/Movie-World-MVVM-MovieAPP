//
//  DetailManager.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 13.03.2023.
//

import Foundation
import Alamofire

protocol DetailManagerProtocol {
    func getDetailItems(id: Int, onSuccess: @escaping (MovieDetail?) -> (), onError: @escaping (AFError) -> () )
}

class DetailManager: DetailManagerProtocol {
    
    static let shared = DetailManager()
    
    func getDetailItems(id: Int, onSuccess: @escaping (MovieDetail?) -> (), onError: @escaping (AFError) -> ()) {
        let url = DetailEndPoint.movie.path + "\(id)"
        NetworkManager.shared.request(path: url) { movie in
            onSuccess(movie)
        } onError: { error in
            print("osman getDetailItemsError: \(error) ")
        }
    }
}
    



