//
//  HomeHeader.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 9.03.2023.
//

import UIKit

class HomeHeader: UICollectionReusableView {

    //MARK: - Properties
    @IBOutlet private weak var collectionView: UICollectionView!
    
    private var items = [MovieResult]()
    
    //MARK: - Life cycle
    override func layoutSubviews() {
        collectionView.register(UINib(nibName: "\(VerticalMovieCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(VerticalMovieCell.self)")
    }
    
    //MARK: - Functions
    func configure(data: [MovieResult]) {
        self.items = data
        collectionView.reloadData()
    }
}

//MARK: - Extensions
extension HomeHeader: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(VerticalMovieCell.self)", for: indexPath) as! VerticalMovieCell
        cell.configure(data: items[indexPath.item])
        cell.layer.cornerRadius = 20
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = collectionView.frame.height
        let width = height * 2 / 3
        return CGSize(width: width, height: height)
    }
}

