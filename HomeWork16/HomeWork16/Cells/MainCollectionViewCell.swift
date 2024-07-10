//
//  MainCollectionViewCell.swift
//  HomeWork16
//
//  Created by K on 18.06.2024.
//

import Foundation
import UIKit

class MainCollectionViewCell: UICollectionViewCell {
     
    @IBOutlet weak var titleLabel: UILabel!
    
    func custom(with item: MainCollectionItem) {
        titleLabel.text = item.title
    }
}
