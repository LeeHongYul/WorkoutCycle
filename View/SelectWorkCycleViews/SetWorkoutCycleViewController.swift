//
//  ViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/10.
//

import UIKit

class SetWorkoutCycleViewController: BaseViewController {

    @IBOutlet var setThemeControl: UISegmentedControl!

    @IBAction func setThemeControl(_ sender: Any) {
        if setThemeControl.selectedSegmentIndex == 0 {
            print(setThemeControl.titleForSegment(at: 0))
        } else {
            print(setThemeControl.titleForSegment(at: 2))
        }
    }

    @IBOutlet var pickCollectionView: UICollectionView!
    @IBOutlet var workcyclePageControl: UIPageControl!
    @IBOutlet var recommendTableView: UITableView!

    @IBAction func workcyclePageControl(_ sender: Any) {

        let indexPath = IndexPath(item: self.workcyclePageControl.currentPage, section: 0)

        pickCollectionView.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
    }

    func setPageControl() {
        workcyclePageControl.currentPage = 0
        workcyclePageControl.numberOfPages = cycleList.count
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? WorkCycleViewController, let cell = sender as? UICollectionViewCell, let indexPath = pickCollectionView.indexPath(for: cell)  {
            let target = cycleList[indexPath.row]
            vc.selectedSegue = target
        } else if segue.identifier == "RecommendSegue", let cell = sender as? UITableViewCell, let indexPath = recommendTableView.indexPath(for: cell) {
            let target = recommendWorkCycle[indexPath.row]
            let target2 = context[indexPath.row]
            let target3 = detailImages[indexPath.row]

            if let viewController = segue.destination as? SetDetailViewController {
                viewController.targetLabelValue = target
                viewController.targetContentValue = target2
                viewController.targetImageStr = target3
            }
        }
    }

    func createLayout() -> UICollectionViewLayout {
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(250))
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
        setPageControl()
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

        cell.setup()
        cell.pickWorkoutCycleLabel.text = target

        return cell
    }
}

extension SetWorkoutCycleViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        workcyclePageControl.currentPage = indexPath.row
    }
}

extension SetWorkoutCycleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        recommendWorkCycle.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecommendCell", for: indexPath) as! RecommendCellableViewCell

        let target = recommendWorkCycle[indexPath.row]
        let targetName = recommendWorkImage[indexPath.row]

        cell.recommendLabel.text = target
        cell.recommendWorkImage.image = UIImage(named: targetName)
        return cell
    }
}

extension SetWorkoutCycleViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "운동 루틴 추천"
    }
}

enum SegueID: String {
    case twoCycle   = "2분할"
    case threeCycle = "3분할"
    case fourCycle  = "4분할"
    case fiveCycle  = "5분할"
}


