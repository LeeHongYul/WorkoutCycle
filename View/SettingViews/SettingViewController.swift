//
//  SettingViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/13.
//

import UIKit

class SettingViewController: BaseViewController {

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "StartSegue" {
            showAlert(title: "초기화하면 이전 데이터가 모두 삭제됩니다", message: "계속하시겠습니까?") {
                DayCheckManger.shared.deleteDayDate()
                CheckMarkManger.shared.deleteCheckMark()
                WorkCycleManger.shared.deleteAllWorkData()
                TagManger.shared.deleteAllTage()

                if let vc = segue.destination.storyboard?.instantiateViewController(identifier: "StartViewController") {
                    vc.modalTransitionStyle = .coverVertical
                    vc.modalPresentationStyle = .fullScreen

                    self.present(vc, animated: true)
                }
            } cancelCallback: {
                ValidationError.cancel
            }
        }
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
            content.secondaryText = "\(getVersion())"
        case 1:
            content.text = "\(target)"
        case 2:
            content.text = "\(target)"
        case 3:
            content.text = "\(target)"
        case 4:
            content.text = "\(target)"
            content.textProperties.color = .systemRed
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
            guard let url = URL(string: "itms-apps://itunes.apple.com/app/") else { return }

            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url)
            }
        case 1:
            performSegue(withIdentifier: "AlramSegue", sender: self)
        case 2:
            if target == "공지사항" {
                performSegue(withIdentifier: "AnnouncementSegue", sender: self)
            } else {
                performSegue(withIdentifier: "TermofUseSegue", sender: self)
            }
        case 3:
            performSegue(withIdentifier: "DeveloperSegue", sender: self)
        case 4:
            performSegue(withIdentifier: "StartSegue", sender: self)
        default:
            break
        }
    }
}
