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

    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieRelease: UILabel!
    @IBOutlet weak var movieRating: UILabel!
    
    func configure(data: WatchLaterCellProtocol) {
        movieImage.sd_setImage(with: URL(string: data.watchLaterImage))
        movieTitle.text = data.watchLaterTitle
        movieRelease.text = data.watchLaterRelease
        movieRating.text = data.watchLaterRating
    }
    
}
