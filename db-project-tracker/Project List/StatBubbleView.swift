//
//  StatBubbleView.swift
//  db-project-tracker
//
//  Created by Wilson Chan on 1/15/24.
//

import SwiftUI

struct StatBubbleView: View {
    
    var title: String
    var stat: String
    var startColor: Color
    var endColor: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(LinearGradient(colors: [startColor, endColor],
                                     startPoint: .topLeading,
                                     endPoint: .bottomTrailing))
            VStack {
                Text(title)
                    .font(.captionText)
                Text(stat)
                    .font(.featuredNumber)
                    .bold()
            }
            .foregroundStyle(.white)
            
        }
        .frame(width: 60, height: 40)
    }
}

#Preview {
    StatBubbleView(title: "Hours", stat: "123", startColor: Color("Navy"), endColor: Color("Blue"))
}
