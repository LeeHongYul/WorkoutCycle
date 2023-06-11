//
//  TesttViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/11.
//

import UIKit

class TesttViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print(CoreDataManger.shared.workCycleList.count)
    }

    override func viewWillAppear(_ animated: Bool) {
        CoreDataManger.shared.fetchWorkCycle()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
