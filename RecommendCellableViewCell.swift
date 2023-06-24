//
//  RecommendCellableViewCell.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/24.
//

import UIKit

class RecommendCellableViewCell: UITableViewCell {

    @IBOutlet var recommendLabel: UILabel!
    
    @IBOutlet var recommendWorkImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
