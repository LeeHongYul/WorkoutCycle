//
//  FinalWorkoutCycleTableViewCell.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/11.
//

import UIKit

class FinalWorkoutCycleTableViewCell: UITableViewCell {

    @IBOutlet var finalWorkoutLabel: UILabel!
    @IBOutlet var finalView: RoundedView!

    override func awakeFromNib() {
        super.awakeFromNib()
        finalView.dropShadow(scale: true)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
