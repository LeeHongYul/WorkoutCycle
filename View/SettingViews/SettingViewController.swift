//
//  SettingViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/13.
//

import UIKit

class SettingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()


    }
}

extension SettingViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell


        cell.textLabel?.text = "분할 초기화"

        return cell
    }
}

extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let target1 = CoreDataManger.shared.latestDayList
        let target2 = CoreDataManger.shared.workCycleList

        CoreDataManger.shared.deleteDayDate()
        CoreDataManger.shared.fetcthLatestDay()

        for i in target2 {

            CoreDataManger.shared.deleteWorkData()
            CoreDataManger.shared.fetchWorkCycle()
            print("deleteWork\(i)")
        }

        let vc = StartViewController()
        present(vc, animated: true)
    }
}
