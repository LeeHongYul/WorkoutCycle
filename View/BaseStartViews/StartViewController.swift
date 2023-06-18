//
//  StartViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/11.
//

import UIKit

class StartViewController: UIViewController {

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

        
        if WorkCycleManger.shared.workCycleList.count != 0 {
            performSegue(withIdentifier: "yesWorloutCycle", sender: self)
        } else {
            performSegue(withIdentifier: "noWorkoutCycle", sender: self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        WorkCycleManger.shared.fetchWorkCycle()
        
        let Btn = CustomButton(color: .red, title: "시작합니다", systemImageName: "plus")
    }
}
