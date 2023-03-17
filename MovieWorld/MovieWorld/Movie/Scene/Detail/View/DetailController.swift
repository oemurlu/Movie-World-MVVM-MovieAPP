//
//  DetailController.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 13.03.2023.
//

import UIKit
import SDWebImage
import FirebaseFirestore

protocol DetailControllerProtocol {
    var detailViewImage: String { get }
    var detailViewTitle: String { get }
    var detailViewRelease: String { get }
    var detailViewOverview: String { get }
    var detailViewRating: String { get }
    var detailViewMovieId: Int { get }
}

class DetailController: UIViewController {
    
    @IBOutlet weak var movieImage: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieRelease: UILabel!
    @IBOutlet weak var movieOverview: UITextView!
    @IBOutlet weak var movieRating: UILabel!
    @IBOutlet weak var favoriteButton: UIButton!
    
    private let viewModel = DetailViewModel()
    private var selectedMovieId = 0 {
        didSet {
            didMovieAddedToWatchList()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
  
    @IBAction func favoriteButtonPressed(_ sender: UIButton) {
        viewModel.addMovieToWatchList(movieId: selectedMovieId) { boolResult in
            self.viewModel.watchLaterButtonDecision(result: boolResult) { imageName in
                self.favoriteButton.setImage(UIImage(systemName: imageName), for: .normal)
            }
        }
    }
    
    func configure(data: DetailControllerProtocol) {
        movieImage.sd_setImage(with: URL(string: data.detailViewImage))
        movieTitle.text = data.detailViewTitle
        movieRelease.text = data.detailViewRelease
        movieOverview.text = data.detailViewOverview
        movieRating.text = "⭐️\(data.detailViewRating)"
        selectedMovieId = data.detailViewMovieId
    }
    
    func didMovieAddedToWatchList() {
        
        print(selectedMovieId)
        viewModel.didMovieAddedToWatchLaterList(movieId: selectedMovieId) { result in
            if result == true {
                self.favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            } else {
                self.favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
            }
        }
        
    }
}

