//
//  AddWorkCycleViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/14.
//

import UIKit

class AddWorkCycleViewController: BaseViewController {

    @IBOutlet var addWorkCycleCollectionView: UICollectionView!

//    @IBAction func nextPage(_ sender: Any) {
//        guard let nextVC = self.storyboard?.instantiateViewController(withIdentifier: "second") else { return }
//
//        self.present(nextVC, animated: true)
//    }

    func creatLayout() -> UICollectionViewLayout {

        let itemSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1/3), heightDimension: .absolute(100))
        let item = NSCollectionLayoutItem(layoutSize: itemSize)
        item.contentInsets = NSDirectionalEdgeInsets(top: 10, leading: 10, bottom: 10, trailing: 0)
        let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1))

        let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])

        let section = NSCollectionLayoutSection(group: group)
        let layout = UICollectionViewCompositionalLayout(section: section)
        return layout
    }

    @IBOutlet var addTextField: UITextField!

    @IBAction func saveButton(_ sender: Any) {
        guard let newWorkCycle = addTextField.text else { return }
        if newWorkCycle.count != 0 {
            CoreDataManger.shared.addWorkCycle(name: newWorkCycle)
            showAlert(titile: "새로운 분할을 저장합니다", message: "\(newWorkCycle)을 저장합니다") {
                self.navigationController?.popViewController(animated: true)
            } cancelCallback: {
                return
            }
        }
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

extension AddWorkCycleViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let target = addWorkCycleList[indexPath.row]
        if !target.isEmpty {
            CoreDataManger.shared.addWorkCycle(name: target)
            CoreDataManger.shared.saveContext()
            showAlert(titile: "새로운 분할을 저장합니다", message: "\(target)을 저장합니다") {
//                self.performSegue(withIdentifier: "addWorkCycle", sender: self)
                self.navigationController?.popViewController(animated: true)
            } cancelCallback: {
                return
            }
        }
        print("셀이 클릭됨")
    }
}
