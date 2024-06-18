//
//  OnboardingViewController.swift
//  HomeWork16
//
//  Created by K on 15.06.2024.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    let onboardingSteps: [OnboardingStep] = [
        OnboardingStep(title: "title" , description: "description", step: "step1"),
        OnboardingStep(title: "title" , description: "description", step: "step2"),
        OnboardingStep(title: "title" , description: "description", step: "step3"),
        OnboardingStep(title: "title" , description: "description", step: "step4"),
        OnboardingStep(title: "title" , description: "description", step: "step5"),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Налаштування UICollectionView
        
        collectionView.dataSource = self
        collectionView.delegate = self
        //        чи дозволяти UI прокручувати по сторінках
        collectionView.isPagingEnabled = true
        
        pageControl.numberOfPages = onboardingSteps.count
        pageControl.currentPage = 0
    }
}

extension OnboardingViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as? OnboardingCollectionViewCell
        let step = onboardingSteps[indexPath.item]
        
        cell?.titleLabel.text = step.title
        cell?.descriptionLabel.text = step.description
        cell?.stepLabel.text = step.step
        return cell ?? UICollectionViewCell.init()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingSteps.count
    }
    
}

extension OnboardingViewController: UICollectionViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
    }
}



    
    
