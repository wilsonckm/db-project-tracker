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
                .shadow(radius: 10)
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
                    StatBubbleView(title: "Hours", stat: "123", startColor: Color("Navy"), endColor: Color("Blue"))
                    StatBubbleView(title: "Sessions", stat: "34", startColor: Color("Turtle Green"), endColor: Color("Lime"))
                    StatBubbleView(title: "Updates", stat: "32", startColor: Color("Tiffany Teal"), endColor: Color("Gem Purple"))
                    StatBubbleView(title: "Wins", stat: "9", startColor: Color("Maroon"), endColor: Color("Olive"))
                    Spacer()
                }
                Text("My Current Focus")
                    .font(.featuredText)
                    .foregroundStyle(.gray)
                    .bold()
                Text("Design the new website")
                    .font(.featuredText)
                    .foregroundStyle(Color.gray)
                    .bold()
            }
            .padding(/*@START_MENU_TOKEN@*/[.leading, .bottom, .trailing]/*@END_MENU_TOKEN@*/)
        }
    }
}

#Preview {
    ProjectCardView(project: Project())
}
