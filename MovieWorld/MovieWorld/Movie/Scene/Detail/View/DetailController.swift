//
//  DetailController.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 13.03.2023.
//

import UIKit
import SDWebImage

protocol DetailControllerProtocol {
    var detailViewImage: String { get }
    var detailViewTitle: String { get }
    var detailViewRelease: String { get }
    var detailViewOverview: String { get }
    var detailViewRating: String { get }
}

class DetailController: UIViewController {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieRelease: UILabel!
    @IBOutlet weak var movieOverview: UITextView!
    @IBOutlet weak var movieRating: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configure(data: DetailControllerProtocol) {
        movieImage.sd_setImage(with: URL(string: data.detailViewImage))
        movieTitle.text = data.detailViewTitle
        movieRelease.text = data.detailViewRelease
        movieOverview.text = data.detailViewOverview
        movieRating.text = "⭐️\(data.detailViewRating)"
    }
}

