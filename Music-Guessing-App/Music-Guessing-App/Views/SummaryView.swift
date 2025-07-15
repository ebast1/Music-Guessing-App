//
//  SummaryView.swift
//  Music-Guessing-App
//
//  Created by Ethan Bast on 7/1/25.
//

import SwiftUI

struct SummaryView: View {
    @Binding var path: [GameNavigation]
    
    var body: some View {
        Spacer()
        
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        
        Spacer()
        
        Button("Back to Home Screen") {
            path = []
        }
        .buttonStyle(HomeButtonStyle())
        .clipShape(RoundedRectangle(cornerRadius: 8))
        
    }
}

#Preview {
    SummaryView(path: .constant([]))
}
