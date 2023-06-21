//
//  SettingViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/13.
//

import UIKit

class SettingViewController: UIViewController {

    @IBAction func resetButton(_ sender: Any) {
        LatestDayManger.shared.deleteDayDate()
        CheckMarkManger.shared.deleteCheckMark()
        WorkCycleManger.shared.deleteAllWorkData()

        let vc = StartViewController()
        present(vc, animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()


    }

    func getVersion() -> String {
        let dictonary = Bundle.main.infoDictionary!
        let version = dictonary["CFBundleVersion"] as! String

        return "\(version)"
    }
}

extension SettingViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return mainSettinglist.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mainSettinglist[section].items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SettingTableViewCell", for: indexPath) as! SettingTableViewCell

        var content = cell.defaultContentConfiguration()
        let target = mainSettinglist[indexPath.section].items[indexPath.row]

        switch indexPath.section {
        case 0:
            content.text = "\(target)"
            content.secondaryText = "최신버전: \(getVersion())"
        case 1:
            content.text = "\(target)"
        case 2:
            content.text = "\(target)"
        case 3:
            content.text = "\(target)"
        default:
           break
        }
        cell.contentConfiguration = content
        return cell
    }
}

extension SettingViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "기본 설정"
        case 1:
            return "알림 설정"
        case 2:
            return "기타 설정"
        case 3:
            return "개발자 설정"
        default:
            return nil
        }
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let target = mainSettinglist[indexPath.section].items[indexPath.row]

        switch indexPath.section {
        case 0:
            print("")
        case 1:
               print("운동 설정입니다")
        case 2:
            if target == "공지사항" {
                performSegue(withIdentifier: "announcementSegue", sender: self)
            } else {
                performSegue(withIdentifier: "termofUseSegue", sender: self)
            }
        case 3:
            performSegue(withIdentifier: "developerSegue", sender: self)
        default:
           break
        }
    }
}
