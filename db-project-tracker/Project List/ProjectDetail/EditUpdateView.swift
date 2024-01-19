//
//  AddUpdateView.swift
//  db-project-tracker
//
//  Created by Wilson Chan on 1/16/24.
//

import SwiftUI


struct EditUpdateView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    var project: Project
    var update: ProjectUpdate
    var isEditMode: Bool
    
    @State private var headline: String = ""
    @State private var summary: String = ""
    @State private var hours: String = "0"
    @State private var showConfirmation = false
    
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Text(isEditMode ? "Edit Update" : "New Update")
                    .font(.bigHeadline)
                    .foregroundStyle(.white)
                
                TextField("Headline", text: $headline)
                    .textFieldStyle(.roundedBorder)
                TextField("Summary", text: $summary, axis: .vertical)
                    .textFieldStyle(.roundedBorder)
                
                HStack {
                    TextField("Hours", text: $hours)
                        .keyboardType(.numberPad)
                        .frame(width: 60)
                        .onChange(of: hours) { oldValue, newValue in
                            hours = TextHelper.limitChars(input: hours, limit: 2)
                        }
                    Button(isEditMode ? "Save" : "Add") {
                        
                        let hoursDifference = Double(hours)! - update.hours
                        
                        update.headline = headline
                        update.summary = summary
                        update.hours = Double(hours)!
                        
                        if !isEditMode {
                            // Add Project Update
                        project.updates.insert(update, at: 0)
                            
                            //Force a SwiftData save since stathelper methods depend on most up to date updates/stats in order to display correct information. 
                            try? context.save()
                            
                            //Update Stats
                            StatHelper.updateAdded(project: project, update: update)
                        } else {
                            //Edit Project Update
                            StatHelper.updateEdited(project: project, hoursDifference: hoursDifference)
                        }
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    .disabled(shouldDisable())
                    
                    if isEditMode {
                        Button("Delete") {
                            //Show Confirmation dialog
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
        .confirmationDialog("Confirm delete?", isPresented: $showConfirmation) {
            Button("Yes, delete it") {
                //Remove all updates form the project with the same id
                project.updates.removeAll { u in
                    u.id == update.id
                }
                //Force a SwiftData save
                try? context.save()
                //Delete updates
                StatHelper.updateDeleted(project: project, update: update)
                dismiss()
            }
            }
        .onAppear {
            headline = update.headline
            summary = update.summary
            hours = String(Int(update.hours))
        }
    }
    private func shouldDisable() -> Bool {
        return headline.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
        summary.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ||
        hours.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
    }
    
}

//#Preview {
//    AddUpdateView()
//}
