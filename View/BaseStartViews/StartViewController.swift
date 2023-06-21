//
//  StartViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/11.
//

import UIKit

class StartViewController: BaseViewController {

    let todayDay = Date().day

    let target = LatestDayManger.shared.latestDayList.first

    @IBOutlet var startBtn: UIButton!
    @IBAction func startButton(_ sender: Any) {
        if LatestDayManger.shared.latestDayList.count == 0 {
            LatestDayManger.shared.addLatestDay(latestDay: todayDay)
        } else {
            if let target {
                LatestDayManger.shared.updateTodayDay(update: target, latestDay: todayDay)
            }
        }

        let segueIdentifier = WorkCycleManger.shared.workCycleList.count != 0 ? "yesWorkoutCycle" : "noWorkoutCycle"
        performSegue(withIdentifier: segueIdentifier, sender: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        WorkCycleManger.shared.fetchWorkCycle()
    }
}
