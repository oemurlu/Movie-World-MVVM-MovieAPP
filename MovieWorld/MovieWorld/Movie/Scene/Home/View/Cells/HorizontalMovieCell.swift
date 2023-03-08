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
        titleLabel.text = data.horizontalCellTitle
        movieImage.sd_setImage(with: URL(string: data.horizontalCellImage))
        ratingLabel.text = "⭐️\(data.horizontalCellRating)"
        releaseLabel.text = data.horizontalCellRelease
    }
    

}
