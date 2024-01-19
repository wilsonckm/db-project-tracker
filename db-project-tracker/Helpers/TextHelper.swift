//
//  TextHelper.swift
//  db-project-tracker
//
//  Created by Wilson Chan on 1/18/24.
//

import Foundation

struct TextHelper {
    
    static func converStat(input: Double) -> String {
        //Converts a double over 1000 into a string of (the amount)k
        switch(input) {
        case let stat where input > 1000:
            //Divide by 1000, replace with "k"
            let dividedStat = stat/1000
            
            return "\(round(dividedStat * 10)/10)k"
        default:
            return String(Int(input))
        }
    }
    
    static func limitChars(input: String, limit: Int) -> String {
        //If the inpit is the above the limit, take the first
        if input.count > limit {
            return String(input.prefix(limit))
        }
        return input
    }
}
