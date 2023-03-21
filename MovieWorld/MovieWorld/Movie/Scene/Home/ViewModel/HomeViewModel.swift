//
//  HomeViewModel.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 7.03.2023.
//

import Foundation

class HomeViewModel {
    
    //MARK: - Properties
    let manager = HomeManager.shared
    var movieItems = [MovieResult]()
    var nowPlayingItemsForHeader = [MovieResult]()
    var successCallback: (() -> ())?

    //MARK: - Functions
    func getCategory(type: MovieCategory) {
        manager.getMovies(type: type) { movies in
            if let movies = movies {
                self.movieItems = movies.results ?? []
                self.successCallback?()
            }
        } onError: { error in
            print("osman error: \(error.localizedDescription)")
        }
    }
    
    func getNowPlayingForHeader() {
        manager.getMovies(type: .nowPlaying) { movies in
            if let movies = movies {
                self.nowPlayingItemsForHeader = movies.results ?? []
                self.successCallback?()
            }
        } onError: { error in
            print("osman error: \(error.localizedDescription)")
        }
    }
}
