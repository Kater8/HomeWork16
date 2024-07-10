//
//  DetailsViewController.swift
//  HomeWork16
//
//  Created by K on 18.06.2024.
//

import Foundation
import UIKit

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!

    var item: MainCollectionItem?
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let item = item {
            titleLabel.text = "title \(item.title)"
        }
    }
}
