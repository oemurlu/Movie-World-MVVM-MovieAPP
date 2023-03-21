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
    //MARK: - Properties
    @IBOutlet private weak var movieImage: UIImageView!
    @IBOutlet private weak var movieTitle: UILabel!
    @IBOutlet private weak var movieRelease: UILabel!
    @IBOutlet private weak var movieOverview: UITextView!
    @IBOutlet private weak var movieRating: UILabel!
    @IBOutlet private weak var favoriteButton: UIButton!
    
    private let viewModel = DetailViewModel()
    private var selectedMovieId = 0 {
        didSet {
            didMovieAddedToWatchList()
        }
    }
    
    //MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK: - Interaction handlers
    @IBAction func favoriteButtonPressed(_ sender: UIButton) {
        viewModel.addMovieToWatchList(movieId: selectedMovieId) { boolResult in
            self.viewModel.watchLaterButtonDecision(result: boolResult) { (imageName: String) in
                self.favoriteButton.setImage(UIImage(systemName: imageName), for: .normal)
            }
        }
    }
    
    //MARK: - Functions
    func configure(data: DetailControllerProtocol) {
        
        if data.detailViewImage == "https://image.tmdb.org/t/p/original/" {
            movieImage.image = UIImage(systemName: "photo.on.rectangle.angled")
        } else {
            movieImage.sd_setImage(with: URL(string: data.detailViewImage))
        }

        movieTitle.text = data.detailViewTitle
        movieRelease.text = data.detailViewRelease
        movieOverview.text = data.detailViewOverview
        movieRating.text = "⭐️\(data.detailViewRating)"
        selectedMovieId = data.detailViewMovieId
    }
    
    private func didMovieAddedToWatchList() {
        viewModel.didMovieAddedToWatchLaterList(movieId: selectedMovieId) { (result: Bool) in
            if result == true {
                self.favoriteButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            } else {
                self.favoriteButton.setImage(UIImage(systemName: "heart"), for: .normal)
            }
        }
    }
}

