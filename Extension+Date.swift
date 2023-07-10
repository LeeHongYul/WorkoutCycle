//
//  Extension+Date.swift
//  WorkoutCycle
//
//  Created by 이홍렬 on 2023/06/15.
//

import Foundation

extension Date {
    
    func dateToString() -> String {
        let dateString = DateFormatter()
        dateString.dateFormat = "MMM d, yyyy"
        dateString.locale = Locale(identifier: "en_US_POSIX")
        
        return dateString.string(from: self)
    }
    
    func dateToStringYYYYmmdd() -> String {
        let dateString = DateFormatter()
        dateString.dateFormat = "yyyy-mm-dd"
        dateString.locale = Locale(identifier: "en_US_POSIX")
        
        return dateString.string(from: self)
    }
    
    func dateToStringYYYY() -> String {
        let dateString = DateFormatter()
        dateString.dateFormat = "yyyy"
        dateString.locale = Locale(identifier: "en_US_POSIX")
        
        return dateString.string(from: self)
    }
    
    func dateToString(format : String) -> String {
        let dateString = DateFormatter()
        dateString.dateFormat = format
        dateString.locale = Locale(identifier: "en_US_POSIX")
        
        return dateString.string(from: self)
    }

    var year: Int {
        let cal = Calendar.current
        return cal.component(.year, from: self)
    }
    var month: Int {
        let cal = Calendar.current
        return cal.component(.month, from: self)
    }
    var day: Int {
        let cal = Calendar.current
        return cal.component(.day, from: self)
    }
    var hour: Int {
        let cal = Calendar.current
        return cal.component(.hour, from: self)
    }
    var minute: Int {
        let cal = Calendar.current
        return cal.component(.minute, from: self)
    }
}
