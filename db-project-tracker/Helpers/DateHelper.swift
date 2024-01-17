//
//  DateHelper.swift
//  db-project-tracker
//
//  Created by Wilson Chan on 1/17/24.
//

import Foundation

struct DateHelper {
    static func projectUpdateDate(inputDate: Date) -> String {
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        return df.string(from: inputDate)
    }
}
