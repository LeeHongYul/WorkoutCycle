//
//  AddWorkCycleViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/14.
//

import UIKit

class AddWorkCycleViewController: BaseViewController {
    
    @IBOutlet var addWorkCycleCollectionView: UICollectionView!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "inputWorkcycle" {
            if (segue.destination.sheetPresentationController?.detents = [.medium()]) != nil {
                _ = segue.destination as? InputWorkCycleViewController
            }
        }
    }
    
    func creatLayout() -> UICollectionViewLayout {
        
        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .fractionalHeight(1))

        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 0, bottom: 10, trailing: 0)

        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100))

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
        
        cell.setup()
        cell.addWorkCycleLabel.text = target
        
        return cell
    }
}

extension AddWorkCycleViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

        let target = addWorkCycleList[indexPath.row]
        if !target.isEmpty {

            showAlert(title: "새로운 분할을 저장합니다", message: "\(target)을 저장합니다") {
                WorkCycleManger.shared.addWorkCycle(name: target)
                WorkCycleManger.shared.saveContext()
                
                self.navigationController?.popViewController(animated: true)
            } cancelCallback: {
                self.addWorkCycleCollectionView.reloadData()
                return
            }
        }
    }
}
