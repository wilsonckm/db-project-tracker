//
//  EditFocusView.swift
//  db-project-tracker
//
//  Created by Wilson Chan on 1/17/24.
//

import SwiftUI

struct EditFocusView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    
    var project: Project
    @State var focus: String = ""
    
    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack(alignment: .leading) {
                Text("Edit Project Focus")
                    .font(.bigHeadline)
                    .foregroundStyle(.white)
                HStack {
                    TextField("Project name", text: $focus)
                        .textFieldStyle(.roundedBorder)
                    Button("Save focus") {
                        project.focus = focus
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
