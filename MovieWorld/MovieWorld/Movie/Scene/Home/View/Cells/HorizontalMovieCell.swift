//
//  HorizontalMovieCell.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 7.03.2023.
//

import UIKit
import SDWebImage

protocol HorizontalMovieCellProtocol {
    var horizontalCellImage: String { get }
    var horizontalCellTitle: String { get }
    var horizontalCellRelease: String { get }
    var horizontalCellRating: String { get }
}

class HorizontalMovieCell: UICollectionViewCell {

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var releaseLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configure(data: HorizontalMovieCellProtocol) {
        if data.horizontalCellImage == "https://image.tmdb.org/t/p/original/" {
            movieImage.image = UIImage(systemName: "photo.on.rectangle.angled")
        } else {
            movieImage.sd_setImage(with: URL(string: data.horizontalCellImage))
        }
        titleLabel.text = data.horizontalCellTitle
        ratingLabel.text = "⭐️\(data.horizontalCellRating)"
        releaseLabel.text = data.horizontalCellRelease
        movieImage.layer.cornerRadius = 8
    }
}
