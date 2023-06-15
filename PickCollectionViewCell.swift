//
//  PickCollectionViewCell.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/12.
//

import UIKit

class PickCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet var pickWorkoutCycleLabel: UILabel!

    @IBOutlet var pickWorkoutView: UIView!

    func setup() {
        pickWorkoutView.setShadow(color: .gray, opacity: 0.8, radius: 10, offset: CGSize(width: 5, height: 5))
    }
}

