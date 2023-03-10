//
//  SearchMovieCell.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 10.03.2023.
//

import UIKit
import SDWebImage

protocol SearchMovieCellProtocol {
    var searchCellImage: String { get }
}

class SearchMovieCell: UICollectionViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    
    func configure(data: SearchMovieCellProtocol) {
        movieImage.sd_setImage(with: URL(string: data.searchCellImage))
    }

}
