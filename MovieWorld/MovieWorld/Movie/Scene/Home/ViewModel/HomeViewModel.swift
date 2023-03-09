//
//  HomeViewModel.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 7.03.2023.
//

import Foundation

class HomeViewModel {
    
    let manager = HomeManager.shared
    
    var popularItems = [MovieResult]()
    var successCallback: (() -> ())?
    
    var movieItems = [MovieResult]()
    
    func getCategory(type: MovieCategory) {
        manager.getMovies(type: type) { movies in
            if let movies = movies {
                self.popularItems = movies.results ?? []
                self.successCallback?()
            }
        } onError: { error in
            print("osman error: \(error.localizedDescription)")
        }
    }
    
    func getPopular() {
        manager.getMovies(type: .popular) { movies in
            if let movies = movies {
                self.popularItems = movies.results ?? []
                self.successCallback?()
            }
        } onError: { error in
            print("osman error: \(error.localizedDescription)")
        }
    }
    
    func getNowPlaying() {
        manager.getMovies(type: .nowPlaying) { movies in
            if let movies = movies {
                self.popularItems = movies.results ?? []
                self.successCallback?()
            }
        } onError: { error in
            print("osman error: \(error.localizedDescription)")
        }
    }
    
    func getTopRated() {
        manager.getMovies(type: .topRated) { movies in
            if let movies = movies {
                self.popularItems = movies.results ?? []
                self.successCallback?()
            }
        } onError: { error in
            print("osman error: \(error.localizedDescription)")
        }
    }
    
    func getUpcoming() {
        manager.getMovies(type: .upcoming) { movies in
            if let movies = movies {
                self.popularItems = movies.results ?? []
                self.successCallback?()
            }
        } onError: { error in
            print("osman error: \(error.localizedDescription)")
        }
    }
}
