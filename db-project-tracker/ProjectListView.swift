//
//  ContentView.swift
//  db-project-tracker
//
//  Created by Wilson Chan on 1/3/24.
//

import SwiftUI

struct ProjectListView: View {
    var body: some View {
        VStack {
            Image("cross")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
                .font(Font.screenHeading)
                .foregroundStyle(Color("Olive"))
        }
        .padding()
    }
}

#Preview {
    ProjectListView()
}
