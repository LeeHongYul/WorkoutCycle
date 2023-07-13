//
//  CustomButton.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/07/13.
//

import UIKit

class CustomButton: UIButton {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init coder has not been implemented")
    }

    convenience init(color: UIColor, title: String, systemImageName: String) {
        self.init(frame: .zero)
        setColor(color: color, title: title, systemImage: systemImageName)
    }

    func configure() {
        configuration = .tinted()
        configuration?.cornerStyle = .medium
        translatesAutoresizingMaskIntoConstraints = false
    }

    final func setColor(color: UIColor, title: String, systemImage: String) {
        configuration?.baseBackgroundColor = color
        configuration?.baseForegroundColor = color
        configuration?.title = title

        configuration?.image = UIImage(systemName: systemImage)
        configuration?.imagePadding = 6
        configuration?.imagePlacement = .leading
    }
}

