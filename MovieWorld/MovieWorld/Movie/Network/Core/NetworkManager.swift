//
//  NetworkManager.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 7.03.2023.
//

import Foundation
import Alamofire

class NetworkManager {
    static let shared = NetworkManager()
    
    func request<T: Codable>(path: String, onSuccess: @escaping (T) -> (), onError: (AFError) -> () ) {
        AF.request(path, encoding: JSONEncoding.default).validate().responseDecodable(of: T.self) { response in
            guard let model = response.value else { print("oeabi network manager \(response.error as Any)"); return}
            onSuccess(model)
        }
    }
}

