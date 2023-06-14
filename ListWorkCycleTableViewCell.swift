//
//  ListWorkCycleTableViewCell.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/14.
//

import UIKit

class ListWorkCycleTableViewCell: UITableViewCell {


    @IBOutlet var listWorkCycleView: UIView!
    @IBOutlet var listWorkCycleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        listWorkCycleView.setCornerRadius(radius: 15)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
