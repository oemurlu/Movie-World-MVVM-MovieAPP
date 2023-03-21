//
//  VerticalMovieCell.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 9.03.2023.
//

import UIKit
import SDWebImage

protocol VerticalMovieCellProtocol {
    var verticalCellImage: String { get }
}

class VerticalMovieCell: UICollectionViewCell {
    
    //MARK: - Properties
    @IBOutlet private weak var movieImage: UIImageView!

    //MARK: - Functions
    func configure(data: VerticalMovieCellProtocol) {
        if data.verticalCellImage == "https://image.tmdb.org/t/p/original/" {
            movieImage.image = UIImage(systemName: "photo.on.rectangle.angled")
        } else {
            movieImage.sd_setImage(with: URL(string: data.verticalCellImage), placeholderImage: UIImage(systemName: "photo.on.rectangle.angled"))
        }
        movieImage.layer.cornerRadius = 20
    }

}
