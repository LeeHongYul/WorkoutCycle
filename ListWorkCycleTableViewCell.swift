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
    @IBOutlet var listWorkCycleImageView: UIImageView!

    @IBOutlet var listWorkCycleContentView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        listWorkCycleContentView.layer.borderWidth = 3
        listWorkCycleContentView.layer.borderColor = UIColor.systemYellow.cgColor
        listWorkCycleContentView.layer.cornerRadius = 30

        var randomeNumber = Int.random(in: 1...6)

        listWorkCycleImageView.image = UIImage(named: "cycle\(randomeNumber)")


    }


    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
