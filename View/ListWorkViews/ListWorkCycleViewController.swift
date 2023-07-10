//
//  TesttViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/11.
//

import UIKit

class ListWorkCycleViewController: BaseViewController {

    @IBOutlet var listTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        WorkCycleManger.shared.fetchWorkCycle()
        listTableView.reloadData()
    }
}

extension ListWorkCycleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        WorkCycleManger.shared.workCycleList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListWorkCycleTableViewCell", for: indexPath) as! ListWorkCycleTableViewCell
        let target = WorkCycleManger.shared.workCycleList[indexPath.row].name

        cell.listWorkCycleLabel.text = target

        return cell
    }
}

extension ListWorkCycleViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        true
    }

    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

        if editingStyle == .delete {
            let target = WorkCycleManger.shared.workCycleList[indexPath.row]
            WorkCycleManger.shared.deleteOneWorkData(workCycle: target)

            WorkCycleManger.shared.fetchWorkCycle()
            listTableView.reloadData()
        }
    }
}
