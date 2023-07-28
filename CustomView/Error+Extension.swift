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

extension ValidationError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .tooShort:
            return NSLocalizedString("Need more Line", comment: "")
        case .tooLong:
            return NSLocalizedString("Need few Line", comment: "")
        case .cancel:
        return NSLocalizedString("Nothing Happen", comment: "")
        case .noAuthority:
            return NSLocalizedString("User Don't have Authority", comment: "")
        }
    }
}
