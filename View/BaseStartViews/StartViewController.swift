//
//  StartViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/11.
//

import UIKit

class StartViewController: BaseViewController {

    let target = LatestDayManger.shared.latestDayList.first

    @IBOutlet var startBtn: UIButton!
    @IBAction func startButton(_ sender: Any) {
        let todayDay = Date().day
        if LatestDayManger.shared.latestDayList.count == 0 {
            LatestDayManger.shared.addLatestDay(latestDay: todayDay, firstDay: todayDay)
        } else {
            if let target {
                LatestDayManger.shared.updateTodayDay(update: target, latestDay: todayDay)
            }
        }

        let segueIdentifier = WorkCycleManger.shared.workCycleList.count != 0 ? "YesWorkoutCycle" : "NoWorkoutCycle"
        performSegue(withIdentifier: segueIdentifier, sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        WorkCycleManger.shared.fetchWorkCycle()
    }
}
