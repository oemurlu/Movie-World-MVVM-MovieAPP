//
//  SearchViewModel.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 10.03.2023.
//

import Foundation

class SearchViewModel {
    //MARK: - Properties
    let manager = SearchManager.shared
    let homeManager = HomeManager.shared
    
    var successCallback: (() -> ())?
    var textIsEmptyCallback: (() -> ())?
    var searchMovieItems = [MovieResult]()

    private var _text = "A"
        var text: String {
            get {
                return _text
            }
            set {
                _text = newValue.trimmingCharacters(in: .whitespacesAndNewlines)
                if _text.isEmpty {
                    _text = "A" // text bos ise "A" atanacak
                }
            }
        }
    
    //MARK: - Functions
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
