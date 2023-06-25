//
//  SetDetailViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/25.
//

import UIKit

class SetDetailViewController: UIViewController {


    var targetLabelValue: String?
    var targetContentValue: String?

    @IBOutlet var detailRecommendLabel: UILabel!
    @IBOutlet var contextLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        if let targetLabelValue, let targetContentValue {
            detailRecommendLabel.text = targetLabelValue
            contextLabel.text = targetContentValue
        }
    }
}
