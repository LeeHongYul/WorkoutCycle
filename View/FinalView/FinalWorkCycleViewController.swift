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

        let target = WorkCycleManger.shared.workCycleList[checkHowManyDayGone()].name
        cell.finalWorkoutLabel.text = "\(target!)"


        let getTomorrow = checkHowManyDayGone() + 1
        if WorkCycleManger.shared.workCycleList.count > 1 {
            let tomorrowTarget = WorkCycleManger.shared.workCycleList[getTomorrow].name

            tomorrowWorkLabel.text = tomorrowTarget
        } else {
            tomorrowWorkLabel.text = target
        }
        return cell
    }
}





extension Date {
    // Date에서 Component에 해당되는 값 가져오기
    var year: Int {
        let cal = Calendar.current
        return cal.component(.year, from: self)
    }
    var month: Int {
        let cal = Calendar.current
        return cal.component(.month, from: self)
    }
    var day: Int {
        let cal = Calendar.current
        return cal.component(.day, from: self)
    }
    var hour: Int {
        let cal = Calendar.current
        return cal.component(.hour, from: self)
    }
    var minute: Int {
        let cal = Calendar.current
        return cal.component(.minute, from: self)
    }
}
