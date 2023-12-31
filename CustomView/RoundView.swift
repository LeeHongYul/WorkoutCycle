//
//  RoundView.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/07/13.
//

import Foundation
import UIKit

@IBDesignable

class RoundedView: UIImageView {

    @IBInspectable
    var borderWidth: CGFloat {

        get {
            layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable
    var borderColor: UIColor? {

        get {
            guard let cgColor = layer.borderColor else {
                return nil
            }
            return UIColor(cgColor: cgColor)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }

    @IBInspectable
    var cornerRadius: CGFloat {

        get {
            layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }

    @IBInspectable
    override var backgroundColor: UIColor? {

        get {
            guard let cgColor = layer.backgroundColor else {
                return nil
            }
            return UIColor(cgColor: cgColor)
        }
        set {
            layer.backgroundColor = newValue?.cgColor
        }
    }
}
