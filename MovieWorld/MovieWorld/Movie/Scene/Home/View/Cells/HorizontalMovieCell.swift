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

    //MARK: - Properties
    @IBOutlet private weak var movieImage: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var ratingLabel: UILabel!
    @IBOutlet private weak var releaseLabel: UILabel!
    
    //MARK: - Life cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    //MARK: - Functions
    func configure(data: HorizontalMovieCellProtocol) {
        if data.horizontalCellImage == "https://image.tmdb.org/t/p/original/" {
            movieImage.image = UIImage(systemName: "photo.on.rectangle.angled")
        } else {
            movieImage.sd_setImage(with: URL(string: data.horizontalCellImage), placeholderImage: UIImage(systemName: "photo.on.rectangle.angled"))
        }
        titleLabel.text = data.horizontalCellTitle
        ratingLabel.text = "⭐️\(data.horizontalCellRating)"
        releaseLabel.text = data.horizontalCellRelease
        movieImage.layer.cornerRadius = 8
    }
}
