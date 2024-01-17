//
//  ProjectUpdateView.swift
//  db-project-tracker
//
//  Created by Wilson Chan on 1/16/24.
//

import SwiftUI

struct ProjectUpdateView: View {
    var project = Project()
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Date")
                    Spacer()
                    Text("Hour")
                        .padding(.trailing)
                }
                .padding()
                .background {
                    Color(.orchid)
                }
                Text(project.name)
                    .font(.smallHeadline)
                    .padding(.horizontal)
              
                Text("Update Summary")
                    .font(.smallHeadline)
                    .padding()
             
            }
            .foregroundStyle(.white)
            .font(.regularText)
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

#Preview {
    ProjectUpdateView()
}
