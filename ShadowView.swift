//
//  ShadowView.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/11.
//

import UIKit

extension UIView {
    func dropShadow(scale: Bool = true) {
            layer.masksToBounds = false
            layer.shadowColor = UIColor.black.cgColor
            layer.shadowOpacity = 0.2
            layer.shadowOffset = .zero
            layer.shadowRadius = 10
            layer.shouldRasterize = true
            layer.rasterizationScale = scale ? UIScreen.main.scale : 1
        }
}
