//
//  WatchLaterCell.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 17.03.2023.
//

import UIKit
import SDWebImage

protocol WatchLaterCellProtocol {
    var watchLaterImage: String { get }
    var watchLaterTitle: String { get }
    var watchLaterRelease: String { get }
    var watchLaterRating: String { get }
    
}

class WatchLaterCell: UITableViewCell {
    //MARK: - Properties
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieRelease: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    
    //MARK: - Functions
    func configure(data: WatchLaterCellProtocol) {
        if data.watchLaterImage == "https://image.tmdb.org/t/p/original/" {
            movieImage.image = UIImage(systemName: "photo.on.rectangle.angled")
        } else {
            movieImage.sd_setImage(with: URL(string: data.watchLaterImage), placeholderImage: UIImage(systemName: "photo.on.rectangle.angled"))
        }
        
        movieTitle.text = data.watchLaterTitle
        movieRelease.text = data.watchLaterRelease
        movieRating.text = data.watchLaterRating
        movieImage.layer.cornerRadius = 8
    }
    
}
