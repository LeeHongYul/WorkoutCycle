//
//  ViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/10.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var pickCollectionView: UICollectionView!
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        let segueID = segue.identifier
//
//
//        switch segueID {
//        case SegueID.twoCycle.rawValue:
//            if let vc = segue.destination as? WorkCycleViewController {
//                vc.selectedSegue = "twoCycle"
//            }
//        case SegueID.threeCycle.rawValue:
//            if let vc = segue.destination as? WorkCycleViewController {
//                vc.selectedSegue = "threeCycle"
//            }
//        case SegueID.fourCycle.rawValue:
//            if let vc = segue.destination as? WorkCycleViewController {
//                vc.selectedSegue = "fourCycle"
//            }
//        case SegueID.fiveCycle.rawValue:
//            if let vc = segue.destination as? WorkCycleViewController {
//                vc.selectedSegue = "fiveCycle"
//            }
//        default:
//            break
//        }
//    }

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

extension ViewController: UICollectionViewDataSource {
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

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        let target = cycleList[indexPath.row]
//
//        let WorkCycleViewController = UINavigationController(rootViewController: WorkCycleViewController())
//
//            switch target {
//            case SegueID.twoCycle.rawValue:
//               present(WorkCycleViewController, animated: true)
////                WorkCycleViewController.selectedSegue = target
////                navigationController?.pushViewController(WorkCycleViewController, animated: true)
//            case SegueID.threeCycle.rawValue:
//                present(WorkCycleViewController, animated: true)
//                navigationController?.pushViewController(WorkCycleViewController, animated: true)
//            case SegueID.fourCycle.rawValue:
//                present(WorkCycleViewController, animated: true)
//                navigationController?.pushViewController(WorkCycleViewController, animated: true)
//            case SegueID.fiveCycle.rawValue:
//                present(WorkCycleViewController, animated: true)
//                navigationController?.pushViewController(WorkCycleViewController, animated: true)
//
//            default:
//                break
//            }
    }
}



enum SegueID: String {
    case twoCycle   = "2분할"
    case threeCycle = "3분할"
    case fourCycle  = "4분할"
    case fiveCycle  = "5분할"
}


