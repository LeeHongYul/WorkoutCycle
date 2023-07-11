//
//  TabBarViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/20.
//

import UIKit

class TabBarViewController: UITabBarController {

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
            
            let todayDay = Date().day
            print("Tab Bar FinalView: Today Date: \(todayDay)일")

            let target = LatestDayManger.shared.latestDayList.first

            if let target {
                LatestDayManger.shared.updateTodayDay(update: target, latestDay: todayDay)
            }
        } else {
            print("Just Tab Bar Clicked")
        }
    }
}
