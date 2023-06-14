//
//  AddWorkCycleViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/14.
//

import UIKit

class AddWorkCycleViewController: UIViewController {

    @IBOutlet var addWorkCycleCollectionView: UICollectionView!


    func creatLayout() -> UICollectionViewLayout {

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .absolute(100))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addWorkCycleCollectionView.collectionViewLayout = creatLayout()
        
    }


}

extension AddWorkCycleViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        addWorkCycleList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AddWorkCycleCollectionViewCell", for: indexPath) as! AddWorkCycleCollectionViewCell

        let target = addWorkCycleList[indexPath.row]

        cell.addWorkCycleLabel.text = target

        return cell
    }


}
