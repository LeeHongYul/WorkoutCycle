//
//  UIView+Extension.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/07/13.
//

import UIKit

extension UIView {

    func setGradient(color1: UIColor, color2: UIColor, color3: UIColor) {
        let gradient: CAGradientLayer = CAGradientLayer()
        gradient.colors = [color1.cgColor, color2.cgColor, color3.cgColor]
        gradient.locations = [0.0, 0.8]
        gradient.startPoint = CGPoint(x: 5.0, y: 0.0)
        gradient.endPoint = CGPoint(x: 5.0, y: 1.0)
        gradient.frame = bounds
        gradient.type = .axial

        layer.addSublayer(gradient)
    }

    func setShadow(color: UIColor, opacity: Float, radius: CGFloat, offset: CGSize, path: CGPath? = nil) {
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
        self.layer.shadowOffset = offset
        self.layer.shadowPath = path
    }

    func setCornerRadius(radius: CGFloat) {
        self.layer.cornerRadius = radius
    }

    func setGradient(firstColor: UIColor, secondColor: UIColor, thridColor: UIColor) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor, thridColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 5.0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 5.0, y: 1)
        gradientLayer.frame = self.bounds
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
