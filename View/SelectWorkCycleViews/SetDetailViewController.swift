//
//  SetDetailViewController.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/25.
//

import UIKit

class SetDetailViewController: UIViewController {

    var targetLabelValue: String? = "디테일 운동 제목입니다."
    var targetContentValue: String? = "디테일 운동 내용입니다."
    var targetImageStr: String?

    @IBOutlet var detailImage: UIImageView!
    @IBOutlet var detailRecommendLabel: UILabel!
    @IBOutlet var contextLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()

        detailRecommendLabel.text = targetLabelValue
        contextLabel.text         = targetContentValue
        detailImage.image         = UIImage(named: targetImageStr ?? "diet")
    }
}
