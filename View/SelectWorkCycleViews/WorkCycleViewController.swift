//
//  WorkCycleViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/10.
//

import UIKit

class WorkCycleViewController: BaseViewController {
    
    var selectedSegue: String?

    @IBOutlet var workcycleTableView: UITableView!

    func saveToCoredata(target: String) {

        switch target {
        case SegueID.twoCycle.rawValue:
            for i in twoCycleList {
                WorkCycleManger.shared.addWorkCycle(name: i.workPart)
            }
        case SegueID.threeCycle.rawValue:
            for i in threeCycleList {
                WorkCycleManger.shared.addWorkCycle(name: i.workPart)
            }
        case SegueID.fourCycle.rawValue:
            for i in fourCycleList {
                WorkCycleManger.shared.addWorkCycle(name: i.workPart)
            }
        case SegueID.fiveCycle.rawValue:
            for i in fiveCycleList {
                WorkCycleManger.shared.addWorkCycle(name: i.workPart)
            }
        default:
            return
        }
    }

    @IBAction func saveCycleButton(_ sender: Any) {
        guard let selectedSegue else { return }

        showAlert(title: "분할법을 선택합니다", message: "\(selectedSegue)으로 하시겠습니다?") {
            self.saveToCoredata(target: self.selectedSegue ?? "없음")
            self.performSegue(withIdentifier: "FinalWorkout", sender: self)
        } cancelCallback: {
            return
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

extension WorkCycleViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        switch selectedSegue {
        case SegueID.twoCycle.rawValue:
            return twoCycleList.count
        case SegueID.threeCycle.rawValue:
            return threeCycleList.count
        case SegueID.fourCycle.rawValue:
            return fourCycleList.count
        case SegueID.fiveCycle.rawValue:
            return fiveCycleList.count
        default:
            return 0
        }
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "WorkCycleTableViewCell", for: indexPath) as! WorkCycleTableViewCell

        switch selectedSegue {
        case SegueID.twoCycle.rawValue:
            let target = twoCycleList[indexPath.row]
            cell.workoutLabel.text = target.workPart
            cell.workoutImage.image = UIImage(named: target.workImage)
        case SegueID.threeCycle.rawValue:
            let target = threeCycleList[indexPath.row]
            cell.workoutLabel.text = target.workPart
            cell.workoutImage.image = UIImage(named: target.workImage)
        case SegueID.fourCycle.rawValue:
            let target = fourCycleList[indexPath.row]
            cell.workoutLabel.text = target.workPart
            cell.workoutImage.image = UIImage(named: target.workImage)
        case SegueID.fiveCycle.rawValue:
            let target = fiveCycleList[indexPath.row]
            cell.workoutLabel.text = target.workPart
            cell.workoutImage.image = UIImage(named: target.workImage)
        default:
            return UITableViewCell()
        }
        return cell
    }
}
