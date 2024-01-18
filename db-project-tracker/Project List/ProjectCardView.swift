//
//  ProjectCard.swift
//  db-project-tracker
//
//  Created by Wilson Chan on 1/15/24.
//

import SwiftUI

struct ProjectCardView: View {
    
    var project: Project
    
    var body: some View {
        ZStack (alignment: .leading) {
            RoundedRectangle(cornerRadius: 15)
                .opacity(0.7)
                .shadow(radius: 5, x: 0, y: 4)
            VStack (alignment: .leading, spacing: 10) {
                HStack {
                    Text(project.name)
                        .font(.bigHeadline)
                        .bold()
                        .foregroundStyle(Color.white)
                }
                .padding()
                
                HStack (alignment: .center, spacing: 13) {
                    Spacer()
                    StatBubbleView(title: "Hours", stat: String(project.hours), startColor: Color("Navy"), endColor: Color("Sky Blue"))
                    StatBubbleView(title: "Sessions", stat: String(project.sessions), startColor: Color("Turtle Green"), endColor: Color("Lime"))
                    StatBubbleView(title: "Updates", stat: String(project.updates.count), startColor: Color("Tiffany Teal"), endColor: Color("Gem Purple"))
                    StatBubbleView(title: "Wins", stat: String(project.wins), startColor: Color("Maroon"), endColor: Color("Olive"))
                    Spacer()
                }
                if (project.focus.trimmingCharacters(in: .whitespacesAndNewlines) != "") {
                    Text("My Current Focus")
                        .font(.featuredText)
                        .foregroundStyle(.gray)
                        .bold()
                    Text(project.focus)
                        .font(.featuredText)
                        .foregroundStyle(Color.gray)
                        .bold()
                }
            }
            .padding(/*@START_MENU_TOKEN@*/[.leading, .bottom, .trailing]/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    ProjectCardView(project: Project())
}
