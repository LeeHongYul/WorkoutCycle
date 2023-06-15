//
//  StartViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/11.
//

import UIKit

class StartViewController: UIViewController {

    let todayDay = Date().day

    let target = CoreDataManger.shared.latestDayList.first

    @IBOutlet var startBtn: UIButton!
    @IBAction func startButton(_ sender: Any) {
        if CoreDataManger.shared.latestDayList.count == 0 {
            CoreDataManger.shared.addLatestDay(latestDay: todayDay)
        } else {
            if let target {
                CoreDataManger.shared.updateTodayDay(update: target, latestDay: todayDay)
            }

        }

        
        if CoreDataManger.shared.workCycleList.count != 0 {
            performSegue(withIdentifier: "yesWorloutCycle", sender: self)
        } else {
            performSegue(withIdentifier: "noWorkoutCycle", sender: self)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        CoreDataManger.shared.fetchWorkCycle()
        
        let Btn = CustomButton(color: .red, title: "시작합니다", systemImageName: "plus")
    }
}
