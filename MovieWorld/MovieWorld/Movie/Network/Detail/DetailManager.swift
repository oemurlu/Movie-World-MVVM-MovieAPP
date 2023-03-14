////
////  DetailManager.swift
////  MovieWorld
////
////  Created by Osman Emre Ömürlü on 13.03.2023.
////
//
//import Foundation
//import Alamofire
//
//protocol DetailManagerProtocol {
//    func getDetailItems(id: Int, onSuccess: @escaping (MovieDetail?) -> (), onError: @escaping (AFError) -> () )
//}
//
//class DetailManager: DetailManagerProtocol {
//    
//    static let shared = DetailManager()
//    
//    func getDetailItems(id: Int, onSuccess: @escaping (MovieDetail?) -> (), onError: @escaping (AFError) -> ()) {
////        let url = DetailEndPoint.movie.path + "\(id)"
//        let url = NetworkHelper.shared.requestUrl(url: "\(DetailEndPoint.movie.rawValue)\(id)?")
////        print("movie.rawValue: \(DetailEndPoint.movie.rawValue)\(id)")
////        print("movie.path: \(DetailEndPoint.movie.path)")
//        print("oemoto url: \(url)")
//        NetworkManager.shared.request(path: url) { movie in
//            onSuccess(movie)
//        } onError: { error in
//            print("osman getDetailItemsError: \(error) ")
//        }
//    }
//}
