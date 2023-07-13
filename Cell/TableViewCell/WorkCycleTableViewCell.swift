//
//  WorkCycleTableViewCell.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/10.
//

import UIKit

class WorkCycleTableViewCell: UITableViewCell {

    @IBOutlet var workoutLabel: UILabel!
    @IBOutlet var workoutImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
