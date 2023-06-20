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

        return cell
    }
}

extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let latestDaytarget = LatestDayManger.shared.latestDayList
        let workCycleTarget = WorkCycleManger.shared.workCycleList
        let checkMarkTarget = CheckMarkManger.shared.checkMarkList

        LatestDayManger.shared.deleteDayDate()
        LatestDayManger.shared.fetcthLatestDay()

        CheckMarkManger.shared.deleteCheckMark()
        WorkCycleManger.shared.deleteAllWorkData()

        let vc = StartViewController()
        present(vc, animated: true)
    }
}
