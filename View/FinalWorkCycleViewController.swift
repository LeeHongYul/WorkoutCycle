//
//  TestViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/10.
//

import UIKit
import CoreData

class FinalWorkCycleViewController: UIViewController {

    @IBOutlet var todayWorkoutLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        CoreDataManger.shared.fetchWorkCycle()
        let a = CoreDataManger.shared.workCycleList.count
        print(a)
    }
}
