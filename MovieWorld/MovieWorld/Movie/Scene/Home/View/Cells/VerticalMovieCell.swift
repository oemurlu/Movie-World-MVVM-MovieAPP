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
    
    @IBOutlet weak var movieImage: UIImageView!

    
    func configure(data: VerticalMovieCellProtocol) {
        movieImage.sd_setImage(with: URL(string: data.verticalCellImage))
        movieImage.layer.cornerRadius = 20
    }

}