//
//  ViewController.swift
//  collectiontest
//
//  Created by William Finn on 31/08/2020.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    let labels = ["sm" , "big", "bigger", "even bigger", "much much bigger", "very very very large",
                  "sm" , "big", "bigger", "even bigger", "much much bigger", "very very very large"]
    let colors: [UIColor] = [.green, .red, .orange, .blue, .purple, .lightGray, .cyan]
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.collectionViewLayout = layoutConfig()
        collectionView.register(UINib(nibName: labelcell.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: labelcell.reuseIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return labels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: labelcell.reuseIdentifier, for: indexPath) as! labelcell
        cell.mainLabel.text = labels[indexPath.row]
        cell.backgroundColor = colors[indexPath.row % colors.count]
        
        if (indexPath.row == labels.count-1) {
            cell.debug(showImage: true)
        } else {
            cell.debug(showImage: false)
        }
        return cell
    }
    
    func layoutConfig() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
            let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(44), heightDimension: .fractionalHeight(1))
            let item = NSCollectionLayoutItem(layoutSize: itemSize)
            let groupSize = NSCollectionLayoutSize(widthDimension: .estimated(44), heightDimension: .absolute(44))
            let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
            let section = NSCollectionLayoutSection(group: group)
            section.interGroupSpacing = 1
            section.orthogonalScrollingBehavior = .continuous
            return section
        }
    }
}


