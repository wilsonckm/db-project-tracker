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
    @State private var showProjectDetail: Bool = false
    @State private var selectedProject: Project?
    
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
                                
                                ProjectCardView(project: p)
                                    .onTapGesture {
                                        selectedProject = p
                                    }
                                    .onLongPressGesture {
                                        newProject = p
                                    }
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
            .navigationDestination(item: $selectedProject) { project in
                ProjectDetailView(project: project)
            }
        }
        .sheet(item: $newProject) { project in
            let isEdit = project.name.trimmingCharacters(in: .whitespacesAndNewlines) != ""
            EditProjectView(project: project, isEditMode: isEdit)
                .presentationDetents([.fraction(0.2)])
            
        }
    }
}

#Preview {
    ProjectListView()
}
