//
//  WatchListManager.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 18.03.2023.
//

import Foundation
import Alamofire

class WatchListManager {
    
    static let shared = WatchListManager()
    
    func getWatchListItems(id: String, onSuccess: @escaping (MovieDetailModel?) -> (), onError: @escaping (AFError) -> ()) {
            let url = NetworkHelper.shared.requestUrl(url: "\(WatchListEndPoint.id.rawValue)\(id)?")
            print("id.rawValue: \(WatchListEndPoint.id.rawValue)\(id)")
            print("id.path: \(WatchListEndPoint.id.path)")
            print("oemoto url: \(url)")
            NetworkManager.shared.request(path: url) { movie in
                onSuccess(movie)
            } onError: { error in
                print("osman getDetailItemsError: \(error) ")
            }
        }
}
