//
//  db_project_trackerApp.swift
//  db-project-tracker
//
//  Created by Wilson Chan on 1/3/24.
//

import SwiftUI
import SwiftData

@main
struct DBProjectTracker: App {
    var body: some Scene {
        WindowGroup {
            ProjectListView()
                .modelContainer(for: [Project.self, ProjectUpdate.self])
        }
    }
}
