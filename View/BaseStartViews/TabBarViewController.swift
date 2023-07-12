//
//  TabBarViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/20.
//

import UIKit

extension Notification.Name {
    static let doneUpdateDate = Notification.Name(rawValue: "doneUpdateDate")
}

class TabBarViewController: UITabBarController {

    let calendar = Calendar.current

    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
    }
}

extension TabBarViewController: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, didSelect viewController: UIViewController) {

        if let finalWorkCycleViewController = (viewController as? UINavigationController)?.topViewController as? FinalWorkCycleViewController {
            print("Entered FinalView")
            finalWorkCycleViewController.finalTableView.reloadData()
            WorkCycleManger.shared.fetchWorkCycle()
            
            let now = Date()
            let today = calendar.startOfDay(for: now)

            print("Tab Bar FinalView: Today Date: \(today)일")

            let target = DayCheckManger.shared.dayCheckList.first

            if let target {
                DayCheckManger.shared.updateTodayDay(update: target, latestDay: today)
                NotificationCenter.default.post(name: .doneUpdateDate, object: nil)
            }

        } else {
            print("Just Tab Bar Clicked")
        }
    }
}
