//
//  AddProjectView.swift
//  db-project-tracker
//
//  Created by Wilson Chan on 1/15/24.
//

import SwiftUI
import SwiftData

struct EditProjectView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    var project: Project
    var isEditMode: Bool
    @State private var projectName: String = ""
    @State private var showConfirmation: Bool = false
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Text(isEditMode ? "Edit Project" : "New Project")
                    .font(.bigHeadline)
                    .foregroundStyle(.white)
                HStack {
                    TextField("Project name", text: $projectName)
                        .textFieldStyle(.roundedBorder)
                    Button(isEditMode ? "Save" : "Add") {
                        
                        if isEditMode {
                            //Save the new project name
                            project.name = projectName
                        } else {
                            
                            
                            project.name = projectName
                            context.insert(project)
                            
                        }
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    .disabled(projectName.trimmingCharacters(in: .whitespacesAndNewlines) == "" )
                    
                    if isEditMode {
                        //Show Delete Button
                        Button("Delete") {
                            //Show confirmation dialog if user actually wants to delete
                            showConfirmation = true
                            
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.red)
                    }
                    
                }
                Spacer()
            }
            .padding(.top)
            .padding(.horizontal)
        }
        .confirmationDialog("Really delete?", isPresented: $showConfirmation, titleVisibility: .visible) { Button("Yes, delete it") {
            context.delete(project)
            dismiss()
        }
        }
        .onAppear {
            projectName = project.name
        }
    }
}

//#Preview {
//    AddProjectView()
//}
