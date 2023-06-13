//
//  ViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/10.
//

import UIKit

class SetWorkoutCycleViewController: UIViewController {

    @IBOutlet var pickCollectionView: UICollectionView!

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? WorkCycleViewController, let cell = sender as? UICollectionViewCell, let indexPath = pickCollectionView.indexPath(for: cell)  {
            let target = cycleList[indexPath.row]
            vc.selectedSegue = target
        }
    }

    func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(0.8))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .fractionalHeight(1.0))

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)
                    section.orthogonalScrollingBehavior = .groupPaging
        let layout = UICollectionViewCompositionalLayout(section: section)

        return layout
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        pickCollectionView.collectionViewLayout = createLayout()
        pickCollectionView.reloadData()
    }
}

extension SetWorkoutCycleViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cycleList.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PickCollectionViewCell", for: indexPath) as! PickCollectionViewCell

        let target = cycleList[indexPath.row]

        cell.pickWorkoutCycleLabel.text = target
        return cell
    }
}

enum SegueID: String {
    case twoCycle   = "2분할"
    case threeCycle = "3분할"
    case fourCycle  = "4분할"
    case fiveCycle  = "5분할"
}


