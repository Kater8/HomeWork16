//
//  MainCollectionViewController.swift
//  HomeWork16
//
//  Created by K on 16.06.2024.
//

import UIKit

class MainCollectionViewController: UICollectionViewController {
    
    let segueIdentifier = "showDetail"

    private var dataSource = [MainCollectionItem]()
    private var selectedItem: MainCollectionItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = generateDataSource()

        //    налаштування вигляду
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        let itemWidth = collectionView.bounds.width / 3
        layout.itemSize = CGSize(width: itemWidth, height: itemWidth)
        collectionView.collectionViewLayout = layout
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.selectedItem = dataSource[indexPath.row]
        performSegue(withIdentifier: segueIdentifier, sender: self)
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MainCollectionViewCell", for: indexPath)
        (cell as? MainCollectionViewCell)?.custom(with: dataSource[indexPath.row])
        return cell
    }
}

extension MainCollectionViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        (segue.destination as? DetailsViewController)?.item = selectedItem
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

