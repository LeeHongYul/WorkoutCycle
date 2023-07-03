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
            if newWorkCycle.count > 15 {
                showOneAlert(title: "15자 이하로 작성해주세요") {
                    print("cancel")
                }
            } else {
                showAlert(title: "새로운 분할을 저장합니다", message: "\(newWorkCycle)을 저장합니다") {
                    WorkCycleManger.shared.addWorkCycle(name: newWorkCycle)
                    self.dismiss(animated: true)
                } cancelCallback: {
                    return
                }
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
