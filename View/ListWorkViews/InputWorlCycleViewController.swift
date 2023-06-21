//
//  InputWorlCycleViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/20.
//

import UIKit

class InputWorlCycleViewController: BaseViewController {

    @IBOutlet var addTextField: UITextField!

    @IBAction func saveButton(_ sender: Any) {
        guard let newWorkCycle = addTextField.text else { return }
        if newWorkCycle.count != 0 {
            WorkCycleManger.shared.addWorkCycle(name: newWorkCycle)
            showAlert(title: "새로운 분할을 저장합니다", message: "\(newWorkCycle)을 저장합니다") {
                self.dismiss(animated: true)
            } cancelCallback: {
                return
            }
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()


    }
}