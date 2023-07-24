//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Tanya on 07.01.2023.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        dateFormatter.locale = Locale(identifier: "en_us")
        return dateFormatter.string(from: self)
    }
}
