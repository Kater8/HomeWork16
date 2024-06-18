//
//  MainCollectionViewController.swift
//  HomeWork16
//
//  Created by K on 16.06.2024.
//

import UIKit

private extension MainCollectionViewController {
    static let segueIdentifier = "showDetail"
}

class MainCollectionViewController: UICollectionViewController {
    
    private var dataSource = [MainCollectionItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = generateDataSource()

        //    налаштування вигляду
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        let itemWidth = collectionView.bounds.width / 3
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        collectionView.collectionViewLayout = layout
        
    }


    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        super.collectionView(collectionView, didSelectItemAt: indexPath)
    }
}

private extension MainCollectionViewController {
    func generateDataSource() -> [MainCollectionItem] {
        var result = [MainCollectionItem]()
        for i in 1...100 {
            result.append(MainCollectionItem(title: String(i)))
        }
        return result
    }
}
