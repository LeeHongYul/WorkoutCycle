//
//  ViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/10.
//

import UIKit

class ViewController: UIViewController {



    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let segueID = segue.identifier


        switch segueID {
        case SegueID.twoCycle.rawValue:
            if let vc = segue.destination as? WorkCycleViewController {
                vc.selectedSegue = "twoCycle"
            }
        case SegueID.threeCycle.rawValue:
            if let vc = segue.destination as? WorkCycleViewController {
                vc.selectedSegue = "threeCycle"
            }
        case SegueID.fourCycle.rawValue:
            if let vc = segue.destination as? WorkCycleViewController {
                vc.selectedSegue = "fourCycle"
            }
        case SegueID.fiveCycle.rawValue:
            if let vc = segue.destination as? WorkCycleViewController {
                vc.selectedSegue = "fiveCycle"
            }
        default:
            break
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()


    }
}

enum SegueID: String {
    case twoCycle = "twoCycle"
    case threeCycle = "threeCycle"
    case fourCycle = "fourCycle"
    case fiveCycle = "fiveCycle"
}
