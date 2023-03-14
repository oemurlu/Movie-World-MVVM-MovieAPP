//
//  SearchViewModel.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 10.03.2023.
//

import Foundation

class SearchViewModel {
    
    let manager = SearchManager.shared
    let homeManager = HomeManager.shared
    
    var successCallback: (() -> ())?
    var textIsEmptyCallback: (() -> ())?
    var searchMovieItems = [MovieResult]()
    var text = ""
    
    func getMovies() {
        manager.getSearchResults(text: text) { movies in
            if let movies = movies {
                self.searchMovieItems = movies.results ?? []
                self.successCallback?()
            }
        } onError: { error in
            print("error while getting movies on SearchViewModel.swift: \(error)")
        }
    }    
}
