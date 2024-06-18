//
//  CollectionViewCell.swift
//  HomeWork16
//
//  Created by K on 15.06.2024.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var stepLabel: UILabel!
    
    func custom(with step: OnboardingStep) {
        titleLabel.text = step.title
        descriptionLabel.text = step.description
        stepLabel.text = step.step
    }
}
