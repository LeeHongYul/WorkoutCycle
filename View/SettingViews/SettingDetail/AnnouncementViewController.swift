//
//  AnnouncementViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/21.
//

import UIKit

class AnnouncementViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "공지사항"

    }
}

extension AnnouncementViewController: UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        announcementList.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AnnouncementViewController", for: indexPath)

        let target = announcementList[indexPath.row]

        cell.textLabel?.text  = target

        return cell
    }
}
