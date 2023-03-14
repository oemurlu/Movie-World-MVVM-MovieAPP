////
////  DetailViewModel.swift
////  MovieWorld
////
////  Created by Osman Emre Ömürlü on 13.03.2023.
////
//
//import Foundation
//
//class DetailViewModel {
//    
//    let manager = DetailManager.shared
//    
//    var id: Int!
//    var detailMovie = [DetailResult]()
//    var successCallback: (() -> ())?
//    
//    func getDetail() {
//        print("detailViewModel oemoto getDetail calisiyor")
//        manager.getDetailItems(id: id) { detailMovie in
//            if let detailMovie = detailMovie {
//                self.detailMovie = detailMovie.results ?? []
//                self.successCallback?()
//            }
//        } onError: { error in
//            print("osman error at DetailViewModel getDetail: \(error)")
//        }
//    }
//
//}
