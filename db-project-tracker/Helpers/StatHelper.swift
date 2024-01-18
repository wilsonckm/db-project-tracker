//
//  StatHelper.swift
//  db-project-tracker
//
//  Created by Wilson Chan on 1/18/24.
//

import Foundation
import SwiftUI

struct StatHelper {
    
    // method should be run after the new update has been added to the project's updates array
    static func updateAdded(project: Project, update: ProjectUpdate) {
        //Change hours
        project.hours += update.hours
        
        //Change wins
        if update.updateType == .milestone {
            project.wins += 1
        }
        
        //Change sessions
        let sortedUpdates = project.updates.sorted { u1, u2 in
            u1.date > u2.date
        }
        if sortedUpdates.count >= 2 {
            let date1 = sortedUpdates[0].date
            let date2 = sortedUpdates[1].date
            
            if !Calendar.current.isDate(date1, inSameDayAs: date2) {
                //If not the same day, then latest update is first of today
                project.sessions += 1
            } 
        } else {
            project.sessions += 1
        }
    }
    
    // Run this After update has been removed from project.updates array
    static func updateDeleted(project: Project, update: ProjectUpdate) {
        //Subtract hours
        project.hours -= update.hours
        if update.updateType == .milestone {
            project.wins -= 1
        }
        //change sessions
        let sameDayUpdates = project.updates.filter { u in
            Calendar.current.isDate(u.date, inSameDayAs: update.date)
        }
        if sameDayUpdates.count == 0 {
            //Delete update
            project.sessions -= 1
        }
    }
    
    static func updateEdited(project: Project, hoursDifference: Double) {
        //Change hours
        project.hours += hoursDifference
    }
    
}
