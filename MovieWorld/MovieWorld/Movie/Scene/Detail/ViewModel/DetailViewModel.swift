//
//  DetailViewModel.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 13.03.2023.
//

import Foundation

class DetailViewModel {
    
    let manager = DetailManager.shared
    
    var id: Int!
    var detailMovie = [DetailResult]()
    var successCallback: (() -> ())?
    
    func getDetail() {
        manager.getDetailItems(id: id) { detailMovie in
            if let detailMovie = detailMovie {
                self.detailMovie = detailMovie.results ?? []
            }
        } onError: { error in
            print("osman error at DetailViewModel getDetail: \(error)")
        }
    }
}
