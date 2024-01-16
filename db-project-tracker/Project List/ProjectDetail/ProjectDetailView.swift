//
//  ProjectDetailView.swift
//  db-project-tracker
//
//  Created by Wilson Chan on 1/16/24.
//

import SwiftUI

struct ProjectDetailView: View {
    
    var project: Project
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Text(project.name)
            .navigationBarBackButtonHidden(true)
        VStack {
            Button("Back"){
                dismiss()
            }
        }
    }
}

#Preview {
    ProjectDetailView(project: Project())
}
