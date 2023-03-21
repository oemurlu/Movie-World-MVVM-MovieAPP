//
//  FilterViewModel.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 9.03.2023.
//

import Foundation

class FilterViewModel {
    //MARK: - Properties
    var items = [
        FilterModel(title: "Popular", type: .popular),
        FilterModel(title: "Top Rated", type: .topRated),
        FilterModel(title: "Now Playing", type: .nowPlaying),
        FilterModel(title: "Upcoming", type: .upcoming)
    ]
}
