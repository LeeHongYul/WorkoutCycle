//
//  GradientView.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/07/01.
//

import Foundation
import UIKit

@IBDesignable
class FAUGradientView: UIView {

    @IBInspectable var firstColor:UIColor = UIColor.clear
    @IBInspectable var secondColor:UIColor = UIColor.clear
    @IBInspectable var startPoint:CGPoint = CGPoint(x: 0.0, y: 1.0)
    @IBInspectable var endPoint:CGPoint = CGPoint(x: 1.0, y:0.0)

    var gradientLayer:CAGradientLayer!

    override func draw(_ rect: CGRect) {
        super.draw(rect)

        gradientLayer = CAGradientLayer()
        self.gradientLayer.cornerRadius = 15
        self.gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        self.gradientLayer.startPoint = self.startPoint
        self.gradientLayer.endPoint = self.endPoint
        self.gradientLayer.frame = self.bounds
        self.gradientLayer.opacity = 0.5
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}
