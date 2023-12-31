//
//  Error+Extension.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/07/28.
//

import Foundation

enum ValidationError: Error {
    case tooShort
    case tooLong
    case cancel
    case noAuthority
}

extension ValidationError {
    var errorDescription: String? {
        switch self {
        case .tooShort:
            return "Too Short"
        case .tooLong:
            return "Need few Line"
        case .cancel:
            return "Nothing Happen"
        case .noAuthority:
            return "User Don't have Authority"
        }
    }
}
