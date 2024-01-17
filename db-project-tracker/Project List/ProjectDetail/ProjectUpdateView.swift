//
//  ProjectUpdateView.swift
//  db-project-tracker
//
//  Created by Wilson Chan on 1/16/24.
//

import SwiftUI

struct ProjectUpdateView: View {
    
    var update: ProjectUpdate
    var project = Project()
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.black)
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(DateHelper.projectUpdateDate(inputDate: update.date))
                    Spacer()
                    
                    //Display star if milestone, otherwise hours
                    if update.updateType == .milestone {
                        Image(systemName: "star.fill")
                            .tint(.yellow)
                    } else {
                        Text("\(String(Int(update.hours))) Hour")
                            .padding(.trailing)
                    }
                }
                .padding()
                .background {
                    Color( update.updateType == .milestone ? "Tiffany Teal" : "Orchid")
                }
                Text(update.headline)
                    .font(.smallHeadline)
                    .padding(.horizontal)
              
                Text(update.summary)
                    .font(.smallHeadline)
                    .padding()
             
            }
            .foregroundStyle(.white)
            .font(.regularText)
        }
        .clipShape(RoundedRectangle(cornerRadius: 15))
    }
}

