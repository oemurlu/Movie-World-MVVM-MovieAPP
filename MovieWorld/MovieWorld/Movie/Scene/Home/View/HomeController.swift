//
//  HomeController.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 7.03.2023.
//

import UIKit
import SDWebImage


class HomeController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionSetup()
        viewModelConfiguration()
    }
    
    @IBAction func showFilterButtonPressed(_ sender: UIBarButtonItem) {
        let controller = storyboard?.instantiateViewController(withIdentifier: "\(FilterController.self)") as! FilterController
        controller.selectionCallback = { category in
            self.viewModel.getCategory(type: category)
        }
        self.presentPanModal(controller)
    }
    
    private func collectionSetup() {
        collectionView.register(UINib(nibName: "\(HorizontalMovieCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(HorizontalMovieCell.self)")
        
        collectionView.register(UINib(nibName: "\(HomeHeader.self)", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(HomeHeader.self)")
    }
    
    private func viewModelConfiguration() {
        viewModel.getNowPlaying()
        viewModel.getPopular()
        viewModel.successCallback = { [weak self] in
            self?.collectionView.reloadData()
        }
    }
}

extension HomeController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.popularItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(HorizontalMovieCell.self)", for: indexPath) as! HorizontalMovieCell
        cell.configure(data: viewModel.popularItems[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 140)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "\(HomeHeader.self)", for: indexPath) as! HomeHeader
        header.configure(data: viewModel.nowPlayingItems)
        return header
    }
}



