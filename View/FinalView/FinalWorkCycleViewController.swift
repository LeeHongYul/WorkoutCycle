//
//  TestViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/10.
//

import UIKit
import CoreData

class FinalWorkCycleViewController: UIViewController {

    let todayDate = Date()

    override func viewDidLoad() {
        super.viewDidLoad()
        CoreDataManger.shared.fetchWorkCycle()
        CoreDataManger.shared.fetcthLatestDay()
    }

    func CheckHowManyDayGone() -> Int {
        let daysCount = Int16(todayDate.day) - (CoreDataManger.shared.latestDayList.first!.latestDay)

        return Int(daysCount)
    }
}

extension FinalWorkCycleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FinalWorkoutCycleTableViewCell", for: indexPath) as! FinalWorkoutCycleTableViewCell

        let dayCount = CheckHowManyDayGone()
        CoreDataManger.shared.fetchWorkCycle()
        let getDay = dayCount % CoreDataManger.shared.workCycleList.count

        let target = CoreDataManger.shared.workCycleList[getDay].name


        cell.finalWorkoutLabel.text = "\(target!)"


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
