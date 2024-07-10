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
    @IBOutlet weak var goButton: UIButton!

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
//        goButton.isHidden = true
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        collectionView.collectionViewLayout.invalidateLayout()
    }
}

extension OnboardingViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OnboardingCollectionViewCell", for: indexPath) as? OnboardingCollectionViewCell
        let step = onboardingSteps[indexPath.item]
        
        cell?.custom(with: step)

        return cell ?? UICollectionViewCell.init()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return onboardingSteps.count
    }
}

extension OnboardingViewController: UICollectionViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = Int((round(scrollView.contentOffset.x / scrollView.frame.size.width)))
        pageControl.currentPage = pageNumber
        goButton.isHidden = pageNumber != (onboardingSteps.count - 1)
    }
}
