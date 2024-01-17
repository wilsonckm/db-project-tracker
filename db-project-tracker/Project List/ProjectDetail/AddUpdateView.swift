//
//  AddUpdateView.swift
//  db-project-tracker
//
//  Created by Wilson Chan on 1/16/24.
//

import SwiftUI


struct AddUpdateView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    var project: Project
    var update: ProjectUpdate
    @State var headline: String = ""
    @State var summary: String = ""
    @State var hours: String = ""
    
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("New Update")
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
                    Button("Save") {
                        update.headline = headline
                        update.summary = summary
                        update.hours = Double(hours)!
                        project.updates.insert(update, at: 0)
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(.blue)
                    
                }
               
                
                Spacer()
            }
            .padding(.top)
            .padding(.horizontal)
        }
    }
}

//#Preview {
//    AddUpdateView()
//}
