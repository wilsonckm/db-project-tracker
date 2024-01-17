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
    @State private var update: ProjectUpdate?
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [Color("Navy"), Color("Tiffany Teal")], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            LinearGradient(colors: [Color("Washed Blue").opacity(0), Color("Sky Blue")], startPoint: .top, endPoint: .bottom)
                .frame(width: 1)
                .padding(.leading, -150)
            VStack {
                VStack(alignment: .leading) {
                    Text(project.name)
                        .font(.screenHeading)
                    HStack (alignment: .center, spacing: 13) {
                        Spacer()
                        StatBubbleView(title: "Hours", stat: "123", startColor: Color("Navy"), endColor: Color("Blue"))
                        StatBubbleView(title: "Sessions", stat: "34", startColor: Color("Turtle Green"), endColor: Color("Lime"))
                        StatBubbleView(title: "Updates", stat: "32", startColor: Color("Tiffany Teal"), endColor: Color("Gem Purple"))
                        StatBubbleView(title: "Wins", stat: "9", startColor: Color("Maroon"), endColor: Color("Olive"))
                        Spacer()
                    }
                    Text("My current focus is...")
                        .font(.featuredText)
                    HStack {
                        Image(systemName: "checkmark.square")
                        Text("Design the new website")
                            .font(.featuredText)
                        
                        
                    }
                }
                .foregroundStyle(.white)
                .padding()
                .background {
                    Color.black
                        .opacity(0.7)
                        .clipShape(.rect(bottomLeadingRadius: 15, bottomTrailingRadius: 15))
                        .ignoresSafeArea()
                }
                ScrollView (showsIndicators: false) {
                    VStack(spacing: 27) {
                        ForEach(project.updates) { update in
                            ProjectUpdateView(update: update)
                        }
                    }
                    .padding()
                }
            }
            VStack {
                Spacer()
                HStack {
                    Button(action: {
                        self.update = ProjectUpdate()
                    }, label: {
                        ZStack {
                            Circle()
                                .foregroundStyle(.black)
                                .frame(width: 65)
                            Image("cross")
                        }
                    })
                    .padding([.leading, .top])
                    Spacer()
                    Button("Back") {
                        dismiss()
                    }
                    .buttonStyle(.borderedProminent)
                    .foregroundStyle(.white)
                    .tint(.black)
                    .padding([.trailing, .top])
                }
                .background {
                    Color(.black)
                        .opacity(0.5)
                        .clipShape(.rect(topLeadingRadius: 15, topTrailingRadius: 15))
                        .ignoresSafeArea()
                }
            }

        }
        
        .navigationBarBackButtonHidden(false)
        .sheet(item: $update) { update in
            AddUpdateView(project: project, update: update)
                .presentationDetents([.fraction(0.3)])
        }
        
    }
}


#Preview {
    ProjectDetailView(project: Project())
}
