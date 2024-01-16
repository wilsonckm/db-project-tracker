//
//  ContentView.swift
//  db-project-tracker
//
//  Created by Wilson Chan on 1/3/24.
//

import SwiftUI
import SwiftData

struct ProjectListView: View {
    
    @Query private var project: [Project]
    @State private var newProject: Project?
    
    var body: some View {
        
        NavigationStack {
            ZStack {
                LinearGradient(colors: [Color("Deep Purple"), Color("Blush Pink")],
                               startPoint: .top,
                               endPoint: .bottom)
                .ignoresSafeArea()
                
                VStack (alignment: .leading) {
                    Text("Projects")
                        .font(.screenHeading)
                        .foregroundStyle(Color.white)
                    
                    ScrollView (showsIndicators: false) {
                        VStack (alignment: .leading,  spacing: 26) {
                            ForEach(project) { p in
                                NavigationLink {
                                    ProjectDetailView(project: p)
                                } label: {
                                    ProjectCardView(project: p)
                                }
                                .buttonStyle(.plain)
                            }
                            
                        }
                    }
                }
                .padding()
                
                VStack {
                    Spacer()
                    HStack {
                        Button(action: {
                            //To do: create new project
                            self.newProject = Project()
                        }, label: {
                            ZStack {
                                Circle()
                                    .frame(width: 65)
                                    .foregroundColor(.black)
                                Image("cross")
                            }
                        })
                        Spacer()
                    }
                    .padding()
                    
                }
            }
        }
        .sheet(item: $newProject) { project in AddProjectView(project: project)
                .presentationDetents([.fraction(0.2)])
            
        }
    }
}

#Preview {
    ProjectListView()
}
