//
//  TesttViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/11.
//

import UIKit

class ListWorkCycleViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }

}

extension ListWorkCycleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        CoreDataManger.shared.workCycleList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListWorkCycleTableViewCell", for: indexPath) as! ListWorkCycleTableViewCell
        let target = CoreDataManger.shared.workCycleList[indexPath.row].name


        cell.listWorkCycleLabel.text = target



        return cell
    }


}

extension ListWorkCycleViewController: UITableViewDelegate {

}
