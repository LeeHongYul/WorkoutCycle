//
//  StartViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/11.
//

import UIKit

class StartViewController: BaseViewController {

    lazy var target = DayCheckManger.shared.dayCheckList.first

    @IBOutlet var startBtn: UIButton!
    @IBAction func startButton(_ sender: Any) {
        let now = Date()
        let today = calendar.startOfDay(for: now) //현재 시간의 시간을 12:00AM으로 설정

        DayCheckManger.shared.fetcthDays()

        if DayCheckManger.shared.dayCheckList.count == 0 {
            DayCheckManger.shared.addLatestDay(latestDay: today, firstDay: today)
        } else {
            if let target {
                DayCheckManger.shared.updateTodayDay(update: target, latestDay: today)
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
