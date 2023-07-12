//
//  InputWorlCycleViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/20.
//

import UIKit
import TagListView

class InputWorlCycleViewController: BaseViewController {

    @IBOutlet var TagListView: TagListView!
    @IBOutlet var addTextField: UITextField!

    @IBAction func saveButton(_ sender: Any) {
        guard let newWorkCycle = addTextField.text else { return }

        if !newWorkCycle.isEmpty && newWorkCycle.count <= 15 {
            showAlert(title: "새로운 분할을 저장합니다", message: "\(newWorkCycle)을 저장합니다") {
                self.TagListView.addTag(newWorkCycle)
                TagManger.shared.addTag(name: newWorkCycle)
                WorkCycleManger.shared.addWorkCycle(name: newWorkCycle)
//                self.dismiss(animated: true)
            } cancelCallback: {
                return
            }
        } else if newWorkCycle.count > 15 {
            showOneAlert(title: "15자 이하로 작성해주세요") {
                print("cancel")
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        TagListView.delegate = self
        initTagListView()

    }

//    override func viewWillAppear(_ animated: Bool) {
//        initTagListView()
//    }

    func initTagListView() {
        TagManger.shared.fetchTag()
        let target = TagManger.shared.tagList
        for i in target {
            print(i.name!)
            TagListView.addTag(i.name!)
        }
    }
}

extension InputWorlCycleViewController: TagListViewDelegate {
    func tagPressed(_ title: String, tagView: TagView, sender: TagListView) {
        print("Tag Pressed")
        tagView.isSelected.toggle()
    }

    func tagRemoveButtonPressed(_ title: String, tagView: TagView, sender: TagListView) {
        print("Tag Removed")
        sender.removeTagView(tagView)
        TagManger.shared.deleteTage(tag: title)
    }
}
