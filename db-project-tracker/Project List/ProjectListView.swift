//
//  ContentView.swift
//  db-project-tracker
//
//  Created by Wilson Chan on 1/3/24.
//

import SwiftUI

struct ProjectListView: View {
    
    var body: some View {
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
                        ProjectCardView()
                        ProjectCardView()
                        ProjectCardView()
                        ProjectCardView()
                        ProjectCardView()
                       
                    }
                }
            }
            .padding()
            
            VStack {
                Spacer()
                HStack {
                    Button(action: {
                        //To do
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
}

#Preview {
    ProjectListView()
}
