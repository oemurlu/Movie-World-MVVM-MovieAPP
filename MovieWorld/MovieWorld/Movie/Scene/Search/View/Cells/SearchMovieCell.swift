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
    //MARK: - Properties
    @IBOutlet private weak var movieImage: UIImageView!
    
    //MARK: - Functions
    func configure(data: SearchMovieCellProtocol) {
        if data.searchCellImage == "https://image.tmdb.org/t/p/original/" {
            movieImage.image = UIImage(systemName: "photo.on.rectangle.angled")
        } else {
            movieImage.sd_setImage(with: URL(string: data.searchCellImage), placeholderImage: UIImage(systemName: "photo.on.rectangle.angled"))
        }
    }

}
