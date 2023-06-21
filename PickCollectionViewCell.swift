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

    var randomeNumber = Int.random(in: 1...10)

    func setup() {
        pickWorkoutView.setShadow(color: .darkGray, opacity: 1, radius: 20, offset: CGSize(width: 5, height: 5))
        pickWorkoutView.layer.cornerRadius = 15
        randomWorkoutImageView.layer.cornerRadius = 15
        randomWorkoutImageView.image = UIImage(named: "workout\(randomeNumber)")
    }
}

