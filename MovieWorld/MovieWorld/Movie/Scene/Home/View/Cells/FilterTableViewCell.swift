//
//  FilterTableViewCell.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 9.03.2023.
//

import UIKit

class FilterTableViewCell: UITableViewCell {
    
    //MARK: - Properties
    @IBOutlet private weak var filterTitleLabel: UILabel!
    
    //MARK: - Functions
    func configure(title: String) {
        filterTitleLabel.text = title
    }
}
