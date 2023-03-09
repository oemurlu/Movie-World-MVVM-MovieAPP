//
//  FilterTableViewCell.swift
//  MovieWorld
//
//  Created by Osman Emre Ömürlü on 9.03.2023.
//

import UIKit

class FilterTableViewCell: UITableViewCell {
    
    @IBOutlet weak var filterTitleLabel: UILabel!
    
    func configure(title: String) {
        filterTitleLabel.text = title
    }
}
