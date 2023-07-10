//
//  TestViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/10.
//

import UIKit
import CoreData

class FinalWorkCycleViewController: BaseViewController {

    @IBOutlet var finalTableView: UITableView!
    @IBOutlet var tomorrowWorkLabel: UILabel!
    @IBOutlet var tomorrowWorkView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        tomorrowWorkView.dropShadow()
        WorkCycleManger.shared.fetchWorkCycle()
        LatestDayManger.shared.fetcthLatestDay()
        checkPermission()
    }
}

extension FinalWorkCycleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FinalWorkoutCycleTableViewCell", for: indexPath) as! FinalWorkoutCycleTableViewCell

        WorkCycleManger.shared.fetchWorkCycle()

        let getTomorrow = checkHowManyDayGone() + 1

        let target = WorkCycleManger.shared.workCycleList[checkHowManyDayGone()].name
        let tomorrowTarget = WorkCycleManger.shared.workCycleList[getTomorrow].name

        cell.finalWorkoutLabel.text = "\(target!)"

        let selectedTarget = WorkCycleManger.shared.workCycleList.count > 1 ? tomorrowTarget : target
        tomorrowWorkLabel.text = selectedTarget

        return cell
    }
}

