//
//  SearchController.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 7.03.2023.
//

import UIKit

class SearchController: UIViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    private let viewModel = SearchViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionSetup()
        viewModelConfiguration()
        collectionFlowSetup()
    }
    
    func collectionSetup() {
        collectionView.register(UINib(nibName: "\(SearchMovieCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(SearchMovieCell.self)")
    }
    
    func collectionFlowSetup() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 5
        layout.minimumInteritemSpacing = 5
        collectionView.setCollectionViewLayout(layout, animated: true)
    }
    
    func viewModelConfiguration() {
        viewModel.successCallback = { [weak self] in
            self?.collectionView.reloadData()
        }
    }
    
    private func loadDetailVC() -> DetailController {
        let vc = storyboard?.instantiateViewController(withIdentifier: "\(DetailController.self)") as! DetailController
        vc.loadViewIfNeeded()
        return vc
    }
}


extension SearchController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.text = searchText
        viewModel.getMovies()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
}

extension SearchController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.searchMovieItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(SearchMovieCell.self)", for: indexPath) as! SearchMovieCell
        cell.configure(data: viewModel.searchMovieItems[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = loadDetailVC()
        vc.configure(data: viewModel.searchMovieItems[indexPath.row])
        show(vc, sender: nil)
    }
    
    // her item arasi bosluk
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 1.0, left: 1.0, bottom: 1.0, right: 1.0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let gridLayout = collectionViewLayout as! UICollectionViewFlowLayout
        let widthPerItem = collectionView.frame.width / 3 - gridLayout.minimumInteritemSpacing
        return CGSize(width: widthPerItem, height: widthPerItem * 3 / 2)
    }
}
