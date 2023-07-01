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
            
            finalWorkCycleViewController.finalTableView.reloadData()
            WorkCycleManger.shared.fetchWorkCycle()

            print("Entered FinalView")
        } else {
            print("Tabbar Clicked")
        }
    }
}
