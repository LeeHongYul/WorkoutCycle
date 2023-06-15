//
//  AddWorkCycleCollectionViewCell.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/14.
//

import UIKit

class AddWorkCycleCollectionViewCell: UICollectionViewCell {

    @IBOutlet var addWorkCycleLabel: UILabel!

    @IBOutlet var cellView: UIView!

    func setup() {
        cellView.backgroundColor = .orange
        cellView.layer.cornerRadius = 15
    }

    override var isSelected: Bool {
        didSet {
            if isSelected {
                cellView.backgroundColor = .blue
                addWorkCycleLabel.textColor = .white
            } else {
                cellView.backgroundColor = .orange
                addWorkCycleLabel.textColor = .black
            }
        }
    }
//    init(addWorkCycleView: UIView!, addWorkCycleLabel: UILabel!) {
//        super.init(frame: CGRect(origin: CGPoint.zero, size: addWorkCycleView.frame.size))
//        self.addWorkCycleView = addWorkCycleView
//        self.addWorkCycleLabel = addWorkCycleLabel
//
//        self.addWorkCycleView.setCornerRadius(radius: 15)
//        self.addWorkCycleView.layer.backgroundColor = UIColor.yellow.cgColor
//    }
//
//    required init?(coder: NSCoder) {
//
//        fatalError("init(coder:) has not been implemented")
//    }
}
