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
        cellView.dropGrayShadow()
        cellView.backgroundColor = .systemGray6
        cellView.layer.cornerRadius = 15
    }

    override var isSelected: Bool {
        didSet {
            if isSelected {
                cellView.backgroundColor = .orange
                addWorkCycleLabel.textColor = .white
            } else {
                cellView.backgroundColor = .systemYellow
                addWorkCycleLabel.textColor = .black
            }
        }
    }
}
