//
//  Project.swift
//  db-project-tracker
//
//  Created by Wilson Chan on 1/3/24.
//

import Foundation
import SwiftData

@Model
class Project: Identifiable {
    @Attribute(.unique) var id: String
    var name = ""
    var startDate = Date()
    var focus = ""
    
    @Relationship(deleteRule: .cascade, inverse: \ProjectUpdate.project)
    var updates: [ProjectUpdate] = [ProjectUpdate]()
    
    
    init () {
        id = UUID().uuidString
    }
}

