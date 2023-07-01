//
//  PickCollectionViewCell.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/12.
//

import UIKit

class PickCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var pickWorkoutCycleLabel: UILabel!
    @IBOutlet var randomWorkoutImageView: UIImageView!
    @IBOutlet var pickWorkoutView: UIView!

    var randomeNumber = Int.random(in: 1...7)

    func setup() {
        pickWorkoutView.setShadow(color: .black, opacity: 1, radius: 5, offset: CGSize(width: 1, height: 1))
        pickWorkoutView.layer.cornerRadius = 15
        randomWorkoutImageView.layer.cornerRadius = 15
        randomWorkoutImageView.image = UIImage(named: "workout\(randomeNumber)")
    }
}

